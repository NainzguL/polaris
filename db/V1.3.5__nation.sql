USE polaris;

CREATE TABLE Nation (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE,
    connaisance_nat_or_cmp_id INT UNSIGNED NOT NULL,
    CONSTRAINT fk_connaisance_nat_or_cmp_id 
        FOREIGN KEY (connaisance_nat_or_cmp_id)
        REFERENCES Competence(id)
)
ENGINE=INNODB;

INSERT INTO Nation ( name, connaisance_nat_or_cmp_id ) 
VALUES ('hegemony', (SELECT id FROM Competence WHERE name = 'natHegemonie'));
INSERT INTO Nation ( name, connaisance_nat_or_cmp_id ) 
VALUES ('redLeague', (SELECT id FROM Competence WHERE name = 'natRedLeague'));
INSERT INTO Nation ( name, connaisance_nat_or_cmp_id ) 
VALUES ('coralRepublic', (SELECT id FROM Competence WHERE name = 'natCoralRepublic'));
INSERT INTO Nation ( name, connaisance_nat_or_cmp_id ) 
VALUES ('equinoxe', (SELECT id FROM Competence WHERE name = 'natEquinoxe'));
INSERT INTO Nation ( name, connaisance_nat_or_cmp_id ) 
VALUES ('mediterranneanUnion', (SELECT id FROM Competence WHERE name = 'natMediterraneanUnion'));
INSERT INTO Nation ( name, connaisance_nat_or_cmp_id ) 
VALUES ('polarAlliance', (SELECT id FROM Competence WHERE name = 'natPolarAlliance'));
INSERT INTO Nation ( name, connaisance_nat_or_cmp_id ) 
VALUES ('amazonia', (SELECT id FROM Competence WHERE name = 'natAmazonia'));
INSERT INTO Nation ( name, connaisance_nat_or_cmp_id ) 
VALUES ('riftState', (SELECT id FROM Competence WHERE name = 'natRiftState'));
INSERT INTO Nation ( name, connaisance_nat_or_cmp_id ) 
VALUES ('enderby', (SELECT id FROM Competence WHERE name = 'natEnderby'));
INSERT INTO Nation ( name, connaisance_nat_or_cmp_id ) 
VALUES ('capFederation', (SELECT id FROM Competence WHERE name = 'natCapFederation'));
INSERT INTO Nation ( name, connaisance_nat_or_cmp_id ) 
VALUES ('fuegoLibertad', (SELECT id FROM Competence WHERE name = 'natFuegoLibertad'));
INSERT INTO Nation ( name, connaisance_nat_or_cmp_id ) 
VALUES ('lemurie', (SELECT id FROM Competence WHERE name = 'natLemurie'));
INSERT INTO Nation ( name, connaisance_nat_or_cmp_id ) 
VALUES ('rodhia', (SELECT id FROM Competence WHERE name = 'natRodhia'));
INSERT INTO Nation ( name, connaisance_nat_or_cmp_id ) 
VALUES ('indus', (SELECT id FROM Competence WHERE name = 'natIndus'));
INSERT INTO Nation ( name, connaisance_nat_or_cmp_id ) 
VALUES ('pirateCommunity', (SELECT id FROM Competence WHERE name = 'natPirate'));
