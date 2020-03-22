USE polaris;


CREATE TABLE Caracter (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    ower_id INT UNSIGNED NOT NULL,
    name VARCHAR(256) ,
    genetic_type VARCHAR(256),
    age INT NOT NULL,
	gender VARCHAR(1) NOT NULL, 
	fertility BIT NOT NULL,
	belonging_community_id INT UNSIGNED,
	geographic_origin_id INT UNSIGNED,
	social_origin_id INT UNSIGNED,
	formation_origin_id INT UNSIGNED,
	school_origin_id INT UNSIGNED,
	pc_to_Pa INT NOT NULL,
	for_att INT NOT NULL,
	con_att INT NOT NULL,
	coo_att INT NOT NULL,
	ada_att INT NOT NULL,
	per_att INT NOT NULL,
	int_att INT NOT NULL,
	vol_att INT NOT NULL,
	pre_att INT NOT NULL,
    
    CONSTRAINT fk_Caracter_ower_id 
        FOREIGN KEY (ower_id)
        REFERENCES User(id),
    CONSTRAINT fk_Caracter_belonging_community_id 
        FOREIGN KEY (belonging_community_id)
        REFERENCES Nation(id),
    CONSTRAINT fk_Caracter_geographic_origin_id 
        FOREIGN KEY (geographic_origin_id)
        REFERENCES Origin(id),
    CONSTRAINT fk_Caracter_social_origin_id
        FOREIGN KEY (social_origin_id)
        REFERENCES Origin(id),
    CONSTRAINT fk_Caracter_formation_origin_id
        FOREIGN KEY (formation_origin_id)
        REFERENCES Origin(id),
    CONSTRAINT fk_Caracter_school_origin_id 
        FOREIGN KEY (school_origin_id)
        REFERENCES Origin(id)
)
ENGINE=INNODB;


CREATE TABLE CaracterCarrer (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    caracter_id INT UNSIGNED NOT NULL,
    carier_id INT UNSIGNED NOT NULL,
	year_experience INT NOT NULL
)
ENGINE=INNODB;


CREATE TABLE CaracterOriginCmpChoice (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    caracter_id INT UNSIGNED NOT NULL,
    chosen_competence_id INT UNSIGNED NOT NULL,
    groupe_choice_id INT UNSIGNED NOT NULL,
    
    CONSTRAINT fk_CaracterOriginCmpChoice_caracter_id 
        FOREIGN KEY (caracter_id)
        REFERENCES Caracter(id),
    CONSTRAINT fk_CaracterOriginCmpChoice_competence_id 
        FOREIGN KEY (chosen_competence_id)
        REFERENCES Competence(id),
    CONSTRAINT fk_CaracterOrigin_groupe_choice_id
        FOREIGN KEY (groupe_choice_id)
        REFERENCES OriginChoiceGroup(id)
)
ENGINE=INNODB;


CREATE TABLE CaracterCarrerCmpChoice (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    caracter_id INT UNSIGNED NOT NULL,
    chosen_competence_id INT UNSIGNED NOT NULL,
    choice_set_id INT UNSIGNED NOT NULL,
    
    CONSTRAINT fk_CaracterCarrerCmpChoice_caracter_id 
        FOREIGN KEY (caracter_id)
        REFERENCES Caracter(id),
    CONSTRAINT fk_CaracterCarrerCmpChoice_competence_id 
        FOREIGN KEY (chosen_competence_id)
        REFERENCES Competence(id),
    CONSTRAINT fk__CaracterCarrerCmpChoice_choice_set_id
        FOREIGN KEY (choice_set_id)
        REFERENCES CompetenceChoiceSet(id)
)
ENGINE=INNODB;


CREATE TABLE CaracterCompetenceLevel (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    caracter_id INT UNSIGNED NOT NULL,
    competence_id INT UNSIGNED NOT NULL,
    level INT UNSIGNED NOT NULL,
    
    CONSTRAINT uq_caracter_cmp UNIQUE(caracter_id, competence_id),
    CONSTRAINT fk_CaracterCompetenceLevel_caracter_id 
        FOREIGN KEY (caracter_id)
        REFERENCES Caracter(id),
    CONSTRAINT fk_CaracterCompetenceLevel_competence_id 
        FOREIGN KEY (competence_id)
        REFERENCES Competence(id)
)
ENGINE=INNODB;

