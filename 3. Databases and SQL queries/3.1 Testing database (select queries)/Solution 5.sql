/* 
   Студенты могут тестироваться по одной или нескольким дисциплинам (не обязательно по всем). Вывести дисциплину и количество уникальных студентов (столбец назвать Количество), которые по ней проходили тестирование . Информацию отсортировать сначала по убыванию количества, а потом по названию дисциплины. В результат включить и дисциплины, тестирование по которым студенты еще не проходили, в этом случае указать количество студентов 0.
*/

/*
   MySQL

SELECT name_subject, COUNT(DISTINCT student_id) AS Количество
  FROM attempt RIGHT JOIN subject USING(subject_id)
 GROUP BY name_subject
 ORDER BY 2 DESC, 1
*/

/* Postgres */
SELECT name_subject, COUNT(DISTINCT student_id) AS Количество
  FROM testing.attempt RIGHT JOIN testing.subject USING(subject_id)
 GROUP BY name_subject
 ORDER BY 2 DESC, 1