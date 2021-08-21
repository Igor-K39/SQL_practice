/*
    Занести для книги «Стихотворения и поэмы» Лермонтова жанр «Поэзия», 
    а для книги «Остров сокровищ» Стивенсона - «Приключения». 
    (Использовать два запроса).
*/

UPDATE book
   SET genre_id = 
    (
        SELECT genre_id
          FROM genre
         WHERE name_genre = 'Поэзия'
    )
 WHERE book_id = 12;
 
UPDATE book
   SET genre_id = 
    (
        SELECT genre_id
          FROM genre
         WHERE name_genre = 'Приключения'
    )
 WHERE book_id = 13