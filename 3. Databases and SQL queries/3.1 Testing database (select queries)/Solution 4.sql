/* 
   Если студент совершал несколько попыток по одной и той же дисциплине, то вывести разницу в днях 
   между первой и последней попыткой. В результат включить фамилию и имя студента, название дисциплины 
   и вычисляемый столбец Интервал. Информацию вывести по возрастанию разницы. 
   Студентов, сделавших одну попытку по дисциплине, не учитывать. 
*/

/*
   MySQL
   
SELECT DISTINCT name_student, name_subject,
                DATEDIFF(MAX(date_attempt), MIN(date_attempt)) AS Интервал  
  FROM student INNER JOIN attempt USING(student_id)
               INNER JOIN subject USING(subject_id)
 GROUP BY name_student, name_subject, subject_id
HAVING COUNT(subject_id) > 1
 ORDER BY Интервал
*/

/* Postgres */
SELECT DISTINCT name_student, name_subject,
                DATE_PART('day', MAX(date_attempt)::timestamp - MIN(date_attempt)::timestamp) AS Интервал  
  FROM testing.student INNER JOIN testing.attempt USING(student_id)
                       INNER JOIN testing.subject USING(subject_id)
 GROUP BY name_student, name_subject, subject_id
HAVING COUNT(subject_id) > 1
 ORDER BY Интервал
 