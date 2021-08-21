/* 
   В таблицу buy_step для заказа с номером 5 включить все этапы из таблицы step, 
   которые должен пройти этот заказ. В столбцы date_step_beg и date_step_end всех 
   записей занести Null.
*/ 

/*
   MySQL

INSERT INTO buy_step(buy_id, step_id)
SELECT 5, step_id
  FROM step;
  
SELECT * FROM buy_step;
*/

/* Postgres */
INSERT INTO stepik.buy_step(buy_id, step_id)
SELECT 5, step_id
  FROM stepik.step;
  
SELECT * FROM stepik.buy_step;