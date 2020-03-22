USE polaris;

CREATE TABLE BusinessAdvantage (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE
)
ENGINE=INNODB;


INSERT INTO BusinessAdvantage VALUES (NULL, 'artCraft');
INSERT INTO BusinessAdvantage VALUES (NULL, 'workshop');
INSERT INTO BusinessAdvantage VALUES (NULL, 'assembly');
INSERT INTO BusinessAdvantage VALUES (NULL, 'dataBase');
INSERT INTO BusinessAdvantage VALUES (NULL, 'bar');
INSERT INTO BusinessAdvantage VALUES (NULL, 'privateCabin');
INSERT INTO BusinessAdvantage VALUES (NULL, 'physicianPractice');
INSERT INTO BusinessAdvantage VALUES (NULL, 'miningConcessions');
INSERT INTO BusinessAdvantage VALUES (NULL, 'corruptionBlackmail');
INSERT INTO BusinessAdvantage VALUES (NULL, 'shop');
INSERT INTO BusinessAdvantage VALUES (NULL, 'tampering');
INSERT INTO BusinessAdvantage VALUES (NULL, 'falseIdentities');
INSERT INTO BusinessAdvantage VALUES (NULL, 'equipment');
INSERT INTO BusinessAdvantage VALUES (NULL, 'farmplot');
INSERT INTO BusinessAdvantage VALUES (NULL, 'personalPharmacy');
INSERT INTO BusinessAdvantage VALUES (NULL, 'hideout');
INSERT INTO BusinessAdvantage VALUES (NULL, 'smugglingRing');
INSERT INTO BusinessAdvantage VALUES (NULL, 'stockGoods');
INSERT INTO BusinessAdvantage VALUES (NULL, 'unity');
INSERT INTO BusinessAdvantage VALUES (NULL, 'fame');
INSERT INTO BusinessAdvantage VALUES (NULL, 'relationship');