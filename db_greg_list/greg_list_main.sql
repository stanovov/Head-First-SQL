DROP TABLE IF EXISTS my_contacts;

CREATE TABLE my_contacts(
	contact_id INT NOT NULL AUTO_INCREMENT,
	last_name VARCHAR(30),
	first_name VARCHAR(20),
    phone VARCHAR(10),
    email VARCHAR(50),
    gender CHAR(1),
    birthday DATE,
    profession VARCHAR(50),
    city VARCHAR(50),
    state CHAR(2),
    status VARCHAR(20),
    interests VARCHAR(100),
    seeking VARCHAR(100),
    PRIMARY KEY (contact_id)
);

INSERT INTO my_contacts 
(last_name, first_name, phone, email, gender, birthday, profession, city, state, status, interests, seeking) 
VALUES
('Андерсон', 'Джиллиан', '8123313112', 'jill_anderson@breakneckpizza.com', 'Ж', '1980-05-09', 'Писатель', 'Пало-Альто', 'CA', 'Не замужем','Каяк, террариум', 'Друзья'),
('Тот', 'Энн', '7928299112', 'Ann_Toth@leapinlimos.com', 'Ж', '1999-06-10', 'Журналист', 'Пало-Альто', 'CA', 'Не замужем', 'Волейбол', 'Новую работу'),
('Фанион', 'Стив', '7922999223', 'steve@onionflavoredrings.com', 'М', '1970-01-04', 'Панк', 'Гровер\' Милл', 'NJ', 'Не женат', 'Бунтарство', 'Единомышленники, гитаристы'),
('Становов', 'Семён', '8900200552', 'sestanovov@gmail.com', 'М', '1994-12-09', 'Программист', 'Натчез', 'MS', 'Не женат', 'Готовка, Брокерский счет', 'Музу'),
('Смит', 'Тим', '8800555353', 'tim_smithhhh@gmail.com', 'М', '1989-09-15', 'Музыкант', 'Нью-Йорк', 'NY', 'Женат', 'Скейтборд', 'Смысл жизни'),
('Мур', 'Найджел', '5552311111', 'nigelmoore@ranchersrule.com', 'М', '1975-08-28', 'Фермер', 'Остин', 'TX', 'Не женат', 'животные, лошади, кино', 'Незамужняя женщина'),
('Фиоре', 'Карла', '5557894855', 'cfiore@fioreanimalclinic.com', 'Ж', '1974-07-01', 'Ветеринар', 'Раунд-Рок', 'TX', 'Не замужем', 'лошади, кино, животные, детективы, туризм', 'Одинокий мужчина'),
('Салливан', 'Реджи', '5552311122', 'me@kathieleeisaflake.com', 'М', '1955-03-20', 'Комик', 'Кембридж', 'MA', 'Не женат', 'животные, коллекционные карточки, геопоиск', 'Женщина'),
('Джо', 'Лонниган', '555-3214', 'jo_lo@asdasd.com', 'М', '1992-01-21', 'Программист', 'Лос-Анджелес', 'CA', 'Не женат', 'программирование', 'деньги');

# ++table `profession`++
DROP TABLE IF EXISTS profession;

CREATE TABLE profession (
    prof_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    profession VARCHAR(20)
) AS SELECT profession FROM
    my_contacts
GROUP BY profession
ORDER BY profession;

ALTER TABLE my_contacts ADD COLUMN prof_id INT REFERENCES profession(prof_id);

UPDATE my_contacts mc
	INNER JOIN profession p
		ON mc.profession = p.profession
SET
	mc.prof_id = p.prof_id;
    
ALTER TABLE my_contacts DROP COLUMN profession;
# --table `profession`--


# ++table `zip_code`++
DROP TABLE IF EXISTS zip_code;

CREATE TABLE zip_code(
	city VARCHAR(50),
    state CHAR(2)
) AS SELECT city, state FROM
	my_contacts
GROUP BY city, state
ORDER BY city, state;

ALTER TABLE zip_code ADD COLUMN zip_code VARCHAR(10);

