USE polaris;

CREATE TABLE RandomBusinessAdvantage (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name_for_i18n VARCHAR(50) NOT NULL,
    carrer_id INT UNSIGNED NOT NULL,
    
    CONSTRAINT fk_RandomBusinessAdvantage_carrer_id 
        FOREIGN KEY (carrer_id)
        REFERENCES Carrer(id)
)
ENGINE=INNODB;


CREATE TABLE RandomBusinessAdvantageEffectType (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE
)
ENGINE=INNODB;

INSERT INTO RandomBusinessAdvantageEffectType VALUES (NULL, 'attribut');
INSERT INTO RandomBusinessAdvantageEffectType VALUES (NULL, 'competencePoint');
INSERT INTO RandomBusinessAdvantageEffectType VALUES (NULL, 'businessAdvantage');
INSERT INTO RandomBusinessAdvantageEffectType VALUES (NULL, 'income');
INSERT INTO RandomBusinessAdvantageEffectType VALUES (NULL, 'contact');
INSERT INTO RandomBusinessAdvantageEffectType VALUES (NULL, 'randomBusinessAdvantage');
INSERT INTO RandomBusinessAdvantageEffectType VALUES (NULL, 'roleplayElement');


CREATE TABLE RandomBusinessAdvantageEffect (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    random_business_advantage_id INT UNSIGNED NOT NULL,
    effect_type_id INT UNSIGNED NOT NULL,
    field VARCHAR(50),
    val INT,
    
    CONSTRAINT fk_RandomBusinessAdvantageEffect_random_business_advantage_id
        FOREIGN KEY (random_business_advantage_id)
        REFERENCES RandomBusinessAdvantage(id),
    CONSTRAINT fk_RandomBusinessAdvantageEffect_effect_type_id
        FOREIGN KEY (effect_type_id)
        REFERENCES RandomBusinessAdvantageEffectType(id)
)
ENGINE=INNODB;


/*
SELECT RandomBusinessAdvantage.name_for_i18n, 
  RandomBusinessAdvantageEffectType.name, 
  RandomBusinessAdvantageEffect.field,
  RandomBusinessAdvantageEffect.val 
FROM RandomBusinessAdvantageEffect
    JOIN RandomBusinessAdvantage
        ON RandomBusinessAdvantage.id = RandomBusinessAdvantageEffect.random_business_advantage_id
    JOIN RandomBusinessAdvantageEffectType
        ON RandomBusinessAdvantageEffectType.id = RandomBusinessAdvantageEffect.effect_type_id
WHERE RandomBusinessAdvantage.carrer_id = (SELECT id FROM Carrer WHERE name = 'scholar');
*/
