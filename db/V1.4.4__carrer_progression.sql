USE polaris;

CREATE TABLE ProgressionSetEntry (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    carrer_id INT UNSIGNED NOT NULL,
    year_from_include INT NOT NULL,
    year_to_exclude INT,
    salary_in_sol INT NOT NULL,
    
    CONSTRAINT fk_ProgressionSetEntry_carrer_id 
        FOREIGN KEY (carrer_id)
        REFERENCES Carrer(id)
)
ENGINE=INNODB;


/*
SELECT year_from_include, year_to_exclude, salary_in_sol FROM ProgressionSetEntry
WHERE carrer_id = (SELECT id FROM Carrer WHERE name = 'scholar');
*/