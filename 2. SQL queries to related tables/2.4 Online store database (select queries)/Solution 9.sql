/* 
   Вывести жанр (или жанры), в котором было заказано больше всего экземпляров книг, указать это количество . 
   Последний столбец назвать Количество.
*/

/* 
   MySQL

SELECT name_genre, SUM(buy_book.amount) AS Количество
  FROM stepik.buy_book INNER JOIN stepik.book  USING(book_id)
                       INNER JOIN stepik.genre USING(genre_id)
 GROUP BY name_genre, genre_id
HAVING genre_id IN (SELECT genre_id 
  FROM ((SELECT genre_id, SUM(buy_book.amount) AS amount
  		  FROM stepik.buy_book INNER JOIN book USING(book_id)
		 GROUP BY title, genre_id) genres
		
		INNER JOIN
		
		(SELECT SUM(buy_book.amount) AS amount
  		  FROM stepik.buy_book INNER JOIN book USING(book_id)
 		 GROUP BY title
 		 ORDER BY amount DESC
 		 LIMIT 1) amounts
	   
	   ON genres.amount = amounts.amount))
*/

/* Postgres */
WITH amounts AS (
         SELECT SUM(buy_book.amount) AS amount
           FROM stepik.buy_book INNER JOIN book USING(book_id)
 	      GROUP BY title
 	      ORDER BY amount DESC
 	      LIMIT 1),
	 
	 genres AS (
	     SELECT genre_id, SUM(buy_book.amount) AS amount
  		   FROM stepik.buy_book INNER JOIN book USING(book_id)
		  GROUP BY title, genre_id
	 )
	 
SELECT name_genre, SUM(buy_book.amount) AS Количество
  FROM stepik.buy_book INNER JOIN stepik.book  USING(book_id)
                       INNER JOIN stepik.genre USING(genre_id)
 GROUP BY name_genre, genre_id
 HAVING genre_id IN (SELECT genre_id
					   FROM amounts INNER JOIN genres ON amounts.amount = genres.amount);
  			     
