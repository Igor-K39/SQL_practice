/*
   Вывести образовательные программы, которые имеют самый большой план набора,  вместе с этой величиной.
   Для выборки использовать вложенный запрос (требование платформы)
*/

SELECT name_program, plan
  FROM program
 WHERE plan = (SELECT MAX(plan) FROM program)