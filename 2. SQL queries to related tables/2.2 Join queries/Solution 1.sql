/*
   Вывести название, жанр и цену тех книг, 
   количество которых больше 8, 
   в отсортированном по убыванию цены виде.

   +-----------------------+------------+--------+
   | title                 | name_genre | price  |
   +-----------------------+------------+--------+
   | Стихотворения и поэмы | Поэзия     | 650.00 |
   | Игрок                 | Роман      | 480.50 |
   | Идиот                 | Роман      | 460.00 |
   +-----------------------+------------+--------+
*/

SELECT title, name_genre, price
  FROM book INNER JOIN author ON book.author_id = author.author_id
            INNER JOIN genre  ON book.genre_id  = genre.genre_id 
 WHERE book.amount > 8
 ORDER BY price DESC


