/* 
   Вывести все заказы Баранова Павла (id заказа, какие книги, по какой цене 
   и в каком количестве он заказал) в отсортированном по номеру заказа 
   и названиям книг виде.
*/

SELECT buy_id, title, price, buy_book.amount
  FROM stepik.buy_book INNER JOIN stepik.buy    USING(buy_id)
                	   INNER JOIN stepik.book   USING(book_id)
                	   INNER JOIN stepik.client USING(client_id)
 WHERE name_client = 'Баранов Павел'
 ORDER BY buy_id, title