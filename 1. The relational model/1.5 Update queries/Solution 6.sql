/*
   В таблице book необходимо скорректировать значение для покупателя в столбце buy 
   таким образом, чтобы оно не превышало допустимый остаток в столбце amount. 
   А цену тех книг, которые покупатель не заказывал, снизить на 10%.
*/

/* MySQL

UPDATE book
   SET buy = IF(buy > amount, amount, buy),
       price = IF(buy = 0, price * 0.9, price);
               SELECT * FROM book; 
*/

/* Postgres */
UPDATE book
   SET buy   = CASE WHEN buy > amount THEN amount      ELSE buy   END,
       price = CASE WHEN buy = 0      THEN price * 0.9 ELSE price END;	   
	   

               