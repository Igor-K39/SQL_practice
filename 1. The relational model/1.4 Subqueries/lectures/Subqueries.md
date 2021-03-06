## Вложенные запросы

Вложенный запрос (подзапрос, внутренний запрос) – это запрос внутри другого запроса SQL. Вложенный запрос используется для выборки данных, которые будут использоваться в условии отбора записей основного запроса. Его применяют для:
- сравнения выражения с результатом вложенного запроса;
- определения того, включено ли выражение в результаты вложенного запроса;
- проверки того, выбирает ли запрос определенные строки.

Вложенный запрос, возвращающий одно значение, может использоваться в условии отбора записей WHERE как обычное значение совместно с операциями =, <>, >=, <=, >, <.

**Пример 1.** Вывести информацию о самых дешевых книгах, хранящихся на складе.
```sql
SELECT title, author, price, amount
  FROM book
 WHERE price = (SELECT MIN(price) FROM book)
```
```
Результат:
+-------+------------------+--------+--------+
| title | author           | price  | amount |
+-------+------------------+--------+--------+
| Идиот | Достоевский Ф.М. | 460.00 | 10     |
+-------+------------------+--------+--------+
```
Вложенный запрос определяет минимальную цену книг во всей таблице (это 460.00), а затем в основном запросе для каждой записи проверяется, равна ли цена минимальному значению, если равна, информация о книге включается в результирующую таблицу запроса.

## Использование вложенного запроса в выражении
Вложенный запрос, возвращающий одно значение, может использоваться в выражениях как обычный операнд, например, к нему можно что-то прибавить, отнять и пр.

**Пример 2.** Вывести информацию о книгах, количество экземпляров которых отличается от среднего количества экземпляров книг на складе более чем на 3. То есть нужно вывести и те книги, количество экземпляров которых меньше среднего на 3, и больше среднего на 3.
```sql
SELECT title, author, amount 
  FROM book 
 WHERE ABS(amount - (SELECT AVG(amount) FROM book)) >3;
```
```
Результат:
+-----------------------+------------------+--------+
| title                 | author           | amount |
+-----------------------+------------------+--------+
| Мастер и Маргарита    | Булгаков М.А.    | 3      |
| Братья Карамазовы     | Достоевский Ф.М. | 3      |
| Стихотворения и поэмы | Есенин С.А.      | 15     |
+-----------------------+------------------+--------+
```