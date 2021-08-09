/*
   Создать таблицу author следующей структуры:
   author_id   INT         PRIMARY KEY AUTO_INCREMENT
   name_author VARCHAR(50)
*/

CREATE TABLE author(
    author_id SERIAL PRIMARY KEY,
    name_author VARCHAR(50)
)