/* 
   Посчитать, количество различных книг и количество экземпляров книг каждого автора , 
   хранящихся на складе.  Столбцы назвать Автор, Различных_книг, Количество_экземпляров.
*/

SELECT author AS Автор, COUNT(title) AS "Различных_книг", SUM(amount) AS "Количество_экземпляров"
  FROM book
 GROUP BY author 