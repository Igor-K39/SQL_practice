/*
   Вывести все жанры, которые не представлены 
   в книгах на складе.
*/

/* 
   MySQL

SELECT name_genre
  FROM book RIGHT JOIN genre ON book.genre_id = genre.genre_id
 WHERE isNull(book.genre_id)
 */

 /* Postgres */
SELECT name_genre
  FROM book RIGHT JOIN genre ON book.genre_id = genre.genre_id
 WHERE book.genre_id IS NULL