/*
   Вывести информацию о командировках сотрудника(ов), 
   которые были самыми короткими по времени. 
   В результат включить столбцы name, city, date_first, date_last.
*/

 SELECT name, city, date_first, date_last
  FROM trip
 WHERE DATE_PART('day', date_last::timestamp - date_first::timestamp) = 
 				(SELECT MIN(DATE_PART('day', date_last::timestamp - date_first::timestamp)) FROM trip) 