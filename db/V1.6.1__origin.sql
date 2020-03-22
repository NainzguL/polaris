USE polaris;


CREATE TABLE OriginType (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE
)
ENGINE=INNODB;

INSERT INTO OriginType VALUES (NULL, 'geographic');
INSERT INTO OriginType VALUES (NULL, 'social');
INSERT INTO OriginType VALUES (NULL, 'school');
INSERT INTO OriginType VALUES (NULL, 'formation');

CREATE TABLE Origin (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE,
    origin_type_id INT UNSIGNED NOT NULL,
    
    CONSTRAINT fk_Origin_origin_type_id 
        FOREIGN KEY (origin_type_id)
        REFERENCES OriginType(id)
)
ENGINE=INNODB;

CREATE TABLE OriginChoiceGroup (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE OriginCompetence (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    origin_id INT UNSIGNED NOT NULL,
    competence_id INT UNSIGNED NOT NULL,
    origin_choice_group_id INT UNSIGNED,
    bonus_level INT,
    
    CONSTRAINT fk_OriginCompetence_origin_id 
        FOREIGN KEY (origin_id)
        REFERENCES Origin(id),
    CONSTRAINT fk_OriginCompetence_competence_id 
        FOREIGN KEY (competence_id)
        REFERENCES Competence(id),
    CONSTRAINT fk_OriginCompetence_origin_choice_group_id 
        FOREIGN KEY (origin_choice_group_id)
        REFERENCES OriginChoiceGroup(id)
)
ENGINE=INNODB;

