/*
   Вывести информацию о книгах (жанр, книга, автор), 
   относящихся к жанру, включающему слово «роман» 
   в отсортированном по названиям книг виде.
*/

SELECT name_genre, title, name_author
  FROM book
	   INNER JOIN author ON book.author_id = author.author_id
       INNER JOIN genre  ON book.genre_id  = genre.genre_id
 WHERE name_genre = 'Роман'
 ORDER BY title