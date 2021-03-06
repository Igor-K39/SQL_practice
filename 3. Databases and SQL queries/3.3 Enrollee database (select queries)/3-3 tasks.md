### Задание 1.

Вывести абитуриентов, которые хотят поступать на образовательную программу «Мехатроника и робототехника» в отсортированном по фамилиям виде.

Фрагмент логической схемы базы данных:

![ ](https://ucarecdn.com/5bafc977-00f6-4709-80b1-1ff175681d19/)

Результат:
```
+-----------------+
| name_enrollee   |
+-----------------+
| Баранов Павел   |
| Попов Илья      |
| Семенов Иван    |
| Степанова Дарья |
+-----------------+
```

### Задание 2.

Вывести образовательные программы, на которые для поступления необходим предмет «Информатика». Программы отсортировать в обратном алфавитном порядке.

Фрагмент логической схемы базы данных:

![ ](https://ucarecdn.com/8b1f2861-3ed6-4533-9ed0-10fde1ec0f92/)

Результат:
```
+-------------------------------------+
| name_program                        |
+-------------------------------------+
| Прикладная математика и информатика |
| Математика и компьютерные науки     |
+-------------------------------------+
```

### Задание 3.

Выведите количество абитуриентов, сдавших ЕГЭ по каждому предмету, максимальное, минимальное и среднее значение баллов по предмету ЕГЭ. Вычисляемые столбцы назвать Количество, Максимум, Минимум, Среднее. Информацию отсортировать по названию предмета в алфавитном порядке, среднее значение округлить до одного знака после запятой.
```
+------------+------------+-------------+-----------+
| testing_id | attempt_id | question_id | answer_id |
+------------+------------+-------------+-----------+
| 22         | 8          | 7           | 19        |
| 23         | 8          | 6           | 17        |
| 24         | 8          | 8           | 22        |
+------------+------------+-------------+-----------+
```

Фрагмент логической схемы базы данных:

![ ](https://ucarecdn.com/b519096f-729d-43ef-b4b2-a752f8169843/)

Результат:
```
+--------------+------------+----------+---------+---------+
| name_subject | Количество | Максимум | Минимум | Среднее |
+--------------+------------+----------+---------+---------+
| Информатика  | 4          | 94       | 75      | 82.0    |
| Математика   | 6          | 92       | 67      | 75.3    |
| Русский язык | 6          | 90       | 65      | 77.5    |
| Физика       | 5          | 90       | 41      | 69.8    |
+--------------+------------+----------+---------+---------+
```

### Задание 4.

Вывести образовательные программы, для которых минимальный балл ЕГЭ по каждому предмету больше или равен 40 баллам. Программы вывести в отсортированном по алфавиту виде.

Фрагмент логической схемы базы данных:

![ ](https://ucarecdn.com/c159caa8-0d39-41f8-b5bf-7ccb16669df9/)

Результат:
```
+-------------------------------------+
| name_program                        |
+-------------------------------------+
| Мехатроника и робототехника         |
| Прикладная математика и информатика |
+-------------------------------------+
```

### Задание 5.

Вывести образовательные программы, которые имеют самый большой план набора,  вместе с этой величиной.

Фрагмент логической схемы базы данных:

![ ](https://ucarecdn.com/c59b5da0-f7bc-47ae-bd7d-882a3ccd84a3/)

Результат:
```
+-----------------------------+------+
| name_program                | plan |
+-----------------------------+------+
| Мехатроника и робототехника | 3    |
+-----------------------------+------+
```

### Задание 6.

Посчитать, сколько дополнительных баллов получит каждый абитуриент. Столбец с дополнительными баллами назвать Бонус. Информацию вывести в отсортированном по фамилиям виде.

Фрагмент логической схемы базы данных:

![ ](https://ucarecdn.com/4bd9ba3f-142d-436f-9207-6512de694370/)

Результат:
```
+-----------------+-------+
| name_enrollee   | Бонус |
+-----------------+-------+
| Абрамова Катя   | 0     |
| Баранов Павел   | 6     |
| Попов Илья      | 8     |
| Семенов Иван    | 5     |
| Степанова Дарья | 0     |
| Яковлева Галина | 1     |
+-----------------+-------+
```

### Задание 8.

Вывести образовательные программы, на которые для поступления необходимы предмет «Информатика» и «Математика» в отсортированном по названию программ виде.
Фрагмент логической схемы базы данных:

![ ](https://ucarecdn.com/98c706e5-0118-4fa9-ae09-4a934ece5bc8/)

Результат:
```
+-------------------------------------+
| name_program                        |
+-------------------------------------+
| Математика и компьютерные науки     |
| Прикладная математика и информатика |
+-------------------------------------+
```

### Задание 9.

Посчитать количество баллов каждого абитуриента на каждую образовательную программу, на которую он подал заявление, по результатам ЕГЭ. В результат включить название образовательной программы, фамилию и имя абитуриента, а также столбец с суммой баллов, который назвать itog. Информацию вывести в отсортированном сначала по образовательной программе, а потом по убыванию суммы баллов виде.

![ ](https://ucarecdn.com/4f7e6cd2-4d21-46a0-b7ba-52132f8c1fb8/)

Результат:
```
+-------------------------------------+-----------------+------+
| name_program                        | name_enrollee   | itog |
+-------------------------------------+-----------------+------+
| Математика и компьютерные науки     | Степанова Дарья | 276  |
| Математика и компьютерные науки     | Семенов Иван    | 230  |
| Математика и компьютерные науки     | Абрамова Катя   | 226  |
| Мехатроника и робототехника         | Степанова Дарья | 270  |
| Мехатроника и робототехника         | Семенов Иван    | 242  |
| Мехатроника и робототехника         | Попов Илья      | 192  |
| Мехатроника и робототехника         | Баранов Павел   | 179  |
| Прикладная математика и информатика | Семенов Иван    | 230  |
| Прикладная математика и информатика | Абрамова Катя   | 226  |
| Прикладная математика и информатика | Баранов Павел   | 213  |
| Прикладная механика                 | Степанова Дарья | 270  |
| Прикладная механика                 | Яковлева Галина | 238  |
| Прикладная механика                 | Попов Илья      | 192  |
| Прикладная механика                 | Баранов Павел   | 179  |
+-------------------------------------+-----------------+------+
```

### Задание 10.

Вывести название образовательной программы и фамилию тех абитуриентов, которые подавали документы на эту образовательную программу, но не могут быть зачислены на нее. Эти абитуриенты имеют результат по одному или нескольким предметам ЕГЭ, необходимым для поступления на эту образовательную программу, меньше минимального балла. Информацию вывести в отсортированном сначала по программам, а потом по фамилиям абитуриентов виде.

![ ](https://ucarecdn.com/98c706e5-0118-4fa9-ae09-4a934ece5bc8/)

Результат:
```
+-----------------------------+---------------+
| name_program                | name_enrollee |
+-----------------------------+---------------+
| Мехатроника и робототехника | Баранов Павел |
| Прикладная механика         | Баранов Павел |
+-----------------------------+---------------+
```


