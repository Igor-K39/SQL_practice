/* 
   Удалить из таблицы attempt все попытки, выполненные раньше 1 мая 2020 года. 
   Также удалить и все соответствующие этим попыткам вопросы из таблицы testing, 
   которая создавалась следующим запросом:

CREATE TABLE testing (
    testing_id INT PRIMARY KEY AUTO_INCREMENT, 
    attempt_id INT, 
    question_id INT, 
    answer_id INT,
    FOREIGN KEY (attempt_id)  REFERENCES attempt (attempt_id) ON DELETE CASCADE
);

*/

/*
   MySQL
DELETE FROM attempt
 WHERE DATEDIFF(date_attempt, '2020-05-01') < 0
*/

/* Postgres */
DELETE FROM testing.attempt
 WHERE DATE_PART('day', date_attempt::timestamp - '2020-05-01'::timestamp) < 0