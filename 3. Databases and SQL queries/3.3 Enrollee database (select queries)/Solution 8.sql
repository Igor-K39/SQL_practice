/*
   Вывести образовательные программы, на которые для поступления необходимы предмет 
   «Информатика» и «Математика» в отсортированном по названию программ виде.
*/

SELECT name_program
  FROM program_subject JOIN program USING(program_id)
  					   JOIN subject USING(subject_id)
 WHERE name_subject = 'Информатика'
       OR name_subject = 'Математика'
 GROUP BY name_program
HAVING COUNT(name_subject) = 2 
ORDER BY 1