UPDATE zip_code SET zip_code = '08550' WHERE city = 'Гровер\' Милл';
UPDATE zip_code SET zip_code = '02114' WHERE city = 'Кембридж';
UPDATE zip_code SET zip_code = '39120' WHERE city = 'Натчез';
UPDATE zip_code SET zip_code = '10001' WHERE city = 'Нью-Йорк';
UPDATE zip_code SET zip_code = '73301' WHERE city = 'Остин';
UPDATE zip_code SET zip_code = '94028' WHERE city = 'Пало-Альто';
UPDATE zip_code SET zip_code = '78664' WHERE city = 'Раунд-Рок';
UPDATE zip_code SET zip_code = '22002' WHERE city = 'Лос-Анджелес';

ALTER TABLE zip_code MODIFY COLUMN zip_code VARCHAR(10) NOT NULL PRIMARY KEY;

ALTER TABLE my_contacts ADD COLUMN zip_code VARCHAR(10) REFERENCES zip_code(zip_code);

UPDATE my_contacts mc
	INNER JOIN zip_code z
		ON mc.city = z.city
		AND mc.state = z.state
SET
	mc.zip_code = z.zip_code;
    
ALTER TABLE my_contacts DROP COLUMN city, DROP COLUMN state;
# --table `zip_code`--


# ++table `status`++
DROP TABLE IF EXISTS status;

CREATE TABLE status (
    status_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(20)
) AS SELECT status FROM
    my_contacts
GROUP BY status
ORDER BY status;

ALTER TABLE my_contacts ADD COLUMN status_id INT REFERENCES status(status_id);

UPDATE my_contacts mc
	INNER JOIN status s
		ON mc.status = s.status
SET
	mc.status_id = s.status_id;
    
ALTER TABLE my_contacts DROP COLUMN status;
# --table `status`--


# +++Копирование интересов в не атомарные доп. колонки+++
ALTER TABLE my_contacts
ADD COLUMN interest1 VARCHAR(50) AFTER interests,
ADD COLUMN interest2 VARCHAR(50) AFTER interest1,
ADD COLUMN interest3 VARCHAR(50) AFTER interest2,
ADD COLUMN interest4 VARCHAR(50) AFTER interest3;

UPDATE my_contacts SET interest1 = SUBSTRING_INDEX(interests, ',', 1);
UPDATE my_contacts SET interests = TRIM(RIGHT(interests, (CHAR_LENGTH(interests) - CHAR_LENGTH(interest1) - 1)));
UPDATE my_contacts SET interest2 = SUBSTRING_INDEX(interests, ',', 1);
UPDATE my_contacts SET interests = TRIM(RIGHT(interests, (CHAR_LENGTH(interests) - CHAR_LENGTH(interest2) - 1)));
UPDATE my_contacts SET interest3 = SUBSTRING_INDEX(interests, ',', 1);
UPDATE my_contacts SET interests = TRIM(RIGHT(interests, (CHAR_LENGTH(interests) - CHAR_LENGTH(interest3) - 1)));
UPDATE my_contacts SET interest4 = SUBSTRING_INDEX(interests, ',', 1);

ALTER TABLE my_contacts DROP COLUMN interests;
# ---Копирование интересов в не атомарные доп. колонки---


# ++table `interests`++
DROP TABLE IF EXISTS interests;

CREATE TABLE interests(
	interest_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    interest VARCHAR(50)
) AS 
SELECT interest1 AS interest
FROM my_contacts
WHERE interest1 <> ''
UNION
SELECT interest2
FROM my_contacts
WHERE interest2 <> ''
UNION
SELECT interest3
FROM my_contacts
WHERE interest3 <> ''
UNION
SELECT interest4
FROM my_contacts
WHERE interest4 <> '';

DROP TABLE IF EXISTS contact_interest;

CREATE TABLE contact_interest(
	contact_id INT REFERENCES my_contacts(contact_id),
    interest_id INT REFERENCES interests(interest_id)
) AS 
SELECT 
	mc.contact_id AS contact_id,
    i.interest_id AS interest_id
FROM my_contacts mc
	INNER JOIN interests i
    ON mc.interest1 = i.interest
    OR mc.interest2 = i.interest
    OR mc.interest3 = i.interest
    OR mc.interest4 = i.interest
ORDER BY mc.first_name, mc.last_name;

