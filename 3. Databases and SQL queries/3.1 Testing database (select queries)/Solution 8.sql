/*
   Посчитать результаты тестирования. Результат попытки вычислить как количество правильных ответов, деленное на 3 
   (количество вопросов в каждой попытке) и умноженное на 100. Результат округлить до двух знаков после запятой. 
   Вывести фамилию студента, название предмета, дату и результат. Последний столбец назвать Результат. Информацию 
   отсортировать сначала по фамилии студента, потом по убыванию даты попытки.
*/

/*
   MySQL

SELECT
	   name_student, name_subject, date_attempt,
	   ROUND(SUM(CASE WHEN is_correct = true THEN 1 ELSE 0 END) / 3 * 100, 2) AS Результат
  FROM
       testing JOIN question USING(question_id)
	   				   JOIN subject  USING(subject_id)
					   JOIN answer	 USING(answer_id)
					   JOIN attempt  USING(attempt_id)
					   JOIN student  USING(student_id)
 GROUP BY 1, 2, 3
 ORDER BY 1, 3 DESC
*/

/* Postgres */
SELECT
	   name_student, name_subject, date_attempt,
	   ROUND(SUM(CASE WHEN is_correct = true THEN 1 ELSE 0 END)::numeric / 3 * 100, 2) AS Результат
  FROM
       testing.testing JOIN testing.question USING(question_id)
	   				   JOIN testing.subject  USING(subject_id)
					   JOIN testing.answer	 USING(answer_id)
					   JOIN testing.attempt  USING(attempt_id)
					   JOIN testing.student  USING(student_id)
 GROUP BY 1, 2, 3
 ORDER BY 1, 3 DESC
				

