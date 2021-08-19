/*
   Посчитать количество экземпляров  книг каждого автора из таблицы author.  
   Вывести тех авторов,  количество книг которых меньше 10, 
   в отсортированном по возрастанию количества виде. Последний столбец назвать Количество.
*/

SELECT name_author, SUM(amount) AS Количество
  FROM book 
       RIGHT JOIN author ON book.author_id = author.author_id
 GROUP BY name_author
HAVING SUM(book.amount) < 10 OR (SUM(book.amount) IS NULL)
 ORDER BY Количество 