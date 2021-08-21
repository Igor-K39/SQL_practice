/* 
   В таблицу buy_book добавить заказ с номером 5. Этот заказ должен содержать 
   книгу Пастернака «Лирика» в количестве двух экземпляров и 
   книгу Булгакова «Белая гвардия» в одном экземпляре.
*/

/* 
   MySQL 
INSERT INTO buy_book(buy_id, book_id, amount)
SELECT 5, book_id, 2
  FROM book INNER JOIN author USING(author_id)
 WHERE title = 'Лирика'
       AND name_author LIKE 'Пастернак %';

INSERT INTO buy_book(buy_id, book_id, amount)
SELECT 5, book_id, 1
  FROM book INNER JOIN author USING(author_id)
 WHERE title = 'Белая гвардия'
       AND name_author LIKE 'Булгаков %';
*/

INSERT INTO stepik.buy_book(buy_id, book_id, amount)
SELECT 5, book_id, 2
  FROM stepik.book INNER JOIN stepik.author USING(author_id)
 WHERE title = 'Лирика'
       AND name_author LIKE 'Пастернак %';

INSERT INTO stepik.buy_book(buy_id, book_id, amount)
SELECT 5, book_id, 1
  FROM stepik.book INNER JOIN stepik.author USING(author_id)
 WHERE title = 'Белая гвардия'
       AND name_author LIKE 'Булгаков %';