DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS project_list;

CREATE TABLE projects(
	number INT(11),
    descriptionofporj VARCHAR(50),
    contractoronjob VARCHAR(10)
);

DESCRIBE projects;

INSERT INTO projects VALUES (1, 'покраска дома', 'Мэрфи');
INSERT INTO projects VALUES (2, 'перестройка кухни', 'Вальдес');
INSERT INTO projects VALUES (3, 'укладка паркета', 'Келлер');
INSERT INTO projects VALUES (4, 'кровельные работы', 'Джексон');

ALTER TABLE projects
RENAME TO project_list;

ALTER TABLE project_list
CHANGE COLUMN number proj_id INT NOT NULL AUTO_INCREMENT,
ADD PRIMARY KEY (`proj_id`);

ALTER TABLE project_list
CHANGE COLUMN descriptionofporj proj_desc VARCHAR(100),
CHANGE COLUMN contractoronjob con_name VARCHAR(30);

ALTER TABLE project_list
MODIFY COLUMN proj_desc VARCHAR(120);

ALTER TABLE project_list
ADD COLUMN con_phone VARCHAR(10),
ADD COLUMN start_date DATE,
ADD COLUMN est_cost DEC(7,2);

ALTER TABLE project_list
DROP COLUMN start_date;

SELECT * FROM project_list;