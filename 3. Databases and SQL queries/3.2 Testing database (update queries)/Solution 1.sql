/*
   В таблицу attempt включить новую попытку для студента Баранова Павла по дисциплине «Основы баз данных». 
   Установить текущую дату в качестве даты выполнения попытки.
*/

/* 
   MySQL

INSERT INTO attempt(student_id, subject_id, date_attempt)
(SELECT student_id, subject_id, CURRENT_DATE
  FROM student CROSS JOIN subject 
 WHERE name_student = 'Баранов Павел'
       AND name_subject = 'Основы баз данных')
*/

/* Postgres */
INSERT INTO testing.attempt(student_id, subject_id, date_attempt)
SELECT student_id, subject_id, CURRENT_DATE
  FROM testing.student CROSS JOIN testing.subject 
 WHERE name_student = 'Баранов Павел'
       AND name_subject = 'Основы баз данных'