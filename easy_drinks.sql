CREATE TABLE easy_drinks(
	drink_name VARCHAR(16),
    main VARCHAR(20),
    amount1 DEC(3,1),
    second VARCHAR(20),
    amount2 DEC(4,2),
    directions VARCHAR(250)
);

INSERT INTO easy_drinks(drink_name, main, amount1, second, amount2, directions) VALUES ('Терновник', 'тоник', 1.5, 'ананасовый сок', 1, 'взболтать со льдом, разлить по бокалам, украсить лимонной цедрой');
INSERT INTO easy_drinks(drink_name, main, amount1, second, amount2, directions) VALUES ('Голубая луна', 'содовая', 1.5, 'черничный сок', 0.75, 'взболтать со льдом, разлить по бокалам, украсить лимонной цедрой');
INSERT INTO easy_drinks(drink_name, main, amount1, second, amount2, directions) VALUES ('Вот тебе на', 'персиковый нектар', 1, 'ананасовый сок', 1, 'взболтать со льдом, разлить по стаканам');
INSERT INTO easy_drinks(drink_name, main, amount1, second, amount2, directions) VALUES ('Лаймовый физз', 'Спрайт', 1.5, 'сок лайма', 0.75, 'взболтать со льдом, разлить по бокалам');
INSERT INTO easy_drinks(drink_name, main, amount1, second, amount2, directions) VALUES ('Поцелуй', 'вишневый сок', 2, 'абрикосовый нектар', 7, 'подавать со льдом и соломинкой');
INSERT INTO easy_drinks(drink_name, main, amount1, second, amount2, directions) VALUES ('Горячее золото', 'персиковый нектар', 3, 'апельсиновый сок', 6, 'влить в кружку горячий апельсиновый сок, добавить персиковый нектар');
INSERT INTO easy_drinks(drink_name, main, amount1, second, amount2, directions) VALUES ('Одинокое дерево', 'содовая', 1.5, 'вишневый сок', 0.75, 'взболтать со льдом, разлить по бокалам');
INSERT INTO easy_drinks(drink_name, main, amount1, second, amount2, directions) VALUES ('Борзая', 'содовая', 1.5, 'грейпфрутовый сок', 5, 'подавать со льдом, тщательно взболтать');
INSERT INTO easy_drinks(drink_name, main, amount1, second, amount2, directions) VALUES ('Бабье лето', 'яблочный сок', 2, 'горячий чай', 6, 'налить сок в кружку, добавить горячий чай');
INSERT INTO easy_drinks(drink_name, main, amount1, second, amount2, directions) VALUES ('Лягушка', 'холодный чай', 1.5, 'лимонад', 5, 'подавать на льду с ломтиком лайма');
INSERT INTO easy_drinks(drink_name, main, amount1, second, amount2, directions) VALUES ('Сода плюс', 'содовая', 2, 'виноградный сок', 1, 'взболтать в бокале, подавать без льда');

SELECT * FROM easy_drinks;
SELECT * FROM easy_drinks WHERE main = 'Спрайт';
SELECT * FROM easy_drinks WHERE main = 'содовая';
SELECT * FROM easy_drinks WHERE amount2 = 6;
SELECT * FROM easy_drinks WHERE second = "апельсиновый сок";
SELECT * FROM easy_drinks WHERE amount1 < 1.5;
SELECT * FROM easy_drinks WHERE amount2 < '1';
SELECT * FROM easy_drinks WHERE main > 'содовая';
SELECT * FROM easy_drinks WHERE amount1 = '1.5';
SELECT drink_name, main, second FROM easy_drinks;
SELECT drink_name, main, second FROM easy_drinks WHERE main = 'вишневый сок';
SELECT drink_name, main, second FROM easy_drinks WHERE second = 'абрикосовый нектар';
SELECT drink_name, main, second FROM easy_drinks WHERE amount2 = 7;
SELECT drink_name, main, second FROM easy_drinks WHERE directions LIKE 'подавать со льдом и соломинкой';

-- поиск коктейля с вишневым соком
SELECT drink_name
FROM easy_drinks
WHERE main = 'вишневый сок' OR second = 'вишневый сок';

SELECT drink_name FROM easy_drinks
WHERE amount1 >= 1.50;

SELECT drink_name FROM drink_info
WHERE ice = 'Н';

SELECT drink_name FROM drink_info
WHERE calories >= 20;
