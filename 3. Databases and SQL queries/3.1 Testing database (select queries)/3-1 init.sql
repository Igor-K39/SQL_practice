DROP SCHEMA IF EXISTS testing CASCADE;
CREATE SCHEMA IF NOT EXISTS testing;


DROP TABLE IF EXISTS testing.subject CASCADE;
CREATE TABLE IF NOT EXISTS testing.subject (
	subject_id   BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name_subject TEXT
);

INSERT INTO testing.subject(name_subject)
VALUES ('Основы SQL'),
       ('Основы баз данных'),
       ('Физика');


DROP TABLE IF EXISTS testing.student CASCADE;
CREATE TABLE IF NOT EXISTS testing.student (
	student_id   BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name_student TEXT
);

INSERT INTO testing.student(name_student)
VALUES ('Баранов Павел'),
	   ('Абрамова Катя'),
	   ('Семенов Иван'),
	   ('Яковлева Галина');


DROP TABLE IF EXISTS testing.attempt CASCADE;
CREATE TABLE IF NOT EXISTS testing.attempt (
	attempt_id   BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	student_id   BIGINT,
	subject_id   BIGINT,
	date_attempt DATE, 
	result       BIGINT,
	CONSTRAINT "FK_attempt_student"
			FOREIGN KEY (student_id) REFERENCES testing.student (student_id) ON DELETE CASCADE,
	CONSTRAINT "FK_attempt_subject"
			FOREIGN KEY (subject_id) REFERENCES testing.subject (subject_id) ON DELETE CASCADE		
);

INSERT INTO testing.attempt(student_id, subject_id, date_attempt, result)
VALUES (1, 2, '2020-03-23',  67),
	   (3, 1, '2020-03-23', 100),
	   (4, 2, '2020-03-26',   0),
	   (1, 1, '2020-04-15',  33),
	   (3, 1, '2020-04-15',  67),
	   (4, 2, '2020-04-21', 100),
	   (3, 1, '2020-05-17',  33);	   


DROP TABLE IF EXISTS testing.question CASCADE;
CREATE TABLE IF NOT EXISTS testing.question (
	question_id   BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name_question TEXT,
	subject_id    BIGINT,
	CONSTRAINT "FK_question_subject"
	        FOREIGN KEY (subject_id) REFERENCES testing.subject (subject_id) ON DELETE CASCADE
);

INSERT INTO testing.question(name_question, subject_id)
VALUES ('Запрос на выборку начинается с ключевого слова:', 1),
	   ('Условие, по которому отбираются записи, задаётся после ключевого слова:', 1),
	   ('Для сортировки используется:', 1),
	   ('Какой запрос выбирает все записи из таблицы student:', 1),
	   ('Для внутреннего соединения таблиц используется оператор:', 1),
	   ('База данных - это:', 2),
	   ('Отношение - это:', 2),
	   ('Концептуальная модель используется для', 2),
	   ('Какой тип данных не допустим в реляционной таблице?', 2);


DROP TABLE IF EXISTS testing.answer CASCADE;
CREATE TABLE IF NOT EXISTS testing.answer (
	answer_id   BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name_answer TEXT,
	question_id BIGINT,
	is_correct  BOOLEAN,
	CONSTRAINT "FK_answer_question"
	        FOREIGN KEY (question_id) REFERENCES testing.question (question_id) ON DELETE CASCADE
);

INSERT INTO testing.answer(name_answer, question_id, is_correct) 
VALUES ('UPDATE',   1, false),
	   ('SELECT',   1, true),
	   ('INSERT',   1, false),
	   ('GROUP BY', 2, false),
	   ('FROM',     2, false),
	   ('WHERE',    2, true),
	   ('SELECT',   2, false),
	   ('SORT',     3, false),
	   ('ORDER BY', 3, true),
	   ('RANG BY',  3, false),
	   ('SELECT * FROM student', 4, true),
	   ('SELECT student',        4, false),
	   ('INNER JOIN',     5, true),
	   ('LEFT JOIN',      5, false),
	   ('RIGHT JOIN',     5, false),
	   ('CROSS JOIN',     5, false),
	   ('совокупность данных, организованных по определённым праилам',                6, true),
	   ('совокупность программ для хранения и обработки больших массивов информации', 6, false),
	   ('строка',  7, false),
	   ('столбец', 7, false), 
	   ('таблица', 7, true),
	   ('обобщенное представление пользователей о данных',   8, true),
	   ('описание представления данных в памяти компьютера', 8, false),
	   ('база данных', 8, false),
	   ('file',    9, true),
	   ('INT',     9, false),
	   ('VARCHAR', 9, false),
	   ('DATE',    9, false);

DROP TABLE IF EXISTS testing.testing CASCADE;
CREATE TABLE IF NOT EXISTS testing.testing (
	testing_id  BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	attempt_id  BIGINT,
	question_id	BIGINT,
	answer_id   BIGINT,
	CONSTRAINT "FK_testing_attempt" 
			FOREIGN KEY (attempt_id) REFERENCES testing.attempt (attempt_id) ON DELETE CASCADE,
	CONSTRAINT "FK_testing_question"
			FOREIGN KEY (question_id) REFERENCES testing.question (question_id) ON DELETE CASCADE,
	CONSTRAINT "FK_testing_answer" 
			FOREIGN KEY (answer_id) REFERENCES testing.answer (answer_id) ON DELETE CASCADE
);

INSERT INTO testing.testing(attempt_id, question_id, answer_id)
VALUES (1, 9, 25),
	   (1, 7, 19),
	   (1, 6, 17),
	   (2, 3, 9),
	   (2, 1, 2),
	   (2, 4, 11),
	   (3, 6, 18),
	   (3, 8, 24),
	   (3, 9, 28),
	   (4, 1, 2),
	   (4, 5, 16),
	   (4, 3, 10),
	   (5, 2, 6),
	   (5, 1, 2),
	   (5, 4, 12),
	   (6, 6, 17),
	   (6, 8, 22),
	   (6, 7, 21),
	   (7, 1, 3),
	   (7, 4, 11),
	   (7, 5, 16);