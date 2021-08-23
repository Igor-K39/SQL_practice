/*
   Вывести образовательные программы, для которых минимальный балл ЕГЭ 
   по каждому предмету больше или равен 40 баллам. Программы вывести 
   в отсортированном по алфавиту виде.
*/
SELECT name_program
  FROM program_subject JOIN program USING(program_id)
 WHERE min_result >= 40
 GROUP BY name_program
 HAVING COUNT(name_program) = 3
 ORDER BY 1