USE polaris;

CREATE TABLE CompetenceCategories (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE
)
ENGINE=INNODB;

INSERT INTO CompetenceCategories VALUES (1, 'physicalSkills');
INSERT INTO CompetenceCategories VALUES (2, 'closeCombat');
INSERT INTO CompetenceCategories VALUES (3, 'rangeCombat');
INSERT INTO CompetenceCategories VALUES (4, 'socialeSkill');
INSERT INTO CompetenceCategories VALUES (5, 'knowledge');
INSERT INTO CompetenceCategories VALUES (6, 'furtivity');
INSERT INTO CompetenceCategories VALUES (7, 'steering');
INSERT INTO CompetenceCategories VALUES (8, 'survivalCat');
INSERT INTO CompetenceCategories VALUES (9, 'techniques');
INSERT INTO CompetenceCategories VALUES (10, 'specialCat');
INSERT INTO CompetenceCategories VALUES (11, 'bitchy');
