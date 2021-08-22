/* 
   Вывести студентов (различных студентов), имеющих максимальные результаты попыток. 
   Информацию отсортировать в алфавитном порядке по фамилии студента. Максимальный 
   результат не обязательно будет 100%, поэтому явно это значение в запросе не задавать.
*/

/* 
   MySQL

SELECT s.name_student, a.result
  FROM attempt a JOIN student s on a.student_id = s.student_id
 WHERE a.result IN (SELECT MAX(result)
                      FROM attempt)
 ORDER BY s.name_student;
*/

/* Postgres */
SELECT name_student, attempt.result
  FROM testing.student INNER JOIN testing.attempt USING(student_id)
 WHERE attempt.result IN (SELECT MAX(attempt.result) 
  							FROM testing.attempt)
 ORDER BY name_student;