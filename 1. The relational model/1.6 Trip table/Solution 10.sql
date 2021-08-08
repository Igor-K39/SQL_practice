/*
   Вывести фамилию с инициалами и общую сумму суточных, полученных за все командировки 
   для тех сотрудников, которые были в командировках больше чем 3 раза, 
   в отсортированном по убыванию сумм суточных виде. Последний столбец назвать Сумма.
*/

SELECT name, SUM(per_diem * (DATE_PART('day', date_last::timestamp - date_first::timestamp) + 1)) AS Сумма
  FROM trip
 GROUP BY name
 HAVING name IN (SELECT name 
                  FROM trip
                 GROUP BY name
                HAVING COUNT(name) > 3)
 ORDER BY Сумма DESC