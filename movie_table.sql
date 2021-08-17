DROP TABLE movie_table;

CREATE TABLE movie_table(
	movie_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(100),
    rating CHAR(2),
    drama CHAR(1),
    comedy CHAR(1),
    action CHAR(1),
    gore CHAR(1),
    scifi CHAR(1),
    for_kids CHAR(1),
    cartoon CHAR(1),
    category VARCHAR(50),
    purchased DATE,
    PRIMARY KEY (movie_id)
);

INSERT INTO movie_table 
(title, rating, drama, comedy, action, gore, scifi, for_kids, cartoon, category, purchased)
VALUES 
('Большое приключение', 		'PG', 	'Н', 'Н', 'Н', 'Н', 'Н', 'Н', 'Д', '', '2002-03-06'),
('Грег: Неизвестные истории', 	'PG', 	'Н', 'Н', 'Д', 'Н', 'Н', 'Н', 'Н', '', '2001-02-05'),
('Безумные клоуны', 			'R', 	'Н', 'Н', 'Н', 'Д', 'Н', 'Н', 'Н', '', '1999-11-20'),
('Параскеведекатриафобия', 		'R', 	'Д', 'Д', 'Д', 'Н', 'Д', 'Н', 'Н', '', '2003-04-19'),
('Крыса по имени Дарси', 		'G', 	'Н', 'Н', 'Н', 'Н', 'Н', 'Д', 'Н', '', '2003-04-19'),
('Конец очереди', 				'R', 	'Д', 'Н', 'Н', 'Д', 'Д', 'Н', 'Д', '', '2001-02-05'),
('Блестящие вещи', 				'PG', 	'Д', 'Н', 'Н', 'Н', 'Н', 'Н', 'Н', '', '2002-03-06'),
('Заберите обратно', 			'R', 	'Н', 'Д', 'Н', 'Н', 'Н', 'Н', 'Н', '', '2001-02-05'),
('Наживка для акул', 			'G', 	'Н', 'Н', 'Н', 'Н', 'Н', 'Д', 'Н', '', '1999-11-20'),
('Разгневанный пират', 			'PG', 	'Н', 'Д', 'Н', 'Н', 'Н', 'Н', 'Д', '', '2003-04-19'),
('Планета пригодна для жизни', 	'PG', 	'Н', 'Д', 'Н', 'Н', 'Д', 'Н', 'Н', '', '2001-02-05');

UPDATE movie_table
SET category =
CASE
	WHEN drama = 'Д' THEN 'драма'
    WHEN comedy = 'Д' THEN 'комедия'
    WHEN action = 'Д' THEN 'боевик'
    WHEN gore = 'Д' THEN 'ужасы'
    WHEN scifi = 'Д' THEN 'фантастика'
    WHEN for_kids = 'Д' THEN 'семейное'
    WHEN cartoon = 'Д' AND rating = 'G' THEN 'семейное'
    ELSE 'разное'
END;

UPDATE movie_table
SET category = 
CASE
	WHEN drama = 'Д' AND rating = 'R' THEN 'драма-r'
    WHEN comedy = 'Д' AND rating = 'R' THEN 'комедия-r'
    WHEN action = 'Д' AND rating = 'R' THEN 'боевик-r'
    WHEN gore = 'Д' AND rating = 'R' THEN 'ужасы-r'
    WHEN scifi = 'Д' AND rating = 'R' THEN 'фантастика-r'
    WHEN category = 'разное' AND rating = 'G' THEN 'семейное'
    ELSE category
END;

UPDATE movie_table
SET category = 
CASE
	WHEN category = 'драма-r' THEN 'драма'
	WHEN category = 'комедия-r' THEN 'комедия'
	WHEN category = 'боевик-r' THEN 'боевик'
	WHEN category = 'ужасы-r' THEN 'ужасы'
	WHEN category = 'фантастика-r' THEN 'фантастика'
    ELSE category
END;

ALTER TABLE movie_table
DROP COLUMN drama,
DROP COLUMN comedy,
DROP COLUMN action,
DROP COLUMN gore,
DROP COLUMN scifi,
DROP COLUMN for_kids,
DROP COLUMN cartoon;

SELECT * FROM movie_table;

SELECT title, category
FROM movie_table
ORDER BY category, title;

SELECT title, category, purchased
FROM movie_table
ORDER BY title ASC, purchased DESC;