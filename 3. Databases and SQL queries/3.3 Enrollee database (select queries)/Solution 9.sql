/*
   Посчитать количество баллов каждого абитуриента на каждую образовательную программу, 
   на которую он подал заявление, по результатам ЕГЭ. В результат включить название 
   образовательной программы, фамилию и имя абитуриента, а также столбец с суммой баллов, 
   который назвать itog. Информацию вывести в отсортированном сначала по образовательной 
   программе, а потом по убыванию суммы баллов виде.
*/

SELECT name_program, name_enrollee, SUM(result) as itog
  FROM enrollee_subject JOIN program_subject USING(subject_id)
  						JOIN program         USING(program_id)
						JOIN enrollee        USING(enrollee_id)
						JOIN program_enrollee ON program_enrollee.program_id = program.program_id 
											 AND program_enrollee.enrollee_id = enrollee.enrollee_id
 GROUP BY name_enrollee, name_program
 ORDER BY name_program, itog DESC