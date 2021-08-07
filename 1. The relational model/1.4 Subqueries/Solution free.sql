INSERT INTO book(title, author, price, amount) 
     VALUES ('Руководство полного идиота по программированию', 'Богатырёв Андрей', 1000.03, 10);

SELECT title, author, price, amount
  FROM book
 WHERE author IN (SELECT author
                    FROM book
                   GROUP BY author
                  HAVING COUNT(amount) - COUNT(DISTINCT amount) = 0
                 )