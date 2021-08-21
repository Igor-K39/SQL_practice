/*
    Вывести в алфавитном порядке всех авторов, которые пишут только в одном жанре. 
    Поскольку у нас в таблицах так занесены данные, что у каждого автора книги 
    только в одном жанре,  для этого запроса внесем изменения в таблицу book. 
    Пусть у нас  книга Есенина «Черный человек» относится к жанру «Роман», 
    а книга Булгакова «Белая гвардия» к «Приключениям» (эти изменения в таблицы уже внесены).

   +------------------+
   | name_author      |
   +------------------+
   | Достоевский Ф.М. |
   | Пастернак Б.Л.   |
   +------------------+
*/

SELECT name_author
  FROM (SELECT name_author, genre_id
          FROM book INNER JOIN author ON book.author_id = author.author_id
         GROUP BY book.author_id, book.genre_id) in_query
 GROUP BY name_author
HAVING COUNT(genre_id) = 1
 ORDER BY name_author;
 
SELECT name_author, COUNT(DISTINCT(genre_id))
  FROM author INNER JOIN book ON author.author_id = book.author_id
 GROUP BY name_author
HAVING COUNT(DISTINCT(genre_id)) = 1;