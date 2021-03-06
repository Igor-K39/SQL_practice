### Задание 1.

Вывести студентов, которые сдавали дисциплину «Основы баз данных», указать дату попытки и результат. Информацию вывести по убыванию результатов тестирования.

Фрагмент логической схемы базы данных:

![ ](https://ucarecdn.com/d46b4a8e-ef49-4335-815b-f3d685f63a13/)

Результат:
```
+-----------------+--------------+--------+
| name_student    | date_attempt | result |
+-----------------+--------------+--------+
| Яковлева Галина | 2020-04-21   | 100    |
| Баранов Павел   | 2020-03-23   | 67     |
| Яковлева Галина | 2020-03-26   | 0      |
+-----------------+--------------+--------+
```

### Задание 2.

Вывести, сколько попыток сделали студенты по каждой дисциплине, а также средний результат попыток, который округлить до 2 знаков после запятой. Под результатом попытки понимается процент правильных ответов на вопросы теста, который занесен в столбец result.  В результат включить название дисциплины, а также вычисляемые столбцы Количество и Среднее. Информацию вывести по убыванию средних результатов.

Фрагмент логической схемы базы данных:

![ ](https://ucarecdn.com/d8715483-b850-4ce8-8e2d-12ac8ba18d0c/)

Результат:
```
+-------------------+------------+---------+
| name_subject      | Количество | Среднее |
+-------------------+------------+---------+
| Основы SQL        | 4          | 58.25   |
| Основы баз данных | 3          | 55.67   |
| Физика            | 0          | None    |
+-------------------+------------+---------+
```

### Задание 3.

Вывести студентов (различных студентов), имеющих максимальные результаты попыток. Информацию отсортировать в алфавитном порядке по фамилии студента.

Фрагмент логической схемы базы данных:

![ ](https://ucarecdn.com/3d7b1b34-90b4-4d76-aea0-03369872489d/)

Результат:
```
+-----------------+--------+
| name_student    | result |
+-----------------+--------+
| Семенов Иван    | 100    |
| Яковлева Галина | 100    |
+-----------------+--------+
```

### Задание 4.

Если студент совершал несколько попыток по одной и той же дисциплине, то вывести разницу в днях между первой и последней попыткой. В результат включить фамилию и имя студента, название дисциплины и вычисляемый столбец Интервал. Информацию вывести по возрастанию разницы. Студентов, сделавших одну попытку по дисциплине, не учитывать. 

Фрагмент логической схемы базы данных:

![ ](https://ucarecdn.com/0702acbe-ec20-457d-85e4-6df22e070656/)

Результат:
```
+-----------------+-------------------+----------+
| name_student    | name_subject      | Интервал |
+-----------------+-------------------+----------+
| Яковлева Галина | Основы баз данных | 26       |
| Семенов Иван    | Основы SQL        | 55       |
+-----------------+-------------------+----------+
```

### Задание 5.

Студенты могут тестироваться по одной или нескольким дисциплинам (не обязательно по всем). Вывести дисциплину и количество уникальных студентов (столбец назвать Количество), которые по ней проходили тестирование . Информацию отсортировать сначала по убыванию количества, а потом по названию дисциплины. В результат включить и дисциплины, тестирование по которым студенты еще не проходили, в этом случае указать количество студентов 0.

Фрагмент логической схемы базы данных:

![ ](https://ucarecdn.com/306248a6-1b7c-4b93-8106-31a368482f0c/)

Результат:
```
+-------------------+------------+
| name_subject      | Количество |
+-------------------+------------+
| Основы SQL        | 2          |
| Основы баз данных | 2          |
| Физика            | 0          |
+-------------------+------------+
```

### Задание 6.

Случайным образом отберите 3 вопроса по дисциплине «Основы баз данных». В результат включите столбцы question_id и name_question.

Фрагмент логической схемы базы данных:

![ ](https://ucarecdn.com/332c38fe-08e4-4c27-bc71-3b3200f43c3b/)

Результат:
```
+-------------+----------------------------------------+
| question_id | name_question                          |
+-------------+----------------------------------------+
| 8           | Концептуальная модель используется для |
| 7           | Отношение - это:                       |
| 6           | База данных - это:                     |
+-------------+----------------------------------------+
```

### Задание 7.

Вывести вопросы, которые были включены в тест для Семенова Ивана по дисциплине «Основы SQL» 2020-05-17  (значение attempt_id для этой попытки равно 7). Указать, какой ответ дал студент и правильный он или нет (вывести Верно или Неверно). В результат включить вопрос, ответ и вычисляемый столбец  Результат.

Фрагмент логической схемы базы данных:

![ ](https://ucarecdn.com/9cea1edc-98ee-4215-ae29-70ebf8aaea21/)

Результат:
```
+----------------------------------------------------------+-----------------------+-----------+
| name_question                                            | name_answer           | Результат |
+----------------------------------------------------------+-----------------------+-----------+
| Запрос на выборку начинается с ключевого слова:          | INSERT                | Неверно   |
| Какой запрос выбирает все записи из таблицы student:     | SELECT * FROM student | Верно     |
| Для внутреннего соединения таблиц используется оператор: | CROSS JOIN            | Неверно   |
+----------------------------------------------------------+-----------------------+-----------+
```

### Задание 8.

Посчитать результаты тестирования. Результат попытки вычислить как количество правильных ответов, деленное на 3 (количество вопросов в каждой попытке) и умноженное на 100. Результат округлить до двух знаков после запятой. Вывести фамилию студента, название предмета, дату и результат. Последний столбец назвать Результат. Информацию отсортировать сначала по фамилии студента, потом по убыванию даты попытки.

Фрагмент логической схемы базы данных:

![ ](https://ucarecdn.com/e4669333-8898-434f-b1a5-4fa88b39ae02/)

Результат:
```
+-----------------+-------------------+--------------+-----------+
| name_student    | name_subject      | date_attempt | Результат |
+-----------------+-------------------+--------------+-----------+
| Баранов Павел   | Основы SQL        | 2020-04-15   | 33.33     |
| Баранов Павел   | Основы баз данных | 2020-03-23   | 66.67     |
| Семенов Иван    | Основы SQL        | 2020-05-17   | 33.33     |
| Семенов Иван    | Основы SQL        | 2020-04-15   | 66.67     |
| Семенов Иван    | Основы SQL        | 2020-03-23   | 100.00    |
| Яковлева Галина | Основы баз данных | 2020-04-21   | 100.00    |
| Яковлева Галина | Основы баз данных | 2020-03-26   | 0.00      |
+-----------------+-------------------+--------------+-----------+
```

### Задание 9.

Для каждого вопроса вывести процент успешных решений, то есть отношение количества верных ответов к общему количеству ответов, значение округлить до 2-х знаков после запятой. Также вывести название предмета, к которому относится вопрос, и общее количество ответов на этот вопрос. В результат включить название дисциплины, вопросы по ней (столбец назвать Вопрос), а также два вычисляемых столбца Всего_ответов и Успешность. Информацию отсортировать сначала по названию дисциплины, потом по убыванию успешности, а потом по тексту вопроса в алфавитном порядке. Поскольку тексты вопросов могут быть длинными, обрезать их 30 символов и добавить многоточие "...".

Фрагмент логической схемы базы данных:

![ ](https://ucarecdn.com/e4669333-8898-434f-b1a5-4fa88b39ae02/)

Результат:
```
+-------------------+-----------------------------------+---------------+------------+
| name_subject      | Вопрос                            | Всего_ответов | Успешность |
+-------------------+-----------------------------------+---------------+------------+
| Основы SQL        | Условие, по которому отбираютс... | 1             | 100.00     |
| Основы SQL        | Запрос на выборку начинается с... | 4             | 75.00      |
| Основы SQL        | Какой запрос выбирает все запи... | 3             | 66.67      |
| Основы SQL        | Для сортировки используется:...   | 2             | 50.00      |
| Основы SQL        | Для внутреннего соединения таб... | 2             | 0.00       |
| Основы баз данных | База данных - это:...             | 3             | 66.67      |
| Основы баз данных | Какой тип данных не допустим в... | 2             | 50.00      |
| Основы баз данных | Концептуальная модель использу... | 2             | 50.00      |
| Основы баз данных | Отношение - это:...               | 2             | 50.00      |
+-------------------+-----------------------------------+---------------+------------+
```




