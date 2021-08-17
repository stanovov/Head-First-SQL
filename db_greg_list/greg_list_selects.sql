SELECT RIGHT(location, 2) FROM my_contacts;
SELECT SUBSTRING_INDEX(location, ',', 1) FROM my_contacts;
SELECT SUBSTRING('Сан-Антонио, TX', 5, 3);
SELECT UPPER('сШа');
SELECT LOWER('спаГЕтти');
SELECT REVERSE('спаГЕтти');
SELECT TRIM('   sadasd   ');
SELECT LENGTH('возвращает длину строки');
SELECT CHAR_LENGTH('абв');

SELECT email 
FROM my_contacts 
WHERE LOWER(profession) = 'программист';

SELECT first_name, location
FROM my_contacts
WHERE birthday = '1994-12-09';

SELECT *
FROM my_contacts
WHERE UPPER(first_name) = 'ЭНН'
	AND location LIKE '%Сан-Франциско%';

SELECT *
FROM my_contacts
WHERE location LIKE '%СА';

SELECT first_name
FROM my_contacts
WHERE first_name LIKE '_им';

SELECT mc.first_name, mc.last_name, mc.phone, jc.title
FROM 
	job_current AS jc 
		NATURAL JOIN my_contacts AS mc
		INNER JOIN job_listings AS jl
			ON jc.title = jl.title
WHERE jc.title IN (SELECT title FROM job_listings);

SELECT last_name, first_name
FROM my_contacts
WHERE zip_code IN (SELECT zip_code 
				  FROM zip_code
                  WHERE state = 'CA');
       
SELECT mc.first_name, mc.last_name, jc.salary
FROM my_contacts AS mc
	NATURAL JOIN job_current jc
WHERE jc.salary = (SELECT MAX(salary)
				FROM job_current);
      
SELECT mc.first_name, mc.last_name, jc.salary
FROM my_contacts AS mc
	NATURAL JOIN job_current jc
ORDER BY jc.salary DESC
LIMIT 1;

SELECT mc.first_name, mc.last_name,
(SELECT state
FROM zip_code
WHERE mc.zip_code = zip_code) AS state
FROM my_contacts mc;

SELECT AVG(salary)
FROM job_current
WHERE title = 'Веб-разработчик';

SELECT 
    mc.first_name AS first_name, 
    mc.last_name AS last_name,
    jc.salary AS salary,
    salary - (
		SELECT 
			AVG(salary)
		FROM job_current
			WHERE title = 'Веб-разработчик'
	) AS difference
FROM
    my_contacts mc
        NATURAL JOIN job_current jc
WHERE
    jc.title = 'Веб-разработчик';

SELECT
	title
FROM
	job_current
WHERE 
	salary = (SELECT MAX(salary) FROM job_listings);
   
   
SELECT
	mc.first_name,
    mc.last_name
FROM
	my_contacts AS mc
    NATURAL JOIN job_current AS jc
WHERE
	jc.salary > (SELECT AVG(salary) FROM job_current);

                 
SELECT
	mc.first_name,
    mc.last_name
FROM
	my_contacts AS mc
		NATURAL JOIN job_current AS jc
WHERE
	jc.title = 'Веб-разработчик'
    AND mc.zip_code IN (SELECT zip
						FROM job_listings
						WHERE title = 'Веб-разработчик');

SELECT
	first_name,
    last_name
FROM
	my_contacts
WHERE
	zip_code = (SELECT mc.zip_code
				FROM my_contacts AS mc
					NATURAL JOIN job_current AS jc
				ORDER BY jc.salary DESC
				LIMIT 1);

SELECT 
	mc.zip_code
FROM my_contacts AS mc
	NATURAL JOIN job_current AS jc
ORDER BY jc.salary DESC
LIMIT 1;

SELECT mc.first_name, mc.last_name
FROM my_contacts AS mc
WHERE 3 = (
SELECT COUNT(*)
FROM contact_interest
WHERE contact_id = mc.contact_id
);

SELECT mc.first_name, mc.last_name, mc.email
FROM my_contacts mc
WHERE NOT EXISTS
(SELECT * FROM job_current jc
WHERE mc.contact_id = jc.contact_id);

SELECT email
FROM my_contacts AS mc
WHERE 0 < (SELECT COUNT(*)
		   FROM contact_interest AS ci
           WHERE mc.contact_id = ci.contact_id)
	AND NOT EXISTS (SELECT * 
					FROM job_current jc
					WHERE mc.contact_id = jc.contact_id);

SELECT title FROM job_current
UNION
SELECT title FROM job_desired
UNION
SELECT title FROM job_listings;

CREATE TABLE my_union AS
SELECT contact_id FROM job_current
UNION
SELECT salary FROM job_listings;

SELECT * FROM my_union;

DESC my_union;

DROP TABLE my_union;

CREATE VIEW web_designers AS
SELECT 
	mc.phone, 
	mc.email
FROM 
	job_desired jd, my_contacts mc
WHERE 
	jd.title = 'Веб-дизайнер';

CREATE VIEW tech_writer_jobs AS
SELECT 
	title, 
    salary, 
    description, 
    zip
FROM
	job_listings jl
WHERE 
	title = 'Технический писатель';
    
SELECT * FROM web_designers;

CREATE VIEW job_raises AS
SELECT
	mc.last_name AS last_name,
    mc.first_name AS first_name,
    mc.email AS email,
    mc.phone AS phone,
    jc.salary AS salary,
    jd.salary_low AS salary_low,
    jd.salary_low - jc.salary AS raise
FROM
	my_contacts AS mc
		NATURAL JOIN job_current AS jc
        NATURAL JOIN job_desired AS jd;
        
SELECT * 
FROM job_raises
ORDER BY last_name;

SELECT * 
FROM
	my_contacts, job_current, job_desired;