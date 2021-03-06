### Задание 1
Вывести информацию о всех книгах, хранящихся на складе. 
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
+---------+-----------------------+------------------+--------+--------+
Affected rows: 5
```

### Задание 2
Выбрать авторов, название книг и их цену из таблицы book.
```
Query result:
+------------------+-----------------------+--------+
| author           | title                 | price  |
+------------------+-----------------------+--------+
| Булгаков М.А.    | Мастер и Маргарита    | 670.99 |
| Булгаков М.А.    | Белая гвардия         | 540.50 |
| Достоевский Ф.М. | Идиот                 | 460.00 |
| Достоевский Ф.М. | Братья Карамазовы     | 799.01 |
| Есенин С.А.      | Стихотворения и поэмы | 650.00 |
+------------------+-----------------------+--------+
Affected rows: 5
```

### Задание 3
Выбрать названия книг и авторов из таблицы book, для поля title задать имя(псевдоним) Название, для поля author –  Автор.
```
Query result:
+-----------------------+------------------+
| Название              | Автор            |
+-----------------------+------------------+
| Мастер и Маргарита    | Булгаков М.А.    |
| Белая гвардия         | Булгаков М.А.    |
| Идиот                 | Достоевский Ф.М. |
| Братья Карамазовы     | Достоевский Ф.М. |
| Стихотворения и поэмы | Есенин С.А.      |
+-----------------------+------------------+
Affected rows: 5
```

### Задание 4
Для упаковки каждой книги требуется 1 лист бумаги, цена которого 1 рубль 65 копеек. Посчитать стоимость упаковки для каждой книги (сколько денег потребуется, чтобы упаковать все экземпляры книги). В запросе вывести название книги, ее количество и стоимость упаковки, последний столбец назвать pack.
```
Query result:
+-----------------------+--------+-------+
| title                 | amount | pack  |
+-----------------------+--------+-------+
| Мастер и Маргарита    | 3      | 4.95  |
| Белая гвардия         | 5      | 8.25  |
| Идиот                 | 10     | 16.50 |
| Братья Карамазовы     | 2      | 3.30  |
| Стихотворения и поэмы | 15     | 24.75 |
+-----------------------+--------+-------+
Affected rows: 5
```

### Задание 5
В конце года цену всех книг на складе пересчитывают – снижают ее на 30%. Написать SQL запрос, который из таблицы book выбирает названия, авторов, количества и вычисляет новые цены книг. Столбец с новой ценой назвать new_price, цену округлить до 2-х знаков после запятой.
```
Query result:
+-----------------------+------------------+--------+-----------+
| title                 | author           | amount | new_price |
+-----------------------+------------------+--------+-----------+
| Мастер и Маргарита    | Булгаков М.А.    | 3      | 469.69    |
| Белая гвардия         | Булгаков М.А.    | 5      | 378.35    |
| Идиот                 | Достоевский Ф.М. | 10     | 322.00    |
| Братья Карамазовы     | Достоевский Ф.М. | 2      | 559.31    |
| Стихотворения и поэмы | Есенин С.А.      | 15     | 455.00    |
+-----------------------+------------------+--------+-----------+
Affected rows: 5
```

### Задание 6
При анализе продаж книг выяснилось, что наибольшей популярностью пользуются книги Михаила Булгакова, на втором месте книги Сергея Есенина. Исходя из этого решили поднять цену книг Булгакова на 10%, а цену книг Есенина - на 5%. Написать запрос, куда включить автора, название книги и новую цену, последний столбец назвать new_price. Значение округлить до двух знаков после запятой.
```
Query result:
+------------------+-----------------------+-----------+
| author           | title                 | new_price |
+------------------+-----------------------+-----------+
| Булгаков М.А.    | Мастер и Маргарита    | 738.09    |
| Булгаков М.А.    | Белая гвардия         | 594.55    |
| Достоевский Ф.М. | Идиот                 | 460.00    |
| Достоевский Ф.М. | Братья Карамазовы     | 799.01    |
| Есенин С.А.      | Стихотворения и поэмы | 682.50    |
+------------------+-----------------------+-----------+
Affected rows: 5
```

### Задание 7
Вывести автора, название  и цены тех книг, количество которых меньше 10.
```
Query result:
+------------------+--------------------+--------+
| author           | title              | price  |
+------------------+--------------------+--------+
| Булгаков М.А.    | Мастер и Маргарита | 670.99 |
| Булгаков М.А.    | Белая гвардия      | 540.50 |
| Достоевский Ф.М. | Братья Карамазовы  | 799.01 |
+------------------+--------------------+--------+
Affected rows: 3
```

### Задание 8
Вывести название, автора,  цену  и количество всех книг, цена которых меньше 500 или больше 600, а стоимость всех экземпляров этих книг больше или равна 5000.
```
Query result:
+-----------------------+-------------+--------+--------+
| title                 | author      | price  | amount |
+-----------------------+-------------+--------+--------+
| Стихотворения и поэмы | Есенин С.А. | 650.00 | 15     |
+-----------------------+-------------+--------+--------+
Affected rows: 1
```

### Задание 9
Вывести название и авторов тех книг, цены которых принадлежат интервалу от 540.50 до 800 (включая границы), а количество или 2, или 3, или 5, или 7.
```
Query result:
+--------------------+------------------+
| title              | author           |
+--------------------+------------------+
| Мастер и Маргарита | Булгаков М.А.    |
| Белая гвардия      | Булгаков М.А.    |
| Братья Карамазовы  | Достоевский Ф.М. |
+--------------------+------------------+
Affected rows: 3
```

### Задание 10
Вывести  автора и название  книг, количество которых принадлежит интервалу от 2 до 14 (включая границы). Информацию  отсортировать сначала по авторам (в обратном алфавитном порядке), а затем по названиям книг (по алфавиту).
```
Query result:
+------------------+--------------------+
| author           | title              |
+------------------+--------------------+
| Достоевский Ф.М. | Братья Карамазовы  |
| Достоевский Ф.М. | Идиот              |
| Булгаков М.А.    | Белая гвардия      |
| Булгаков М.А.    | Мастер и Маргарита |
+------------------+--------------------+
Affected rows: 4
```

### Задание 11
Вывести название и автора тех книг, название которых состоит из двух и более слов, а инициалы автора содержат букву «С». Считать, что в названии слова отделяются друг от друга пробелами и не содержат знаков препинания, между фамилией автора и инициалами обязателен пробел, инициалы записываются без пробела в формате: буква, точка, буква, точка. Информацию отсортировать по названию книги в алфавитном порядке.
```
Результат:
+-----------------------+-------------+
| title                 | author      |
+-----------------------+-------------+
| Капитанская дочка     | Пушкин А.С. |
| Стихотворения и поэмы | Есенин С.А. |
+-----------------------+-------------+
Affected rows: 2
```

### Задание 12 
Придумайте один или несколько запросов к нашей таблице book. Проверьте, правильно ли они работают.
Пример: Вывести названия и авторов тех книг, названия которых не содержат букву 'а'.
```
Query result:
+-----------------------+------------------+
| title                 | author           |
+-----------------------+------------------+
| Идиот                 | Достоевский Ф.М. |
| Стихотворения и поэмы | Есенин С.А.      |
+-----------------------+------------------+
Affected rows: 2
```