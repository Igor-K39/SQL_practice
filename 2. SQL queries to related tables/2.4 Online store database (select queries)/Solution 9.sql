/* 
   Вывести жанр (или жанры), в котором было заказано больше всего экземпляров книг, указать это количество . 
   Последний столбец назвать Количество.
*/

/* 
   MySQL

SELECT name_genre, SUM(buy_book.amount) AS Количество
  FROM buy_book JOIN book  USING(book_id)
  			    JOIN genre USING(genre_id)
 GROUP BY name_genre
 ORDER BY 2 DESC
 LIMIT 1
*/

/* Postgres */
SELECT name_genre, SUM(buy_book.amount) AS bought
  FROM stepik.buy_book JOIN stepik.book  USING(book_id)
  					   JOIN stepik.genre USING(genre_id)
 GROUP BY name_genre
 ORDER BY 2 DESC
 LIMIT 1