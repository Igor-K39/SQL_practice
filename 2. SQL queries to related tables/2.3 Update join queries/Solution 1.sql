/* 
   Для книг, которые уже есть на складе (в таблице book), но по другой цене, чем в поставке (supply),  
   необходимо в таблице book увеличить количество на значение, указанное в поставке,  и пересчитать цену. 
   А в таблице  supply обнулить количество этих книг. Формула для пересчета цены:
   
   price= (book_price * book_amount + supply_price * supply_amount) \ (book_amount + supply_amount)
*/
 
/*
   MySQL

UPDATE book INNER JOIN author USING(author_id)
            INNER JOIN supply ON author.name_author = supply.author
                             AND book.title = supply.title
   SET book.amount = book.amount + supply.amount,
       book.price = (book.price * book.amount + supply.price * supply.amount) / (book.amount + supply.amount),
       supply.amount = 0
 WHERE book.price <> supply.price
*/

/* 
   Postgres
*/
WITH old_supply AS (
    SELECT price, amount, author, title 
     FROM supply
),  
updated_supply AS (
   UPDATE supply
      SET amount = 0
     FROM book INNER JOIN author USING(author_id)
    WHERE supply.title  = book.title
      AND supply.author = author.name_author
      AND supply.price <> book.price 
)
UPDATE book
   SET amount = book.amount + old_supply.amount,
       price  = (book.price * book.amount + old_supply.price * old_supply.amount) / (book.amount + old_supply.amount) 
  FROM author, old_supply
 WHERE book.author_id = author.author_id
   AND name_author = old_supply.author
   AND book.title = old_supply.title
   AND book.price <> old_supply.price;
