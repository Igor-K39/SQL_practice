/*
   Посчитать, сколько дополнительных баллов получит каждый абитуриент. 
   Столбец с дополнительными баллами назвать Бонус.Информацию вывести 
   в отсортированном по фамилиям виде.
*/

SELECT name_enrollee, SUM(CASE WHEN bonus IS NULL THEN 0 ELSE bonus END) AS Бонус
  FROM enrollee_achievement RIGHT JOIN enrollee USING(enrollee_id)
  							LEFT JOIN achievement USING(achievement_id)
  GROUP BY name_enrollee
  ORDER BY name_enrollee
 