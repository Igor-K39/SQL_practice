/*
   Вывести номера всех оплаченных заказов и даты, когда они были оплачены.
*/

/* 
   MySQL

SELECT buy_id, date_step_end
  FROM buy_step INNER JOIN step USING(step_id)
 WHERE name_step = 'Оплата'
       AND NOT isNull(date_step_end) 
*/

/* Postgres */

SELECT buy_id, date_step_end
  FROM stepik.buy_step INNER JOIN stepik.step USING(step_id)
 WHERE name_step = 'Оплата'
       AND date_step_end IS NOT NULL 

