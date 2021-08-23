/*
   Вывести абитуриентов, которые хотят поступать на образовательную программу 
   «Мехатроника и робототехника» в отсортированном по фамилиям виде.
*/

SELECT name_enrollee
  FROM program_enrollee JOIN enrollee USING(enrollee_id)
  					    JOIN program  USING(program_id)
 WHERE name_program = 'Мехатроника и робототехника'
 ORDER BY 1