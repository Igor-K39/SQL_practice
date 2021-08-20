/*
   Включить новых авторов в таблицу author с помощью запроса на добавление, а затем вывести все данные из таблицы author.  Новыми считаются авторы, которые есть в таблице supply, но нет в таблице author.
*/

/* 
   MySQL

SELECT name_genre
  FROM book RIGHT JOIN genre ON book.genre_id = genre.genre_id
 WHERE isNull(book.genre_id)
*/

/* Postgres */
INSERT INTO author(name_author)
SELECT author
  FROM author RIGHT JOIN supply ON author.name_author = supply.author
 WHERE name_author IS null