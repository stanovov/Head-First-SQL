DROP TABLE piggy_bank;

CREATE TABLE piggy_bank(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    coin CHAR(1) NOT NULL,
    coin_year CHAR(4)
);

INSERT INTO piggy_bank 
(coin, coin_year)
VALUES
('Q', 1950), ('P', 1973), ('N', 2005),
('Q', 1999), ('Q', 1981), ('D', 1940),
('Q', 1980), ('P', 2001), ('D', 1926),
('P', 1999);

CREATE VIEW pb_quarters AS 
SELECT * 
FROM piggy_bank 
WHERE coin = 'Q';

INSERT INTO pb_quarters VALUES (NULL, 'Q', 1993);

START TRANSACTION;
SELECT * FROM piggy_bank;
UPDATE piggy_bank SET coin = 'Q' WHERE coin = 'P';
SELECT * FROM piggy_bank;
ROLLBACK;
SELECT * FROM piggy_bank;

START TRANSACTION;
SELECT * FROM piggy_bank;
UPDATE piggy_bank SET coin = 'Q' WHERE coin = 'P';
SELECT * FROM piggy_bank;
COMMIT;
SELECT * FROM piggy_bank;