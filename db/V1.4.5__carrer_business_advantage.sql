USE polaris;


CREATE TABLE CarrerBusinessAdvantage (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    carrer_id INT UNSIGNED NOT NULL,
    business_advantage_id INT UNSIGNED NOT NULL,
    
    CONSTRAINT fk_CarrerBusinessAdvantage_carrer_id 
        FOREIGN KEY (carrer_id)
        REFERENCES Carrer(id),
    CONSTRAINT fk_CarrerBusinessAdvantage_business_advantage_id
        FOREIGN KEY (business_advantage_id)
        REFERENCES BusinessAdvantage(id)
)
ENGINE=INNODB;


