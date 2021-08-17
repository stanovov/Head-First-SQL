CREATE TABLE IF NOT EXISTS drink_info(
	drink_name VARCHAR(100),
    cost DEC(2,1),
    carbs DEC(3,1),
    color VARCHAR(100),
    ice CHAR(1),
    calories INT
);

DELETE FROM drink_info;

INSERT INTO drink_info VALUES ('Терновник', 3, 8.4, 'желтый', 'Д', 33);
INSERT INTO drink_info VALUES ('Голубая луна', 2.5, 3.2, 'синий', 'Д', 12);
INSERT INTO drink_info VALUES ('Вот тебе на', 3.5, 8.6, 'оранжевый', 'Д', 35);
INSERT INTO drink_info VALUES ('Лаймовый физз', 2.5, 5.4, 'зеленый', 'Д', 24);
INSERT INTO drink_info VALUES ('Поцелуй', 5.5, 42.5, 'фиолетовый', 'Д', 171);
INSERT INTO drink_info VALUES ('Горячее золото', 3.2, 32.1, 'оранжевый', 'Н', 135);
INSERT INTO drink_info VALUES ('Одинокое дерево', 3.6, 4.2, 'красный', 'Д', 17);
INSERT INTO drink_info VALUES ('Борзая', 4, 14, 'желтый', 'Д', 50);
INSERT INTO drink_info VALUES ('Бабье лето', 2.8, 7.2, 'коричневый', 'Н', 30);
INSERT INTO drink_info VALUES ('Лягушка', 2.6, 21.5, 'бронзовый', 'Д', 80);
INSERT INTO drink_info VALUES ('Сода плюс', 3.8, 4.7, 'красный', 'Н', 19);

SELECT * FROM drink_info;

SELECT drink_name
FROM drink_info
WHERE drink_name >= 'Г' AND drink_name < 'Д';

-- напитки с ценой более 3.50, содержащие не более 50 калорий
SELECT drink_name
FROM drink_info
WHERE cost >= 3.5 AND calories < 50;
    
-- цены желтых напитков со льдом, содержащих более 33 калорий
SELECT cost
FROM drink_info
WHERE ice = 'Д' AND calories > 33 AND color = 'желтый';
    
-- названия и цвета напитков, содержащих не более 4 граммов углеводов, в которые кладется лед
SELECT drink_name, color
FROM drink_info
WHERE carbs <= 4 AND ice = 'Д';
    
-- цены напитков, содержащих 80 и более калорий
SELECT cost
FROM drink_info
WHERE calories >= 80;
    
-- напитки "Борзая" и "Поцелуй", с цветом и информацией об использованиии льда, но без указания названий напитков в запросе
SELECT drink_name, color, ice
FROM drink_info
WHERE cost > 3.8;
    
-- напитки, чья калорийность находится в диапазоне от 30 до 60 включительно
SELECT drink_name
FROM drink_info
WHERE calories BETWEEN 30 AND 60;

-- напитки содержащие более 60 или менее 30 калорий
SELECT drink_name, calories
FROM drink_info
WHERE NOT calories BETWEEN 30 AND 60;

-- запрос, который возвращает названия всех напитков, начинающиеся с букв "Д" до "О".
SELECT drink_name
FROM drink_info
WHERE drink_name BETWEEN 'Д' AND 'О';

-- Уменьшите калорийность "Поцелуя" до 170
INSERT INTO drink_info VALUES ('Поцелуй', 5.5, 42.5, 'фиолетовый', 'Д', 170);
DELETE FROM drink_info WHERE drink_name = 'Поцелуй' AND calories = 171;

-- Замените жетлый цвет "золотистым"
INSERT INTO drink_info VALUES ('Терновник', 3, 8.4, 'золотистый', 'Д', 33);
INSERT INTO drink_info VALUES ('Борзая', 4, 14, 'золотистый', 'Д', 50);
DELETE FROM drink_info WHERE color = 'желтый';

-- Для всех напитков, стоящих 2.5, поднять цену до 3.5, а для напитков с ценой 3.5 - до 4.5.
-- INSERT INTO drink_info VALUES ('Вот тебе на', 4.5, 8.6, 'оранжевый', 'Д', 35);
-- DELETE FROM drink_info WHERE cost = 3.5;
-- INSERT INTO drink_info VALUES ('Голубая луна', 3.5, 3.2, 'синий', 'Д', 12);
-- INSERT INTO drink_info VALUES ('Лаймовый физз', 3.5, 5.4, 'зеленый', 'Д', 24);
-- DELETE FROM drink_info WHERE cost = 2.5;
UPDATE drink_info
SET cost = cost + 1
WHERE cost = 2.5 OR cost = 3.5;