CREATE TABLE IF NOT EXISTS persons(
	id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    PRIMARY KEY (id)
);

INSERT INTO persons (id, first_name, last_name) VALUES (NULL, 'Марсия', 'Брэди');
INSERT INTO persons (id, first_name, last_name) VALUES (1, 'Джен', 'Брэди');
INSERT INTO persons VALUES ('', 'Бобби', 'Брэди');
INSERT INTO persons (first_name, last_name) VALUES ('Синди', 'Брэди');
INSERT INTO persons (id, first_name, last_name) VALUES (99, 'Питер', 'Брэди');

SELECT * FROM persons;