/*
   В конце года цену всех книг на складе пересчитывают – снижают ее на 30%. 
   Написать SQL запрос, который из таблицы book выбирает названия, авторов, количества и вычисляет новые цены книг. 
   Столбец с новой ценой назвать new_price, цену округлить до 2-х знаков после запятой.
*/

SELECT title, author, amount, ROUND(price * 0.7, 2) AS new_price
  FROM book