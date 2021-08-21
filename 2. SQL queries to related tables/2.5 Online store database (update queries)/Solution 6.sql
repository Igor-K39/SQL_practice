/*
   Создать общий счет (таблицу buy_pay) на оплату заказа с номером 5. Куда включить номер заказа, 
   количество книг в заказе (название столбца Количество) и его общую стоимость (название столбца Итого).  
   Для решения используйте ОДИН запрос.
*/

/* 
   MySQL

CREATE TABLE buy_pay AS 
SELECT buy_id, SUM(buy_book.amount) AS Количество, SUM(buy_book.amount * book.price) AS Итого
  FROM buy_book INNER JOIN book USING(book_id)
 WHERE buy_id = 5
 GROUP BY buy_id;
 
 SELECT * FROM buy_pay;
*/

/* Postgres */
CREATE TABLE buy_pay AS 
SELECT buy_id, SUM(buy_book.amount) AS Количество, SUM(buy_book.amount * book.price) AS Итого
  FROM buy_book INNER JOIN book USING(book_id)
 WHERE buy_id = 5
 GROUP BY buy_id;
 
SELECT * FROM buy_pay;