/*
   Случайным образом отберите 3 вопроса по дисциплине «Основы баз данных». В результат включите столбцы question_id и name_question.
*/

/* 
   MySQL

SELECT question_id, name_question
  FROM question INNER JOIN subject USING(subject_id)
 WHERE name_subject = 'Основы баз данных'
 ORDER BY rand()
 LIMIT 3
*/

/* Postgres */
SELECT question_id, name_question
  FROM testing.question INNER JOIN testing.subject USING(subject_id)
 WHERE name_subject = 'Основы баз данных'
 ORDER BY random()
 LIMIT 3