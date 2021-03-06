/*
   Вывести название месяца и количество командировок для каждого месяца. 
   Считаем, что командировка относится к некоторому месяцу, если она 
   началась в этом месяце. Информацию вывести сначала в отсортированном 
   по убыванию количества, а потом в алфавитном порядке по названию месяца виде. 
   Название столбцов – Месяц и Количество.
*/

/* MySQL

SELECT MONTHNAME(date_first) AS Месяц, COUNT(MONTHNAME(date_first)) AS Количество
  FROM trip
 GROUP BY Месяц
 ORDER BY Количество DESC, Месяц
*/

/* Postgres */
SELECT TO_CHAR(date_first, 'Month') AS Месяц, COUNT(TO_CHAR(date_first, 'Month')) AS Количество
  FROM trip
 GROUP BY Месяц
 ORDER BY Количество DESC, Месяц