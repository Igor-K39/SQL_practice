/*
   Создать новую таблицу back_payment, куда внести информацию о неоплаченных штрафах 
   (Фамилию и инициалы водителя, номер машины, нарушение, сумму штрафа и дату нарушения) 
   из таблицы fine.
*/

/* 
   MySQL

CREATE TABLE back_payment AS
               SELECT name, number_plate, violation, sum_fine, date_violation
                 FROM fine
                WHERE isNull(date_payment);
                
SELECT * FROM back_payment;
*/ 

/* Postgres */
CREATE TABLE back_payment AS
               SELECT name, number_plate, violation, sum_fine, date_violation
                 FROM fine
                WHERE date_payment IS NULL;
                
SELECT * FROM back_payment;