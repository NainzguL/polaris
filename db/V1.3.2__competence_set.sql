USE polaris;

CREATE TABLE CompetenceSet (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE
)
ENGINE=INNODB;

INSERT INTO CompetenceSet VALUES (1, 'nation');
INSERT INTO CompetenceSet VALUES (2, 'organisation');
