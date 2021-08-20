/*
   Вывести сумму суточных (произведение количества дней командировки и размера суточных) 
   для командировок, первый день которых пришелся на февраль или март 2020 года. 
   Значение суточных для каждой командировки занесено в столбец per_diem. 
   Вывести фамилию и инициалы сотрудника, город, первый день командировки и сумму суточных. 
   Последний столбец назвать Сумма. Информацию отсортировать сначала в алфавитном порядке 
   по фамилиям сотрудников, а затем по убыванию суммы суточных.
*/

/* 
   MySQL 

SELECT name, city, date_first, per_diem * (DATEDIFF(date_last, date_first) + 1) AS Сумма
  FROM trip
 WHERE MONTHNAME(date_first) = "February"
    OR MONTHNAME(date_first) = "March"
 ORDER BY name, Сумма DESC

 */

/* Postgres */
SELECT name, city, date_first, 
       per_diem * (DATE_PART('day', date_last::timestamp - date_first::timestamp) + 1) AS Сумма
  FROM trip
 WHERE EXTRACT(MONTH FROM date_first)::integer = 2 -- February
    OR EXTRACT(MONTH FROM date_first)::integer = 3 -- March
 ORDER BY name, Сумма DESC
