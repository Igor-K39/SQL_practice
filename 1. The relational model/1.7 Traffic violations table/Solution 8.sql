/*
   Удалить из таблицы fine информацию о нарушениях, 
   совершенных раньше 1 февраля 2020 года.
*/

/* 
   MySQL

DELETE FROM fine
 WHERE DATEDIFF(date_violation, "2020-02-01") < 0;
*/

/* Postgres */
DELETE FROM fine
 WHERE DATE_PART('day', date_violation - '2020-02-01'::timestamp) < 0;
