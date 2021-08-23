/* 
   Студент прошел тестирование (то есть все его ответы занесены в таблицу testing), далее необходимо 
   вычислить результат(запрос) и занести его в таблицу attempt для соответствующей попытки.  
   Результат попытки вычислить как количество правильных ответов, деленное на 3 (количество вопросов 
   в каждой попытке) и умноженное на 100. Результат округлить до целого.

   Будем считать, что мы знаем id попытки,  для которой вычисляется результат, в нашем случае это 8.
*/


/*
   MySQL

UPDATE attempt
   SET result = (SELECT ROUND(SUM(CASE WHEN is_correct = true THEN 1 ELSE 0 END) / COUNT(is_correct) * 100, 2)
  				   FROM testing join answer USING(answer_id)
 				  WHERE attempt_id = 8)
 WHERE attempt_id = 8
 */
 
/* Postgres */
UPDATE testing.attempt
   SET result = (SELECT ROUND(SUM(CASE WHEN is_correct = true THEN 1 ELSE 0 END)::numeric / COUNT(is_correct) * 100, 2)
  				   FROM testing.testing join testing.answer USING(answer_id)
 				  WHERE attempt_id = 8)
 WHERE attempt_id = 8