/* 
   В таблицу buy_step занести дату 12.04.2020 выставления счета на оплату заказа 
   с номером 5.

   Правильнее было бы занести не конкретную, а текущую дату. Это можно сделать 
   с помощью функции Now(). Но при этом в разные дни будут вставляться разная дата, 
   и задание нельзя будет проверить, поэтому  вставим дату 12.04.2020.
*/

/*
   MySQL

UPDATE buy_step INNER JOIN step USING(step_id)
   SET date_step_beg = '2020-04-12'
 WHERE buy_id = 5
       and name_step = 'Оплата'
*/

/* Postgres */
UPDATE stepik.buy_step 
   SET date_step_beg = '2020-04-12'
  FROM stepik.step
 WHERE buy_step.step_id = step.step_id
 	   AND buy_id = 5
       AND name_step = 'Оплата'