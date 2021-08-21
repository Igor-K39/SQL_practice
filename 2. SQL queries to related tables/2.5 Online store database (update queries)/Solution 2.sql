/*
 Создать новый заказ для Попова Ильи. Его комментарий для заказа: «Связаться со мной по вопросу доставки».
*/

/* 
   MySQL

INSERT INTO buy(buy_description, client_id)
SELECT 'Связаться со мной по вопросу доставки', client_id
  FROM client
 WHERE name_client = 'Попов Илья'
 */

/* Postgres */
INSERT INTO stepik.buy(buy_description, client_id)
SELECT 'Связаться со мной по вопросу доставки', client_id
  FROM stepik.client
 WHERE name_client = 'Попов Илья'