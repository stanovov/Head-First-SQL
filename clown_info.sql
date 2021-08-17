CREATE TABLE IF NOT EXISTS clown_info(
	name varchar(50),
    last_seen varchar(150),
    appearance varchar(255),
    activities varchar(50)
);

DELETE FROM clown_info;

INSERT INTO clown_info VALUES ('Элси', 'Дом престарелых Черри Хилл', 'Ж, рыжие волосы, зеленый костюм, огромные ботинки', 'шарики, машинки');
INSERT INTO clown_info VALUES ('Пиклз', 'Вечеринка Джека Грина', 'М, оранжевые волосы, синий костюм, огромные ботинки', 'мим');
INSERT INTO clown_info VALUES ('Снаглз', 'Болмарт', 'Ж, желтая рубашка, красные штаны', 'рожок, зонтик');
INSERT INTO clown_info VALUES ('Мистер Хобо', 'Цирк BG', 'М, сигара, черные волосы, маленькая шляпа', 'скрипка');
INSERT INTO clown_info VALUES ('Кларабелл', 'Дом престарелых Бельмонт', 'Ж, розовые волосы, большой цветок, синее платье', 'кричалки, танцы');
INSERT INTO clown_info VALUES ('Скутер', 'Больница Окленд', 'М, синие волосы, красный костюм, большой нос', 'шарики');
INSERT INTO clown_info VALUES ('Зиппо', 'Торговый центр Милстоун', 'Ж, оранжевый костюм, штаны', 'танцы');
INSERT INTO clown_info VALUES ('Бэйб', 'Автошкола Эрла', 'Ж, розовый костюм с блестками', 'эквилибристика, машинки');
INSERT INTO clown_info VALUES ('Бонзо', '', 'М, женское платье в горошек', 'пение, танцы');
INSERT INTO clown_info VALUES ('Снифлз', 'Заведение Трэйси', 'М, зелено-фиолетовый костюм, длинный нос', '');
-- INSERT INTO clown_info VALUES ('Зиппо', 'Торговый центр Милстоун', 'Ж, оранжевый костюм, штаны', 'танцы, пение');
-- INSERT INTO clown_info VALUES ('Снаглз', 'Болмарт', 'Ж, желтая рубашка, синие штаны', 'рожок, зонтик');
-- INSERT INTO clown_info VALUES ('Бонзо', 'Парк Диксон', 'М, женское платье в горошек', 'пение, танцы');
-- INSERT INTO clown_info VALUES ('Снифлз', 'Заведение Трэйси', 'М, зелено-фиолетовый костюм, длинный нос', 'разъезжает на машинке');
-- INSERT INTO clown_info VALUES ('Мистер Хобо', 'Вечеринка Эрика Грея', 'М, сигара, черные волосы, маленькая шляпа', 'скрипка');
-- INSERT INTO clown_info VALUES ('Мистер Хобо', 'Парк Диксон', 'М, сигара, черные волосы, маленькая шляпа', 'скрипка');

SELECT * FROM clown_info;
SELECT * FROM clown_info WHERE name = 'Зиппо';

DELETE FROM clown_info
WHERE
activities = 'танцы';

UPDATE clown_info
SET last_seen = 'Заведение Трэйси'
WHERE name = 'Мистер Хобо'
AND last_seen = 'Парк Диксон';

-- Зиппо теперь поет
UPDATE clown_info
SET activities = 'пение'
WHERE name = 'Зиппо';

-- Снаглз носит синие штаны
UPDATE clown_info
SET appearance = 'Ж, желтая рубашка, синие штаны'
WHERE name = 'Снаглз';

-- Бонзо видели в парке Диксон
UPDATE clown_info
SET last_seen = 'Парк Диксон'
WHERE name = 'Бонзо';

-- Снифлз разъезжает на машинке
UPDATE clown_info
SET activities = 'разъезжает на машинке'
WHERE name = 'Снифлз';

-- Мистера Хобо видели на вечеринке Эрика Грея
UPDATE clown_info
SET last_seen = 'Вечеринка Эрика Грея'
WHERE name = 'Мистер Хобо';