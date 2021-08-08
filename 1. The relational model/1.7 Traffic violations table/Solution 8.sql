/*
   Удалить из таблицы fine информацию о нарушениях, 
   совершенных раньше 1 февраля 2020 года.
*/

SELECT name, number_plate, sum_fine, date_violation FROM fine;

DELETE FROM fine
 WHERE DATE_PART('day', date_violation - '2020-02-01'::timestamp) < 0;

SELECT name, number_plate, sum_fine, date_violation FROM fine;