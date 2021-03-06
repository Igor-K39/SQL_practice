## Выборка данных с сортировкой

При выборке можно указывать столбец или несколько столбцов, по которым необходимо отсортировать отобранные строки. Для этого используются ключевые слова ORDER BY, после которых задаются имена столбцов. При этом строки сортируются по первому столбцу, если указан второй столбец, сортировка осуществляется только для тех строк, у которых значения первого столбца одинаковы. По умолчанию ORDER BY выполняет сортировку по возрастанию. Чтобы управлять направлением сортировки вручную, после имени столбца указывается ключевое слово ASC (по возрастанию) или DESC (по убыванию). 

Логический порядок операций для запроса SQL следующий:  
- FROM
- WHERE
- SELECT
- ORDER BY

Поскольку сортировка выполняется позже SELECT, для указания столбцов, по которым выполняется сортировка, можно использовать имена, присвоенные им после SELECT, а также порядковый номер столбца в перечислении.

**Пример 1.** Вывести автора, название и количество книг, в отсортированном в алфавитном порядке по автору и по убыванию количества, для тех книг, цены которых меньше 750 рублей.
```sql
SELECT author, title, amount AS Количество
  FROM book
 WHERE price < 750
 ORDER BY author, amount DESC;
```
```
Результат:
+------------------+-----------------------+------------+
| author           | title                 | Количество |
+------------------+-----------------------+------------+
| Булгаков М.А.    | Белая гвардия         | 5          |
| Булгаков М.А.    | Мастер и Маргарита    | 3          |
| Достоевский Ф.М. | Идиот                 | 10         |
| Есенин С.А.      | Стихотворения и поэмы | 15         |
+------------------+-----------------------+------------+
```

## Выборка данных, оператор LIKE
Оператор LIKE используется для сравнения строк. В отличие от операторов отношения равно (=) и не равно (<>), LIKE позволяет сравнивать строки не на полное совпадение (не совпадение), а в соответствии с шаблоном. Шаблон может включать обычные символы и символы-шаблоны. При сравнении с шаблоном, его обычные символы должны в точности совпадать с символами, указанными в строке. Символы-шаблоны могут совпадать с произвольными элементами символьной строки.

'%' - любая строка, содержащая ноль или более символов  
'-' - любой одиночный символ 
```sql
# Поиск книг, инициалы авторов которых содержат «М.»
SELECT * FROM book WHERE author LIKE '%М.%';

# Поиск книг, названия которых либо «Поэма», либо «Поэмы» и пр.
SELECT * FROM book WHERE title LIKE 'Поэм_'

# Вывести название книг, состоящих ровно из 5 букв.
SELECT title FROM book WHERE title LIKE "_____"

# Вывести книги, название которых длиннее 5 символов
SELECT title FROM book WHERE title LIKE "______%";
```

**Пример 2.** Вывести названия книг, которые содержат букву "и" как отдельное слово, если считать, что слова в названии отделяются друг от друга пробелами и не содержат знаков препинания.
```sql
SELECT title 
  FROM book 
 WHERE title LIKE "_% и _%"  /*отбирает слово И внутри названия */
    OR title LIKE "и _%"     /*отбирает слово И в начале названия */
    OR title LIKE "_% и"     /*отбирает слово И в конце названия */
    OR title LIKE "и"        /* отбирает название, состоящее из одного слова И */
```
```
Результат:
+-----------------------+
| title                 |
+-----------------------+
| Мастер и Маргарита    |
| Стихотворения и поэмы |
+-----------------------+
```