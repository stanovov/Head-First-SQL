CREATE TABLE hooptie(
	color VARCHAR(30),
    year INT,
    make VARCHAR(30),
    mo VARCHAR(30),
    howmuch DEC(15,3)
);

INSERT INTO hooptie
VALUES
('серебристый', 1998, 'Porsche', 'Boxter', 17992.540),
(NULL, 2000, 'jaguar', 'XJ', 15995),
('красный', 2002, 'Cadillac', 'Escalade', 40215.9);

-- SOLUTION

ALTER TABLE hooptie
RENAME TO car_table,
ADD COLUMN car_id INT NOT NULL AUTO_INCREMENT FIRST,
ADD PRIMARY KEY (car_id),
ADD COLUMN VIN VARCHAR(35) AFTER car_id,
CHANGE COLUMN mo model VARCHAR(30),
MODIFY COLUMN color VARCHAR(30) AFTER model,
MODIFY COLUMN year INT AFTER color,
CHANGE COLUMN howmuch price DEC(15,3)
;

UPDATE car_table SET VIN = 'RNKLK66N33G213481' WHERE make = 'Porsche';
UPDATE car_table SET VIN = 'SAEDA44B175B04113' WHERE make = 'Jaguar';
UPDATE car_table SET VIN = '3GYEK63NT2G280668' WHERE make = 'Cadillac';

SELECT * FROM car_table;