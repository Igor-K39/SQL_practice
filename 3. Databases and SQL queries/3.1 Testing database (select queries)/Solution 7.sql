/*
   Вывести вопросы, которые были включены в тест для Семенова Ивана по дисциплине «Основы SQL» 2020-05-17  
   (значение attempt_id для этой попытки равно 7). Указать, какой ответ дал студент и правильный он или 
   нет(вывести Верно или Неверно). В результат включить вопрос, ответ и вычисляемый столбец  Результат.
*/


/*
   MySQL

SELECT name_question, name_answer, 
       IF(is_correct, 'Верно', 'Неверно') AS Результат
  FROM testing INNER JOIN question USING(question_id)
  			       INNER JOIN answer   USING(answer_id)
  					   
 WHERE attempt_id = 7
*/

/* Postgres */
SELECT name_question, name_answer, 
       CASE
	       WHEN is_correct = TRUE THEN 'Верно'
		   ELSE 'Неверно'
	   END
  FROM testing.testing INNER JOIN testing.question USING(question_id)
  					           INNER JOIN testing.answer   USING(answer_id)   
 WHERE attempt_id = 7