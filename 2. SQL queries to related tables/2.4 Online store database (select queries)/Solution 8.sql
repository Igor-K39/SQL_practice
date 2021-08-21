/*
   Выбрать всех клиентов, которые заказывали книги Достоевского, 
   информацию вывести в отсортированном по алфавиту виде.
*/

SELECT name_client
  FROM stepik.buy_book INNER JOIN stepik.book   USING(book_id)
  					   INNER JOIN stepik.buy    USING(buy_id)
					   INNER JOIN stepik.client USING(client_id)
					   INNER JOIN stepik.author USING(author_id)
 WHERE name_author LIKE 'Достоевский %'
 GROUP BY name_client
 ORDER BY name_client