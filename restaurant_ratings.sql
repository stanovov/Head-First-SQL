CREATE TABLE restaurant_ratings(
	name VARCHAR(50),
    rating INT
);

INSERT INTO restaurant_ratings
VALUES 
('Pizza House', 3), ('The Shack', 7), ('ARthur\'s', 9), ('Ribs \'n\' More', 5);

SELECT *
FROM restaurant_ratings
WHERE
	rating IN 
		(SELECT rating FROM restaurant_ratings
		 WHERE rating > 3 AND rating < 9);
         
SELECT *
FROM restaurant_ratings
WHERE
	rating > ALL
		(SELECT rating FROM restaurant_ratings
		 WHERE rating > 3 AND rating < 9);
         
SELECT *
FROM restaurant_ratings
WHERE
	rating < ALL
		(SELECT rating FROM restaurant_ratings
		 WHERE rating > 3 AND rating < 9);
         
SELECT *
FROM restaurant_ratings
WHERE
	rating > ANY
		(SELECT rating FROM restaurant_ratings
		 WHERE rating > 3 AND rating < 9);
         
CREATE TEMPORARY TABLE my_temp_table AS 
SELECT * FROM restaurant_ratings WHERE rating > 3 AND rating < 9;

SELECT * FROM my_temp_table;

SELECT current_user();