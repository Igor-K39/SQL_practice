/*
   В таблице city для каждого города указано количество дней, за которые заказ может быть доставлен в этот город 
   (рассматривается только этап "Транспортировка"). Для тех заказов, которые прошли этап транспортировки, 
   вывести количество дней за которое заказ реально доставлен в город. А также, если заказ доставлен с опозданием, 
   указать количество дней задержки, в противном случае вывести 0. В результат включить номер заказа (buy_id), 
   а также вычисляемые столбцы Количество_дней и Опоздание. Информацию вывести в отсортированном по номеру заказа виде.
*/

/*
   MySQL

SELECT buy_id,
	   DATEDIFF(date_step_end, date_step_beg) AS Количество_дней,
	   IF(DATEDIFF(date_step_end, date_step_beg) > days_delivery, DATEDIFF(date_step_end, date_step_beg) - days_delivery, 0)
	   AS Опоздание
  FROM buy_step INNER JOIN buy    USING(buy_id)
  				INNER JOIN step	  USING(step_id)
  				INNER JOIN client USING(client_id)
				INNER JOIN city   USING(city_id)
 WHERE name_step = 'Транспортировка'
       AND NOT isNull(date_step_beg)
	   AND NOT isNull(date_step_end)
 ORDER BY buy_id  
*/

/* Postgres */
SELECT buy_id,
	   DATE_PART('day', date_step_end::timestamp - date_step_beg::timestamp)AS Количество_дней,
	   CASE
	       WHEN DATE_PART('day', date_step_end::timestamp - date_step_beg::timestamp) > days_delivery
		   THEN DATE_PART('day', date_step_end::timestamp - date_step_beg::timestamp) - days_delivery
		   ELSE 0
	   END AS Опоздание
  FROM stepik.buy_step INNER JOIN stepik.buy    USING(buy_id)
  					   INNER JOIN stepik.step	USING(step_id)
  					   INNER JOIN stepik.client USING(client_id)
					   INNER JOIN stepik.city   USING(city_id)
 WHERE name_step = 'Транспортировка'
       AND date_step_beg IS NOT NULL
	   AND date_step_end IS NOT NULL