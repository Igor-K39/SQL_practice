/* 
   Вывести города, в которых живут клиенты, оформлявшие заказы в интернет-магазине. 
   Указать количество заказов в каждый город, этот столбец назвать Количество. 
   Информацию вывести по убыванию количества заказов, а затем в алфавитном порядке 
   по названию городов.
*/

SELECT name_city, COUNT(name_city) AS Количество 
  FROM stepik.buy INNER JOIN stepik.client USING(client_id)
                  INNER JOIN stepik.city   USING(city_id)
 GROUP BY name_city
 ORDER BY Количество DESC, name_city