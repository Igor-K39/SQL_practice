/*
   Для каждой отдельной книги необходимо вывести информацию о количестве проданных экземпляров 
   и их стоимости за текущий и предыдущий год . Вычисляемые столбцы назвать Количество и Сумма. 
   Информацию отсортировать по убыванию стоимости.
*/

/* 
   MySQL

SELECT title, SUM(Количество) AS Количество, SUM(Сумма) AS Сумма 
  FROM (SELECT title, SUM(buy_book.amount) AS Количество, SUM(book.price * buy_book.amount) AS Сумма
          FROM buy_book INNER JOIN buy      USING(buy_id)
                        INNER JOIN buy_step USING(buy_id)
                        INNER JOIN step     USING(step_id)
                        INNER JOIN book     USING(book_id)
         WHERE name_step = 'Оплата'
               AND not isNull(date_step_end)
         GROUP BY title       
 
         UNION 
 
        SELECT title, sum(buy_archive.amount) AS amount, sum(buy_archive.price * buy_archive.amount) AS total
          FROM buy_archive INNER JOIN book ON buy_archive.book_id = book.book_id
         GROUP BY title) all_sales
 GROUP BY title
 ORDER BY Сумма DESC
*/

/* Postgres */
SELECT title, SUM(Количество) AS Количество, SUM(Сумма) AS Сумма 
  FROM (SELECT title, SUM(buy_book.amount) AS Количество, SUM(book.price * buy_book.amount) AS Сумма
          FROM stepik.buy_book INNER JOIN stepik.buy      USING(buy_id)
                               INNER JOIN stepik.buy_step USING(buy_id)
                               INNER JOIN stepik.step     USING(step_id)
                               INNER JOIN stepik.book     USING(book_id)
         WHERE name_step = 'Оплата'
               AND date_step_end IS NOT NULL 
         GROUP BY title       
 
         UNION 
 
        SELECT title, sum(buy_archive.amount) AS amount, sum(buy_archive.price * buy_archive.amount) AS total
          FROM stepik.buy_archive INNER JOIN stepik.book ON buy_archive.book_id = book.book_id
         GROUP BY title) all_sales
 GROUP BY title
 ORDER BY Сумма DESC