/*   
   Для каждого вопроса вывести процент успешных решений, то есть отношение количества верных ответов к общему 
   количеству ответов, значение округлить до 2-х знаков после запятой. Также вывести название предмета, к которому 
   относится вопрос, и общее количество ответов на этот вопрос. В результат включить название дисциплины, 
   вопросы по ней (столбец назвать Вопрос), а также два вычисляемых столбца Всего_ответов и Успешность. 
   Информацию отсортировать сначала по названию дисциплины, потом по убыванию успешности, а потом по тексту вопроса 
   в алфавитном порядке.
*/

/*
   MySQL
SELECT 
	   name_subject, CONCAT(LEFT(name_question, 30), '...') AS Вопрос, COUNT(is_correct) AS Всего_ответов, 
	   ROUND(SUM(CASE WHEN is_correct = true THEN 1 ELSE 0 END) / COUNT(is_correct) * 100, 2) AS Успешность
  FROM
  	   testing JOIN question USING (question_id)
	   		   JOIN answer   USING (answer_id)
			   JOIN subject  USING (subject_id)
 
 GROUP BY 1, 2
 ORDER BY 1, 4 DESC, 2
*/

/* Postgres */
SELECT 
	   name_subject, CONCAT(LEFT(name_question, 30), '...') AS Вопрос, COUNT(is_correct) AS Всего_ответов, 
	   ROUND(SUM(CASE WHEN is_correct = true THEN 1 ELSE 0 END)::numeric / COUNT(is_correct) * 100, 2) AS Успешность
  FROM
  	   testing.testing JOIN testing.question USING (question_id)
	   				   JOIN testing.answer   USING (answer_id)
					   JOIN testing.subject  USING (subject_id)
 
 GROUP BY 1, 2
 ORDER BY 1, 4 DESC


