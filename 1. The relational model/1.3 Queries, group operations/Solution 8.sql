/*
   Придумайте один или несколько запросов к нашей таблице book, используя групповые функции. 
   Проверьте, правильно ли они работают. 
   Пример: Вывести стоимость и количество всех книг без учёта книги "Мастер и Маргарита", 
   стоимость которых не превышает 10_000. Сгруппировать данные по фамилиям авторов.
*/

SELECT author, SUM(price * amount) AS total_price, SUM(amount) AS total_amount
  FROM book
 WHERE title <> 'Мастер и маргарита'
 GROUP BY author
HAVING SUM(price * amount) < 10000
 ORDER BY total_price DESC  