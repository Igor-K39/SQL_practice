/*
   Необходимо в каждом городе провести выставку книг каждого автора 
   в течение 2020 года. Дату проведения выставки выбрать случайным образом. 
   Создать запрос, который выведет город, автора и дату проведения выставки. 
   Последний столбец назвать Дата. Информацию вывести, отсортировав сначала 
   в алфавитном порядке по названиям городов, а потом по убыванию дат проведения выставок.
*/

/* 
   MySQL

SELECT name_city, name_author, DATE_ADD('2020-01-01', INTERVAL FLOOR(RAND()*365) DAY) AS Дата
FROM city,author
ORDER BY
    name_city ASC,
    Дата DESC;
*/

/* Postgres */
SELECT name_city, name_author, ('2020-01-01'::DATE + FLOOR(RANDOM() * 365)::INTEGER) AS Дата
  FROM city,author
 ORDER BY name_city, Дата DESC;
