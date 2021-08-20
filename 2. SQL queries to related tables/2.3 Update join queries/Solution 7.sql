/*
   Удалить всех авторов, которые пишут в жанре "Поэзия". Из таблицы book удалить все книги этих авторов. В запросе для отбора авторов использовать полное название жанра, а не его id.
*/

/* 
   MySQL
   
DELETE FROM author
 USING book INNER JOIN author USING(author_id)
            INNER JOIN genre  USING(genre_id)
 WHERE name_genre = "Поэзия"
*/

/* Postgres */
DELETE FROM author
 USING book INNER JOIN genre USING(genre_id)
 WHERE book.author_id = author.author_id
       AND name_genre = 'Поэзия'