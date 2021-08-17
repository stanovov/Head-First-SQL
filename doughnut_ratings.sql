CREATE TABLE doughnut_ratings(
	location VARCHAR(100),
    time TIME,
    date DATE,
    type VARCHAR(30),
    rating INT,
    comments VARCHAR(100)
);

INSERT INTO doughnut_ratings VALUES ('Starbuzz Coffee', '7:43', '2021-04-23', 'с корицей', 6, 'слишком много пряностей');
INSERT INTO doughnut_ratings VALUES ('Duncan\'s Donuts', '8:56', '2021-08-25', 'с глазурью', 5, 'жирноваты');
INSERT INTO doughnut_ratings VALUES ('Duncan\'s Donuts', '19:58', '2021-04-26', 'с вареньем', 6, 'вчерашние, но вкусные');
INSERT INTO doughnut_ratings VALUES ('Starbuzz Coffee', '22:35', '2021-04-24', 'с глазурью', 7, 'теплые, но не горячие');
INSERT INTO doughnut_ratings VALUES ('Krispy King', '21:39', '2021-09-26', 'с вареньем', 6, 'мало варенья');
INSERT INTO doughnut_ratings VALUES ('Starbuzz Coffee', '7:48', '2021-04-23', 'шоколадный кекс', 10, 'с зефиром!');
INSERT INTO doughnut_ratings VALUES ('Krispy King', '20:56', '2021-11-25', 'с глазурью', 8, 'кленовый сироп');
INSERT INTO doughnut_ratings VALUES ('Starbuzz Coffee', '8:20', '2021-09-20', 'с глазурью', 10, 'СУПЕР!11');

SELECT * FROM doughnut_ratings;

SELECT location
FROM doughnut_ratings
WHERE type = 'с глазурью' AND rating = 10;

UPDATE doughnut_ratings
SET
type = 'глазированные'
WHERE type = 'с глазурью';