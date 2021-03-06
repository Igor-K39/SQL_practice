/*
   Вывести информацию о командировках, начало и конец которых относятся 
   к одному месяцу (год может быть любой). 

   В результат включить столбцы name, city, date_first, date_last. 
   Строки отсортировать сначала  в алфавитном порядке по названию города, 
   а затем по фамилии сотрудника.
*/

/* MySQL
SELECT name, city, date_first, date_last
  FROM trip
 WHERE MONTH(date_first) = MONTH(date_last) 
 ORDER BY city, name
*/

/* Postgres */
 SELECT name, city, date_first, date_last
  FROM trip
 WHERE EXTRACT(MONTH FROM date_first)::integer = EXTRACT(MONTH FROM date_last)::integer
 ORDER BY city, name