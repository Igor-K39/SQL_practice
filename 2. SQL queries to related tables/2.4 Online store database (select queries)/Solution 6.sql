/*
   Вывести номера заказов (buy_id) и названия этапов, на которых они 
   в данный момент находятся. Если заказ доставлен –  информацию о нем не выводить. 
   Информацию отсортировать по возрастанию buy_id
*/

/*
   MySQL

SELECT buy_id, name_step
  FROM buy_step INNER JOIN step USING(step_id)
 WHERE NOT isNull(date_step_beg)
       AND isNull(date_step_end)
 ORDER BY buy_id
 */

 /* Postgres */
SELECT buy_id, name_step
  FROM stepik.buy_step INNER JOIN stepik.step USING(step_id)
 WHERE date_step_beg IS NOT NULL
       AND date_step_end IS NULL
 ORDER BY buy_id