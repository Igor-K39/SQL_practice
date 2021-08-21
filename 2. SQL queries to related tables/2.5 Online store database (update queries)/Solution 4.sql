/*
   Уменьшить количество тех книг на складе, которые были включены в заказ с номером 5.
*/

/* 
   MySQL
UPDATE book INNER JOIN buy_book USING(book_id) 
   SET book.amount = book.amount - buy_book.amount
 WHERE buy_book.buy_id = 5
*/

/* Postgres */
UPDATE stepik.book  
   SET amount = book.amount - buy_book.amount
  FROM stepik.buy_book 
 WHERE book.book_id = buy_book.book_id 
       AND buy_book.buy_id = 5;