ALTER TABLE my_contacts
DROP COLUMN interest1,
DROP COLUMN interest2,
DROP COLUMN interest3,
DROP COLUMN interest4;
# --table `interests`--


# +++Копирование поиска в не атомарные доп. колонки+++
ALTER TABLE my_contacts
ADD COLUMN seeking1 VARCHAR(50),
ADD COLUMN seeking2 VARCHAR(50);
UPDATE my_contacts SET seeking1 = SUBSTRING_INDEX(seeking, ',', 1);
UPDATE my_contacts SET seeking = TRIM(RIGHT(seeking, (CHAR_LENGTH(seeking) - CHAR_LENGTH(seeking1) - 1)));
UPDATE my_contacts SET seeking2 = SUBSTRING_INDEX(seeking, ',', 1);
ALTER TABLE my_contacts DROP COLUMN seeking;
# ---Копирование поиска в не атомарные доп. колонки---


# ++table `seeking`++
DROP TABLE IF EXISTS seeking;

CREATE TABLE seeking(
	seeking_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    seeking VARCHAR(50)
) AS 
SELECT seeking1 AS seeking
FROM my_contacts
WHERE seeking1 <> ''
UNION
SELECT seeking2
FROM my_contacts
WHERE seeking2 <> '';

DROP TABLE IF EXISTS contact_seeking;

CREATE TABLE contact_seeking(
	contact_id INT REFERENCES my_contacts(contact_id),
    seeking_id INT REFERENCES seeking(seeking_id)
) AS 
SELECT 
	mc.contact_id AS contact_id,
    s.seeking_id AS seeking_id
FROM my_contacts mc
	INNER JOIN seeking s
    ON mc.seeking1 = s.seeking
    OR mc.seeking2 = s.seeking
ORDER BY mc.first_name, mc.last_name;

ALTER TABLE my_contacts
DROP COLUMN seeking1,
DROP COLUMN seeking2;
# --table `seeking`--


# ++table `job_current`++
DROP TABLE IF EXISTS job_current;

CREATE TABLE job_current(
	contact_id INT NOT NULL UNIQUE REFERENCES my_contacts(contact_id),
    title VARCHAR(100),
    salary DEC(12,2),
    start_date DATE
);

INSERT INTO job_current 
(contact_id, title, salary, start_date) 
VALUES
(1, 'Писатель', 125000, '2003-08-09'),
(2, 'Журналист', 25000, '2020-12-12'),
(4, 'Веб-разработчик', 80000, '2018-08-01'),
(5, 'Композитор', '190000', '2001-09-02'),
(6, 'Фермер', '50000', '2005-01-01'),
(7, 'Ветеринар', '60000', '2010-02-03'),
(8, 'Стендап-комик', '75000', '2015-02-15'),
(9, 'Веб-разработчик', 105000, '2015-09-06');
# --table `job_current`++


# ++table `job_desired`++
DROP TABLE IF EXISTS job_desired;

CREATE TABLE job_desired(
	contact_id INT NOT NULL UNIQUE REFERENCES my_contacts(contact_id),
    title VARCHAR(100),
    salary_low DEC(12,2),
	salary_high DEC(12,2),
    years_exp DEC(3,1)
);

INSERT INTO job_desired
(contact_id, title, salary_low, salary_high, years_exp)
VALUES
(2, 'Журналист', 35000, 60000, 1),
(3, 'Чиновник', 450000, 1000000, 0),
(4, 'Веб-разработчик', 100000, 150000, 3),
(7, 'Ветеринар', 80000, 120000, 11),
(9, 'Веб-разработчик', 130000, 220000, 6);
# --table `job_desired`--


# ++table `job_listings`++
DROP TABLE IF EXISTS job_listings;

CREATE TABLE job_listings(
	job_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100), 
    salary DEC(12,2),
    zip VARCHAR(10),
    description TEXT
);

INSERT INTO job_listings
(title, salary, zip, description)
VALUES
('Веб-разработчик', 100000, '39120', 'Какое-то описание'),
('Повар', 20000, 'NJ', 'Some text...');
# --table `job_listings`--

CREATE INDEX all_contacts_names
ON my_contacts (last_name, first_name);

SELECT * FROM status;