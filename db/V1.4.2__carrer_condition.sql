USE polaris;

CREATE TABLE PrerequisiteType (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE
)
ENGINE=INNODB;

INSERT INTO PrerequisiteType VALUES (NULL, 'artCraft');
INSERT INTO PrerequisiteType VALUES (NULL, 'graduateStudies');
INSERT INTO PrerequisiteType VALUES (NULL, 'min3yearExp');


CREATE TABLE Prerequisite (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    prerequisite_type_id INT UNSIGNED NOT NULL,
    CONSTRAINT fk_prerequisite_type_id 
        FOREIGN KEY (prerequisite_type_id)
        REFERENCES PrerequisiteType(id)
)
ENGINE=INNODB;

CREATE TABLE PrerequisiteVal (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    prerequisite_id INT UNSIGNED NOT NULL,
    val VARCHAR(50) NOT NULL,
    
    CONSTRAINT fk_prerequisite_id
        FOREIGN KEY (prerequisite_id)
        REFERENCES Prerequisite(id)
)
ENGINE=INNODB;

CREATE TABLE CarrerPrerequisite (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    carrer_id INT UNSIGNED NOT NULL,
    prerequisite_id INT UNSIGNED NOT NULL,
    
    CONSTRAINT fk_carrer_id 
        FOREIGN KEY (carrer_id)
        REFERENCES Carrer(id),
    CONSTRAINT fk2_prerequisite_id 
        FOREIGN KEY (prerequisite_id)
        REFERENCES Prerequisite(id)
)
ENGINE=INNODB;

DELIMITER |
CREATE PROCEDURE Carrer_insertPrerequisiteVal1(
  carrer_name VARCHAR(50),
  prerequisite_type_name VARCHAR(50),
  val1 VARCHAR(50))
BEGIN
  SET @prerequisite_type_id = (SELECT id FROM PrerequisiteType WHERE name = prerequisite_type_name);
  SET @carrer_id = (SELECT id FROM Carrer WHERE name = carrer_name);
  SET @prerequisite_id = '';
  INSERT INTO Prerequisite VALUES (NULL, @prerequisite_type_id);
  SELECT LAST_INSERT_ID() INTO @prerequisite_id;
  INSERT INTO PrerequisiteVal VALUES (NULL, @prerequisite_id, val1);
  INSERT INTO CarrerPrerequisite VALUES (NULL, @carrer_id, @prerequisite_id);
END|
DELIMITER ;


DELIMITER |
CREATE PROCEDURE Carrer_insertPrerequisiteVal2(
  carrer_name VARCHAR(50),
  prerequisite_type_name VARCHAR(50),
  val1 VARCHAR(50),
  val2 VARCHAR(50))
BEGIN
  SET @prerequisite_type_id = (SELECT id FROM PrerequisiteType WHERE name = prerequisite_type_name);
  SET @carrer_id = (SELECT id FROM Carrer WHERE name = carrer_name);
  SET @prerequisite_id = '';
  INSERT INTO Prerequisite VALUES (NULL, @prerequisite_type_id);
  SELECT LAST_INSERT_ID() INTO @prerequisite_id;
  INSERT INTO PrerequisiteVal VALUES (NULL, @prerequisite_id, val1);
  INSERT INTO PrerequisiteVal VALUES (NULL, @prerequisite_id, val2);
  INSERT INTO CarrerPrerequisite VALUES (NULL, @carrer_id, @prerequisite_id);
END|
DELIMITER ;

DELIMITER |
CREATE PROCEDURE Carrer_insertPrerequisiteVal3(
  carrer_name VARCHAR(50),
  prerequisite_type_name VARCHAR(50),
  val1 VARCHAR(50),
  val2 VARCHAR(50),
  val3 VARCHAR(50))
BEGIN
  SET @prerequisite_type_id = (SELECT id FROM PrerequisiteType WHERE name = prerequisite_type_name);
  SET @carrer_id = (SELECT id FROM Carrer WHERE name = carrer_name);
  SET @prerequisite_id = '';
  INSERT INTO Prerequisite VALUES (NULL, @prerequisite_type_id);
  SELECT LAST_INSERT_ID() INTO @prerequisite_id;
  INSERT INTO PrerequisiteVal VALUES (NULL, @prerequisite_id, val1);
  INSERT INTO PrerequisiteVal VALUES (NULL, @prerequisite_id, val2);
  INSERT INTO PrerequisiteVal VALUES (NULL, @prerequisite_id, val3);
  INSERT INTO CarrerPrerequisite VALUES (NULL, @carrer_id, @prerequisite_id);
END|
DELIMITER ;


DELIMITER |
CREATE PROCEDURE Carrer_insertPrerequisiteVal4(
  carrer_name VARCHAR(50),
  prerequisite_type_name VARCHAR(50),
  val1 VARCHAR(50),
  val2 VARCHAR(50),
  val3 VARCHAR(50),
  val4 VARCHAR(50))
BEGIN
  SET @prerequisite_type_id = (SELECT id FROM PrerequisiteType WHERE name = prerequisite_type_name);
  SET @carrer_id = (SELECT id FROM Carrer WHERE name = carrer_name);
  SET @prerequisite_id = '';
  INSERT INTO Prerequisite VALUES (NULL, @prerequisite_type_id);
  SELECT LAST_INSERT_ID() INTO @prerequisite_id;
  INSERT INTO PrerequisiteVal VALUES (NULL, @prerequisite_id, val1);
  INSERT INTO PrerequisiteVal VALUES (NULL, @prerequisite_id, val2);
  INSERT INTO PrerequisiteVal VALUES (NULL, @prerequisite_id, val3);
  INSERT INTO PrerequisiteVal VALUES (NULL, @prerequisite_id, val4);
  INSERT INTO CarrerPrerequisite VALUES (NULL, @carrer_id, @prerequisite_id);
END|
DELIMITER ;


/*
SELECT PrerequisiteVal.prerequisite_id, PrerequisiteVal.val 
FROM PrerequisiteVal
INNER JOIN CarrerPrerequisite ON PrerequisiteVal.prerequisite_id = CarrerPrerequisite.prerequisite_id
WHERE CarrerPrerequisite.carrer_id = (SELECT id FROM Carrer WHERE name = 'scholar');
*/




