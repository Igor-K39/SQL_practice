/*
   Сравнить ежемесячную выручку от продажи книг за текущий и предыдущий годы.
   Для этого вывести год, месяц, сумму выручки в отсортированном сначала 
   по возрастанию месяцев, затем по возрастанию лет виде. Название столбцов: Год, Месяц, Сумма.
*/

/* 
   MySQL

SELECT YEAR(date_step_end) AS Год,
       MONTHNAME(date_step_end) AS Месяц,
       SUM(book.price * buy_book.amount) AS Сумма
  FROM buy INNER JOIN buy_book USING(buy_id)
           INNER JOIN buy_step USING(buy_id)
           INNER JOIN step     USING(step_id)
           INNER JOIN book     USING(book_id)
  WHERE name_step = 'Оплата'
    AND date_step_end IS NOT NULL
  GROUP BY Год, Месяц
  
  UNION 
  
SELECT YEAR(date_payment) AS Год,
       MONTHNAME(date_payment) AS Месяц,
       SUM(price * amount) AS Сумма
  FROM buy_archive
 WHERE date_payment IS NOT NULL
 GROUP BY Год, Месяц
 
 ORDER BY Месяц, Год
*/

/* Postgres */
SELECT EXTRACT(YEAR  FROM date_step_end)::integer AS Год,
       TO_CHAR(date_step_end::timestamp, 'Month') AS Месяц,
	     SUM(book.price * buy_book.amount) AS Сумма
  FROM stepik.buy INNER JOIN stepik.buy_book USING(buy_id)
  				        INNER JOIN stepik.buy_step USING(buy_id)
				          INNER JOIN stepik.step 	   USING(step_id)
				          INNER JOIN stepik.book     USING(book_id)
  WHERE name_step = 'Оплата'
    AND date_step_end IS NOT NULL
  GROUP BY Год, Месяц
  
  UNION 
  
SELECT EXTRACT(YEAR  FROM date_payment) AS Год,
	     TO_CHAR(date_payment::timestamp, 'Month') AS Месяц,
 	     SUM(price * amount) AS Сумма
  FROM stepik.buy_archive
 WHERE date_payment IS NOT NULL
 GROUP BY Год, Месяц