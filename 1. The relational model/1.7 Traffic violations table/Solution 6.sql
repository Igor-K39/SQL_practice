/*
   В таблицу fine занести дату оплаты соответствующего штрафа из таблицы payment; 
   Уменьшить начисленный штраф в таблице fine в два раза  (только для тех штрафов, 
   информация о которых занесена в таблицу payment) , если оплата произведена 
   не позднее 20 дней со дня нарушения.
*/

UPDATE fine
   SET date_payment = payment.date_payment,
       sum_fine = CASE 
	   		      WHEN DATE_PART('day', payment.date_payment::timestamp - fine.date_violation::timestamp) <= 20 THEN fine.sum_fine / 2 
                  ELSE fine.sum_fine 
                  END
  FROM payment
 WHERE (fine.name = payment.name
   AND fine.number_plate = payment.number_plate
   AND fine.violation = payment.violation
   AND fine.date_violation = payment.date_violation);