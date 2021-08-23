/*
   Выведите сколько человек подало заявление на каждую образовательную программу и конкурс на нее (число поданных заявлений 
   деленное на количество мест по плану), округленный до 2-х знаков после запятой. В запросе вывести название факультета, 
   к которому относится образовательная программа, название образовательной программы, план набора абитуриентов на 
   образовательную программу (plan), количество поданных заявлений (Количество) и Конкурс. Информацию отсортировать в порядке убывания конкурса.
*/

/* 
   MySQL

SELECT name_department, name_program, plan, COUNT(enrollee_id) AS Количество, ROUND(COUNT(enrollee_id) / plan, 2) AS Конкурс
  FROM program_enrollee JOIN program 	USING(program_id)
  						JOIN department USING(department_id)
 GROUP BY name_department, name_program, plan
 ORDER BY 5 DESC
*/

/* Postgres */
SELECT name_department, name_program, plan, COUNT(enrollee_id) AS Количество, ROUND(COUNT(enrollee_id)::numeric / plan, 2) AS Конкурс
  FROM program_enrollee JOIN program 	USING(program_id)
  						JOIN department USING(department_id)
 GROUP BY name_department, name_program, plan
 ORDER BY 5 DESC