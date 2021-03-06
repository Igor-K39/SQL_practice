### Задание 1
Создать таблицу поставка (supply), которая имеет ту же структуру, что и таблиц book.
```sql
supply_id INT PRIMARY KEY AUTO_INCREMENT
title     VARCHAR(50)
author    VARCHAR(30)
price     DECIMAL(8, 2)
amount    INT
```

### Задание 2
Занесите в таблицу supply четыре записи, чтобы получилась следующая таблица:
```
Query result:
+-----------+----------------+------------------+--------+--------+
| supply_id | title          | author           | price  | amount |
+-----------+----------------+------------------+--------+--------+
| 1         | Лирика         | Пастернак Б.Л.   | 518.99 | 2      |
| 2         | Черный человек | Есенин С.А.      | 570.20 | 6      |
| 3         | Белая гвардия  | Булгаков М.А.    | 540.50 | 7      |
| 4         | Идиот          | Достоевский Ф.М. | 360.80 | 3      |
+-----------+----------------+------------------+--------+--------+
Affected rows: 4
```

### Задание 3
Добавить из таблицы supply в таблицу book, все книги, кроме книг, написанных Булгаковым М.А. и Достоевским Ф.М.
```
Query result:
+---------+-----------------------+------------------+--------+--------+
| book_id | title                 | author           | price  | amount |
+---------+-----------------------+------------------+--------+--------+
| 1       | Мастер и Маргарита    | Булгаков М.А.    | 670.99 | 3      |
| 2       | Белая гвардия         | Булгаков М.А.    | 540.50 | 5      |
| 3       | Идиот                 | Достоевский Ф.М. | 460.00 | 10     |
| 4       | Братья Карамазовы     | Достоевский Ф.М. | 799.01 | 2      |
| 5       | Стихотворения и поэмы | Есенин С.А.      | 650.00 | 15     |
| 6       | Лирика                | Пастернак Б.Л.   | 518.99 | 2      |
| 7       | Черный человек        | Есенин С.А.      | 570.20 | 6      |
+---------+-----------------------+------------------+--------+--------+
Affected rows: 2
```

### Задание 4
Занести из таблицы supply в таблицу book только те книги, авторов которых нет в  book.
```
Query result:
+---------+-----------------------+------------------+--------+--------+
| book_id | title                 | author           | price  | amount |
+---------+-----------------------+------------------+--------+--------+
| 1       | Мастер и Маргарита    | Булгаков М.А.    | 670.99 | 3      |
| 2       | Белая гвардия         | Булгаков М.А.    | 540.50 | 5      |
| 3       | Идиот                 | Достоевский Ф.М. | 460.00 | 10     |
| 4       | Братья Карамазовы     | Достоевский Ф.М. | 799.01 | 2      |
| 5       | Стихотворения и поэмы | Есенин С.А.      | 650.00 | 15     |
| 6       | Лирика                | Пастернак Б.Л.   | 518.99 | 2      |
+---------+-----------------------+------------------+--------+--------+
Affected rows: 1
```

### Задание 5
Уменьшить на 10% цену тех книг в таблице book, количество которых принадлежит интервалу от 5 до 10 включительно.
```
Query result:
+---------+-----------------------+------------------+--------+--------+
| book_id | title                 | author           | price  | amount |
+---------+-----------------------+------------------+--------+--------+
| 1       | Мастер и Маргарита    | Булгаков М.А.    | 670.99 | 3      |
| 2       | Белая гвардия         | Булгаков М.А.    | 486.45 | 5      |
| 3       | Идиот                 | Достоевский Ф.М. | 414.00 | 10     |
| 4       | Братья Карамазовы     | Достоевский Ф.М. | 799.01 | 2      |
| 5       | Стихотворения и поэмы | Есенин С.А.      | 650.00 | 15     |
+---------+-----------------------+------------------+--------+--------+
Affected rows: 2
```

### Задание 6
В таблице book необходимо скорректировать значение для покупателя в столбце buy таким образом, чтобы оно не превышало допустимый остаток в столбце amount. А цену тех книг, которые покупатель не заказывал, снизить на 10%.
```
Query result:
+---------+-----------------------+------------------+--------+--------+-----+
| book_id | title                 | author           | price  | amount | buy |
+---------+-----------------------+------------------+--------+--------+-----+
| 1       | Мастер и Маргарита    | Булгаков М.А.    | 603.89 | 3      | 0   |
| 2       | Белая гвардия         | Булгаков М.А.    | 540.50 | 5      | 3   |
| 3       | Идиот                 | Достоевский Ф.М. | 460.00 | 10     | 8   |
| 4       | Братья Карамазовы     | Достоевский Ф.М. | 719.11 | 2      | 0   |
| 5       | Стихотворения и поэмы | Есенин С.А.      | 650.00 | 15     | 15  |
+---------+-----------------------+------------------+--------+--------+-----+
Affected rows: 5
```

### Задание 7
Для тех книг в таблице book , которые есть в таблице supply, не только увеличить их количество в таблице book ( увеличить их количество на значение столбца amountтаблицы supply), но и пересчитать их цену (для каждой книги найти сумму цен из таблиц book и supply и разделить на 2).
```
Query result:
+---------+-----------------------+------------------+--------+--------+
| book_id | title                 | author           | price  | amount |
+---------+-----------------------+------------------+--------+--------+
| 1       | Мастер и Маргарита    | Булгаков М.А.    | 670.99 | 3      |
| 2       | Белая гвардия         | Булгаков М.А.    | 540.50 | 12     |
| 3       | Идиот                 | Достоевский Ф.М. | 410.40 | 13     |
| 4       | Братья Карамазовы     | Достоевский Ф.М. | 799.01 | 2      |
| 5       | Стихотворения и поэмы | Есенин С.А.      | 650.00 | 15     |
+---------+-----------------------+------------------+--------+--------+
Affected rows: 2
```
### Задание 8
Удалить из таблицы supply книги тех авторов, общее количество экземпляров книг которых в таблице book превышает 10.
```
Query result:
+-----------+---------------+----------------+--------+--------+
| supply_id | title         | author         | price  | amount |
+-----------+---------------+----------------+--------+--------+
| 1         | Лирика        | Пастернак Б.Л. | 518.99 | 2      |
| 3         | Белая гвардия | Булгаков М.А.  | 540.50 | 7      |
+-----------+---------------+----------------+--------+--------+
Affected rows: 2
```
### Задание 9
Создать таблицу заказ (ordering), куда включить авторов и названия тех книг, количество экземпляров которых в таблице book меньше среднего количества экземпляров книг в таблице book. В таблицу включить столбец   amount, в котором для всех книг указать одинаковое значение - среднее количество экземпляров книг в таблице book.
```
Query result:
+------------------+--------------------+--------+
| author           | title              | amount |
+------------------+--------------------+--------+
| Булгаков М.А.    | Мастер и Маргарита | 7      |
| Булгаков М.А.    | Белая гвардия      | 7      |
| Достоевский Ф.М. | Братья Карамазовы  | 7      |
+------------------+--------------------+--------+
Affected rows: 3
```