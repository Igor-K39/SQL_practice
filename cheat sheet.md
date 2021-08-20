# Logical features

### IF vs. CASE
```sql
/* MySQL */
UPDATE book
   SET buy   = IF(buy > amount, amount, buy),
       price = IF(buy = 0, price * 0.9, price);

SELECT * FROM book; 

/* Postgres */
UPDATE book
   SET buy   = CASE WHEN buy > amount THEN amount      ELSE buy   END,
       price = CASE WHEN buy = 0      THEN price * 0.9 ELSE price END;	   
```

### Is null
```sql

/* MySQL */
SELECT name_genre
  FROM book RIGHT JOIN genre ON book.genre_id = genre.genre_id
 WHERE isNull(book.genre_id)


/* Postgres */
SELECT name_genre
  FROM book RIGHT JOIN genre ON book.genre_id = genre.genre_id
 WHERE book.genre_id IS NULL
```

# DML / DDL features

### Delete using JOIN
```sql
/* MySQL */
DELETE FROM author
 USING book INNER JOIN author USING(author_id)
            INNER JOIN genre  USING(genre_id)
 WHERE name_genre = 'Поэзия'

/* Postgres */
DELETE FROM author
 USING book INNER JOIN genre USING(genre_id)
 WHERE book.author_id = author.author_id
       AND name_genre = 'Поэзия'
```
### Using WITH (Postgres) vs. Subquery (MySQL)
```sql
/* Postgres */
WITH the_amount AS (
  SELECT genre_id, SUM(amount) AS amount_sum
    FROM book
   GROUP BY genre_id
   ORDER BY SUM(amount) DESC
   LIMIT 1
), the_genres AS (
  SELECT genre_id
    FROM book
   GROUP BY genre_id
  HAVING SUM(amount) IN (SELECT amount_sum FROM the_amount)
)
   
SELECT title, name_author, name_genre, amount, price, amount
  FROM book INNER JOIN author USING(author_id)
            INNER JOIN genre  USING(genre_id)
 WHERE genre_id IN (SELECT genre_id FROM the_genres)
 ORDER BY title

/* MySQL */
SELECT title, name_author, name_genre, price, amount
  FROM book INNER JOIN author ON book.author_id = author.author_id
            INNER JOIN genre  ON book.genre_id = genre.genre_id
 GROUP BY  book.genre_id, amount, name_author, name_genre, price, title
HAVING book.genre_id IN (SELECT right_query.genre_id
                           FROM (SELECT genre_id, SUM(amount) AS amount
                                   FROM book
                                  GROUP BY genre_id
                                  ORDER BY SUM(amount) DESC
                                  LIMIT 1) left_query INNER JOIN (SELECT genre_id, SUM(amount) AS amount
                                                                    FROM book
                                                                   GROUP BY genre_id) right_query
                                                      ON left_query.amount = right_query.amount)
ORDER BY title
```
### Using WITH + UPDATE ... FROM (Postgres) vs. UPDATE ... JOIN (MySQL)
```sql
/* Postgres */
WITH old_supply AS (
    SELECT price, amount, author, title 
     FROM supply
),  
updated_supply AS (
   UPDATE supply
      SET amount = 0
     FROM book INNER JOIN author USING(author_id)
    WHERE supply.title  = book.title
      AND supply.author = author.name_author
      AND supply.price <> book.price 
)
UPDATE book
   SET amount = book.amount + old_supply.amount,
       price  = (book.price * book.amount + old_supply.price * old_supply.amount) 
       		    / (book.amount + old_supply.amount) 
  FROM author, old_supply
 WHERE book.author_id = author.author_id
   AND name_author = old_supply.author
   AND book.title = old_supply.title
   AND book.price <> old_supply.price;

/* MySQL */
UPDATE book INNER JOIN author USING(author_id)
            INNER JOIN supply ON author.name_author = supply.author
                             AND book.title = supply.title
   SET book.amount = book.amount + supply.amount,
       book.price = (book.price * book.amount + supply.price * supply.amount) 
                        / (book.amount + supply.amount),
       supply.amount = 0
 WHERE book.price <> supply.price
```

### Update by values from a temporary table
```sql
UPDATE book
   SET genre_id = 
    (
        SELECT genre_id
          FROM genre
         WHERE name_genre = 'Поэзия'
    )
 WHERE book_id = 12;
```

### WHERE IN subquery example
```sql
DELETE FROM author
 WHERE author_id IN (SELECT author_id 
                       FROM book
                      GROUP BY author_id
                     HAVING SUM(amount) < 20);
```



# Working with DATES

### Date difference
```sql
/* MySQL */
DELETE FROM fine
 WHERE DATEDIFF(date_violation, "2020-02-01") < 0;

SELECT name, city, date_first, date_last
  FROM trip
 WHERE DATEDIFF(date_last, date_first) = (SELECT MIN(DATEDIFF(date_last, date_first)) FROM trip) 

/* Postgres */
DELETE FROM fine
 WHERE DATE_PART('day', date_violation - '2020-02-01'::timestamp) < 0;

SELECT name, city, date_first, date_last
  FROM trip
 WHERE DATE_PART('day', date_last::timestamp - date_first::timestamp) = 
 				(SELECT MIN(DATE_PART('day', date_last::timestamp - date_first::timestamp)) FROM trip) 
```

### Extract month name
```sql
/* MySQL */
SELECT MONTHNAME(date_first) AS Месяц, COUNT(MONTHNAME(date_first)) AS Количество
  FROM trip
 GROUP BY Месяц
 ORDER BY Количество DESC, Месяц


/* Postgres */
SELECT TO_CHAR(date_first, 'Month') AS Месяц, COUNT(TO_CHAR(date_first, 'Month')) AS Количество
  FROM trip
 GROUP BY Месяц
 ORDER BY Количество DESC, Месяц
```

### Extract month number
```sql
 /* MySQL */
SELECT name, city, date_first, date_last
  FROM trip
 WHERE MONTH(date_first) = MONTH(date_last) 
 ORDER BY city, name


/* Postgres */
 SELECT name, city, date_first, date_last
  FROM trip
 WHERE EXTRACT(MONTH FROM date_first)::integer = EXTRACT(MONTH FROM date_last)::integer
 ORDER BY city, name
```

### Generating a random date
```sql
/* MySQL */
SELECT name_city, name_author, DATE_ADD('2020-01-01', INTERVAL FLOOR(RAND()*365) DAY) AS Дата
FROM city,author
ORDER BY
    name_city ASC,
    Дата DESC;

/* Postgres */
SELECT name_city, name_author, ('2020-01-01'::DATE + FLOOR(RANDOM() * 365)::INTEGER) AS Дата
  FROM city,author
 ORDER BY name_city, Дата DESC;
```

