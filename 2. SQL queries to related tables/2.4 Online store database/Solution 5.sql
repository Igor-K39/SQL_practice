/*
   Вывести информацию о каждом заказе: его номер, кто его сформировал (фамилия пользователя) 
   и его стоимость (сумма произведений количества заказанных книг и их цены), в отсортированном 
   по номеру заказа виде. Последний столбец назвать Стоимость.
*/

SELECT buy_id, name_client, SUM(buy_book.amount * price) AS Стоимость
  FROM stepik.buy_book INNER JOIN stepik.buy    USING(buy_id)
                	   INNER JOIN stepik.book   USING(book_id)
                	   INNER JOIN stepik.client USING(client_id)
 GROUP BY buy_id, name_client
 ORDER BY buy_id