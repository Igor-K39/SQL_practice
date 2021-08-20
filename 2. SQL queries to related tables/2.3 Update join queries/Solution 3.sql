/*
   Добавить новые книги из таблицы supply в таблицу book. Затем вывести для просмотра таблицу book. 
   См. запросы в лекциях.
*/

INSERT INTO book(title, author_id, price, amount)
SELECT title, author_id, price, amount
FROM 
    author 
    INNER JOIN supply ON author.name_author = supply.author
WHERE amount <> 0;

SELECT * FROM book;
