/*
   Вывести название образовательной программы и фамилию тех абитуриентов, которые подавали документы 
   на эту образовательную программу, но не могут быть зачислены на нее. Эти абитуриенты имеют результат 
   по одному или нескольким предметам ЕГЭ, необходимым для поступления на эту образовательную программу, 
   меньше минимального балла. Информацию вывести в отсортированном сначала по программам, 
   а потом по фамилиям абитуриентов виде.
*/

SELECT name_program, name_enrollee
  FROM program_enrollee JOIN program_subject  USING(program_id)
  						JOIN enrollee_subject USING(enrollee_id, subject_id)
						JOIN program 		  USING(program_id)
						JOIN enrollee 		  USING(enrollee_id)
 WHERE result < min_result
 ORDER BY 1, 2