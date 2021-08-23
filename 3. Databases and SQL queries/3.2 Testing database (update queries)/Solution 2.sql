/*
   Случайным образом выбрать три вопроса (запрос) по дисциплине, тестирование по которой 
   собирается проходить студент, занесенный в таблицу attempt последним, и добавить их в 
   таблицу testing.id последней попытки получить как максимальное значение id из таблицы 
   attempt.
*/

/* 
   MySQL

INSERT INTO testing(attempt_id, question_id)
SELECT attempt_id, question_id 
  FROM question JOIN attempt USING(subject_id)
 WHERE attempt_id = (SELECT max(attempt_id) FROM attempt) 
 ORDER BY RAND()
 LIMIT 3;
 */

/* Postgres */
INSERT INTO testing.testing(attempt_id, question_id)
SELECT attempt_id, question_id 
  FROM testing.question JOIN testing.attempt USING(subject_id)
 WHERE attempt_id = (SELECT max(attempt_id) FROM testing.attempt) 
 ORDER BY RANDOM()
 LIMIT 3;


