DROP TABLE IF EXISTS fish_info;

CREATE TABLE fish_info(
	common VARCHAR(50),
    species VARCHAR(50),
    location VARCHAR(100),
    weight VARCHAR(20)
);

INSERT INTO fish_info 
VALUES 
('большеротый окунь', 'M. salmoides', 'Монтгомери Лейк, GA', '22 фт 4 унц'),
('судак', 'S. vitreus', 'Олд Хикори Лейк, TN', '25 фт 0 унц'),
('лосось Кларка', 'O. Clarki', 'Пирамид Лейк, NV', '41 фт 0 унц'),
('желтый окунь', 'P. Flavescens', 'Бордентаун, NJ', '4 фт 3 унц'),
('синежаберник', 'L. Macrochirus', 'Кетона Лейк, AL', '4 фт 12 унц'),
('панцирник', 'L. Osseus', 'Тринити Ривер, TX', '50 фт 5 унц'),
('белый краппи', 'P. annularis', 'Дамба Энид, MS', '1 фт 0 унц'),
('красноперая щука', 'E. americanus', 'Дьюарт Лейк, IN', '1 фт 0 унц'),
('серебристый карась', 'C. auratus', 'Лейк Ходжес, CA', '6 фт 10 унц'),
('чавыча', 'O. Tshawytscha', 'Кенай Ривер, AK', '97 фт 4 унц');

SELECT *
FROM fish_info
WHERE location LIKE '%NJ';