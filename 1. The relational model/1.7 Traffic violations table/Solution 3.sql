/*
   Занести в таблицу fine суммы штрафов, которые должен оплатить водитель, 
   в соответствии с данными из таблицы traffic_violation. 
   При этом суммы заносить только в пустые поля столбца sum_fine.
*/

UPDATE fine
   SET sum_fine = (SELECT sum_fine 
                     FROM traffic_violation AS tv
                    WHERE tv.violation = fine.violation)
   WHERE sum_fine IS NULL
