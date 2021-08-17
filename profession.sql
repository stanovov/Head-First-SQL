CREATE TABLE profession (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    profession VARCHAR(20)
) AS SELECT profession AS mc_prof FROM
    my_contacts
GROUP BY mc_prof
ORDER BY mc_prof;

SELECT * FROM profession;