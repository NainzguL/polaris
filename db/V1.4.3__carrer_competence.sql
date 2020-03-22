USE polaris;

CREATE TABLE CarrerCompetence (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    carrer_id INT UNSIGNED NOT NULL,
    competence_id INT UNSIGNED NOT NULL,
    
    CONSTRAINT fk_carrerCompetence_carrer_id 
        FOREIGN KEY (carrer_id)
        REFERENCES Carrer(id),
    CONSTRAINT fk_carrerCompetence_competence_id 
        FOREIGN KEY (competence_id)
        REFERENCES Competence(id)
)
ENGINE=INNODB;

CREATE TABLE CompetenceChoiceSet (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    carrer_id INT UNSIGNED NOT NULL,
    number INT NOT NULL,
    
    CONSTRAINT fk_CompetenceChoiceSet_carrer_id 
        FOREIGN KEY (carrer_id)
        REFERENCES Carrer(id)
)
ENGINE=INNODB;

CREATE TABLE CompetenceChoiceEntry (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    competence_choice_set_id INT UNSIGNED NOT NULL,
    competence_id INT UNSIGNED NOT NULL,
    
    CONSTRAINT fk_CompetenceChoiceEntry_competence_choice_set_id 
        FOREIGN KEY (competence_choice_set_id)
        REFERENCES CompetenceChoiceSet(id),
    CONSTRAINT fk_CompetenceChoiceEntry_competence_id 
        FOREIGN KEY (competence_id)
        REFERENCES Competence(id)
)
ENGINE=INNODB;


DELIMITER |
CREATE PROCEDURE Carrer_insertCompetenceChoice(
  carrer_name VARCHAR(50),
  nb_choise INT,
  list_of_cmps VARCHAR(500))
BEGIN
  SET @carrer_id = (SELECT id FROM Carrer WHERE name = carrer_name);
  SET @competence_choice_set_id = '';
  INSERT INTO CompetenceChoiceSet VALUES (NULL, @carrer_id, nb_choise);
  SELECT LAST_INSERT_ID() INTO @competence_choice_set_id;
  
  SET @insert_value1 = REPLACE(list_of_cmps, '#', '(NULL, @competence_choice_set_id, (SELECT id FROM Competence WHERE name ='); 
  SET @insert_value2 = REPLACE(@insert_value1, '$', ')),');
  SET @insert_value3 = TRIM(TRAILING ',' FROM @insert_value2);
  SET @sql = concat("INSERT INTO CompetenceChoiceEntry VALUES ", @insert_value3);
  
  PREPARE stmt FROM @sql;
  EXECUTE stmt;
END|
DELIMITER ;

/*
CALL Carrer_insertCompetenceChoice('scholar', 6, "#'knowAdministration'$#'knowAstrophysics'$#'knowBiology'$#'knowBotany'$#'knowForensics'$#'knowLaw'$#'knowEconomic'$#'knowGeology'$#'knowGeography'$#'knowHistory'$#'knowPsychology'$#'knowPhysics'$#'knowPoliticalScience'$#'knowSociology'$#'knowZoology'$");  

SELECT CompetenceChoiceEntry.competence_choice_set_id, CompetenceChoiceSet.number, Competence.name 
FROM CompetenceChoiceEntry
    JOIN CompetenceChoiceSet
        ON CompetenceChoiceSet.id = CompetenceChoiceEntry.competence_choice_set_id
    JOIN Competence
        ON Competence.id = CompetenceChoiceEntry.competence_id
WHERE CompetenceChoiceSet.carrer_id = (SELECT id FROM Carrer WHERE name = 'scholar');

**/



