/*
   В таблице fine увеличить в два раза сумму неоплаченных штрафов для отобранных на предыдущем шаге записей. 
*/


/* 
   MySQL

UPDATE fine, (SELECT name, number_plate, violation
              FROM fine
              GROUP BY name, number_plate, violation
              HAVING COUNT(violation) >= 2
              ORDER BY name, number_plate, violation
             ) qin
   SET fine.sum_fine = fine.sum_fine * 2
 WHERE fine.name = qin.name
       AND fine.number_plate = qin.number_plate
       AND fine.violation = qin.violation
       AND isNull(fine.date_payment)
*/

/* Postgres */
UPDATE fine
   SET sum_fine = sum_fine * 2
  FROM (SELECT name, number_plate, violation
          FROM fine
         GROUP BY name, number_plate, violation
        HAVING COUNT(violation) >= 2
         ORDER BY name, number_plate, violation) AS qin
 WHERE fine.name = qin.name
   AND fine.number_plate = qin.number_plate
   AND fine.violation = qin.violation
   AND fine.date_payment IS NULL