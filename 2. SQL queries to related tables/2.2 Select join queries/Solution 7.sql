/*
   Вывести информацию о книгах (название книги, фамилию и инициалы автора, название 
   жанра, цену и количество экземпляров книг), написанных в самых популярных жанрах, 
   в отсортированном в алфавитном порядке по названию книг виде. Самым популярным 
   считать жанр, общее количество экземпляров книг которого на складе максимально.

   +-----------------------+------------------+------------+--------+--------+
   | title                 | name_author      | name_genre | price  | amount |
   +-----------------------+------------------+------------+--------+--------+
   | Белая гвардия         | Булгаков М.А.    | Роман      | 540.50 | 5      |
   | Братья Карамазовы     | Достоевский Ф.М. | Роман      | 799.01 | 3      |
   | Игрок                 | Достоевский Ф.М. | Роман      | 480.50 | 10     |
   | Идиот                 | Достоевский Ф.М. | Роман      | 460.00 | 10     |
   | Лирика                | Пастернак Б.Л.   | Поэзия     | 518.99 | 10     |
   | Мастер и Маргарита    | Булгаков М.А.    | Роман      | 670.99 | 3      |
   | Стихотворения и поэмы | Есенин С.А.      | Поэзия     | 650.00 | 15     |
   | Черный человек        | Есенин С.А.      | Поэзия     | 570.20 | 6      |
   +-----------------------+------------------+------------+--------+--------+
*/

/*
   MySQL

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
*/

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

