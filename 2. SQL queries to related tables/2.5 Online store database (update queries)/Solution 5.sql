/*
   Создать счет (таблицу buy_pay) на оплату заказа с номером 5, в который включить название книг, 
   их автора, цену, количество заказанных книг и  стоимость. Последний столбец назвать Стоимость. 
   Информацию в таблицу занести в отсортированном по названиям книг виде.
*/

/*
   MySQL

CREATE TABLE buy_pay AS
SELECT title, name_author, price, buy_book.amount, buy_book.amount * book.price AS Стоимость
  FROM buy_book INNER JOIN book   USING(book_id) 
                INNER JOIN author USING(author_id)
 WHERE buy_id = 5
 ORDER BY title;
 
SELECT * FROM buy_pay;
*/

/* Postgres */
CREATE TABLE buy_pay AS
SELECT title, name_author, price, buy_book.amount, buy_book.amount * book.price AS Стоимость
  FROM stepik.buy_book INNER JOIN stepik.book   USING(book_id) 
                	   INNER JOIN stepik.author USING(author_id)
 WHERE buy_id = 5
 ORDER BY title;
 
SELECT * FROM buy_pay;