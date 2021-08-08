/*
   Для тех книг в таблице book , которые есть в таблице supply, не только увеличить их количество в таблице book 
   (увеличить их количество на значение столбца amountтаблицы supply), но и пересчитать их цену (для каждой книги 
   найти сумму цен из таблиц book и supply и разделить на 2).
*/

UPDATE book
   SET amount = book.amount + supply.amount, 
       price = (book.price + supply.price) / 2
  FROM supply
 WHERE book.title = supply.title
   AND book.title IN (SELECT title FROM supply);

 SELECT * FROM book;
