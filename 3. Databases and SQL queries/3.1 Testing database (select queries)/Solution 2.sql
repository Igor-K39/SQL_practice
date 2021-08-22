/*
   Вывести, сколько попыток сделали студенты по каждой дисциплине, а также средний результат попыток, 
   который округлить до 2 знаков после запятой. Под результатом попытки понимается процент правильных 
   ответов на вопросы теста, который занесен в столбец result.  В результат включить название дисциплины, 
   а также вычисляемые столбцы Количество и Среднее. Информацию вывести по убыванию средних результатов.
*/

/* 
   MySQL
SELECT name_subject, COUNT(attempt_id) AS Количество, 
       ROUND(SUM(result) / COUNT(attempt_id), 2) AS Среднее
  FROM attempt RIGHT JOIN subject USING(subject_id)
 GROUP BY name_subject
 ORDER BY Среднее DESC
*/

/* Postgres */
SELECT name_subject, COUNT(attempt_id) AS Количество, 
       ROUND(SUM(result) / COUNT(attempt_id), 2) AS Среднее
  FROM testing.attempt RIGHT JOIN testing.subject USING(subject_id)
 GROUP BY name_subject
 ORDER BY Среднее DESC