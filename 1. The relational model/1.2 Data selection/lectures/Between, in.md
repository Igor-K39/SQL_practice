## Выборка данных, операторы BETWEEN, IN

Логическое выражение после ключевого слова WHERE может включать операторы  BETWEEN и IN. Приоритет  у этих операторов такой же как у операторов сравнения, то есть они выполняются раньше, чем NOT, AND, OR.

- Оператор BETWEEN позволяет отобрать данные, относящиеся к некоторому интервалу, включая его границы.
- Оператор  IN  позволяет выбрать данные, соответствующие значениям из списка.

**Пример 1.** Выбрать названия и количества тех книг, количество которых от 5 до 14 включительно.
```sql
SELECT title, amount 
FROM book
WHERE amount BETWEEN 5 AND 14;
```
```
Результат
+---------------+--------+
| title         | amount |
+---------------+--------+
| Белая гвардия | 5      |
| Идиот         | 10     |
+---------------+--------+
```

**Пример 2.** Выбрать названия и цены книг, написанных Булгаковым или Достоевским.
```sql
SELECT title, price 
  FROM book
 WHERE author IN ('Булгаков М.А.', 'Достоевский Ф.М.');
```
```
Результат:
+--------------------+--------+
| title              | price  |
+--------------------+--------+
| Мастер и Маргарита | 670.99 |
| Белая гвардия      | 540.50 |
| Идиот              | 460.00 |
| Братья Карамазовы  | 799.01 |
+--------------------+--------+
```