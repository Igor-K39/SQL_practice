DROP TABLE IF EXISTS book;

CREATE TABLE book(
    book_id SERIAL PRIMARY KEY,
    title   VARCHAR(50),
    author  VARCHAR(30),
    price   DECIMAL(8, 2),
    amount  INT,
    buy		INT
);

INSERT INTO book(title, author, price, amount, buy) 
VALUES ('Мастер и Маргарита',    'Булгаков М.А.',    670.99, 3,  0 ),
       ('Белая гвардия',         'Булгаков М.А.',    540.50, 5,  3 ),
       ('Идиот',                 'Достоевский Ф.М.', 460.00, 10, 8 ),
	   ('Братья Карамазовы',     'Достоевский Ф.М.', 799.01, 2,  0 ),
       ('Стихотворения и поэмы', 'Есенин С.А,',      650.00, 15, 18);