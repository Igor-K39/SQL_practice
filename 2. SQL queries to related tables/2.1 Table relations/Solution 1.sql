/*
   Создать таблицу author следующей структуры:
   author_id   INT         PRIMARY KEY AUTO_INCREMENT
   name_author VARCHAR(50)
*/

/* 
   MySQL

CREATE TABLE author(
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    name_author VARCHAR(50)
)
*/

/* Postgres */
CREATE TABLE author(
    author_id SERIAL PRIMARY KEY,
    name_author VARCHAR(50)
)