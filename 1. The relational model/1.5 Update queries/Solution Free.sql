CREATE TABLE difference AS
    SELECT title, author, price, amount
      FROM book
     WHERE title NOT IN (SELECT title 
                           FROM supply);
     
SELECT * FROM difference;