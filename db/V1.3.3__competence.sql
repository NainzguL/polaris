USE polaris;

CREATE TABLE Competence (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE,
    cat_id INT UNSIGNED NOT NULL,
    set_id INT UNSIGNED,
    base INT,
    attr1 VARCHAR(3) NOT NULL, 
    attr2 VARCHAR(3) NOT NULL,
    limiting BIT NOT NULL,
    naturalIncrease BIT NOT NULL,
    CONSTRAINT fk_cat_id 
        FOREIGN KEY (cat_id)
        REFERENCES CompetenceCategories(id),
    CONSTRAINT fk_set_id 
        FOREIGN KEY (set_id)
        REFERENCES CompetenceSet(id)
)
ENGINE=INNODB;


INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'natOriginNation',
	(SELECT id FROM CompetenceCategories WHERE name = 'bitchy'),
	NULL,
	0, 'nil', 'nil', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'natHostNation',
	(SELECT id FROM CompetenceCategories WHERE name = 'bitchy'),
	NULL,
	0, 'nil', 'nil', 0, 0);

	
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'balance',
	(SELECT id FROM CompetenceCategories WHERE name = 'physicalSkills'),
	NULL,
	0, 'coo', 'coo', 1, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'athletism',
	(SELECT id FROM CompetenceCategories WHERE name = 'physicalSkills'),
	NULL,
	0, 'for', 'coo', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'endurance',
	(SELECT id FROM CompetenceCategories WHERE name = 'physicalSkills'),
	NULL,
	0, 'con', 'vol', 1, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'climbing',
	(SELECT id FROM CompetenceCategories WHERE name = 'physicalSkills'),
	NULL,
	0, 'for', 'coo', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'breathing',
	(SELECT id FROM CompetenceCategories WHERE name = 'physicalSkills'),
	NULL,
	-3, 'con', 'vol', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'closeHeavyWeapons',
	(SELECT id FROM CompetenceCategories WHERE name = 'closeCombat'),
	NULL,
	0, 'for', 'for', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'closeSpecialWeapons',
	(SELECT id FROM CompetenceCategories WHERE name = 'closeCombat'),
	NULL,
	-3, 'coo', 'coo', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'aggressiveMartialArts',
	(SELECT id FROM CompetenceCategories WHERE name = 'closeCombat'),
	NULL,
	-3, 'coo', 'ada', 1, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'defensiveMartialArts',
	(SELECT id FROM CompetenceCategories WHERE name = 'closeCombat'),
	NULL,
	-3, 'coo', 'ada', 1, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'wrestling',
	(SELECT id FROM CompetenceCategories WHERE name = 'closeCombat'),
	NULL,
	-3, 'coo', 'ada', 1, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'unarmedStruggle',
	(SELECT id FROM CompetenceCategories WHERE name = 'closeCombat'),
	NULL,
	0, 'for', 'coo', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'armedStruggle',
	(SELECT id FROM CompetenceCategories WHERE name = 'closeCombat'),
	NULL,
	0, 'for', 'coo', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'throwingWeapons',
	(SELECT id FROM CompetenceCategories WHERE name = 'rangeCombat'),
	NULL,
	-3, 'coo', 'per', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'handguns',
	(SELECT id FROM CompetenceCategories WHERE name = 'rangeCombat'),
	NULL,
	0, 'coo', 'per', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'rangedWeapons',
	(SELECT id FROM CompetenceCategories WHERE name = 'rangeCombat'),
	NULL,
	0, 'coo', 'per', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'heavyGuns',
	(SELECT id FROM CompetenceCategories WHERE name = 'rangeCombat'),
	NULL,
	-3, 'coo', 'per', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'specialGuns',
	(SELECT id FROM CompetenceCategories WHERE name = 'rangeCombat'),
	NULL,
	-3, 'for', 'coo', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'longGuns',
	(SELECT id FROM CompetenceCategories WHERE name = 'rangeCombat'),
	NULL,
	0, 'coo', 'per', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'sniper',
	(SELECT id FROM CompetenceCategories WHERE name = 'rangeCombat'),
	NULL,
	-3, 'per', 'vol', 1, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'psychology',
	(SELECT id FROM CompetenceCategories WHERE name = 'socialeSkill'),
	NULL,
	-3, 'int', 'per', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'leadership',
	(SELECT id FROM CompetenceCategories WHERE name = 'socialeSkill'),
	NULL,
	0, 'vol', 'pre', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'eloquence',
	(SELECT id FROM CompetenceCategories WHERE name = 'socialeSkill'),
	NULL,
	0, 'int', 'pre', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'singing',
	(SELECT id FROM CompetenceCategories WHERE name = 'socialeSkill'),
	NULL,
	-3, 'vol', 'pre', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'storyteller',
	(SELECT id FROM CompetenceCategories WHERE name = 'socialeSkill'),
	NULL,
	-3, 'ada', 'pre', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'dance',
	(SELECT id FROM CompetenceCategories WHERE name = 'socialeSkill'),
	NULL,
	-3, 'coo', 'pre', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'music',
	(SELECT id FROM CompetenceCategories WHERE name = 'socialeSkill'),
	NULL,
	NULL, 'coo', 'per', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'intimidation',
	(SELECT id FROM CompetenceCategories WHERE name = 'socialeSkill'),
	NULL,
	0, 'vol', 'pre', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'gambling',
	(SELECT id FROM CompetenceCategories WHERE name = 'socialeSkill'),
	NULL,
	0, 'vol', 'per', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'bureaucracy',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	0, 'int', 'vol', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'cryptography',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	NULL, 'int', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'education',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	-3, 'int', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'navigation',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	NULL, 'int', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'seeking',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	-3, 'int', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'tradeFood',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	-3, 'int', 'pre', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'tradeRawMaterial',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	-3, 'int', 'pre', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'tradeDevice',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	-3, 'int', 'pre', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'tradeElectronic',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	-3, 'int', 'pre', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'tradeMedical',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	-3, 'int', 'pre', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'tradeInformation',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	-3, 'int', 'pre', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'tradeVehicle',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	-3, 'int', 'pre', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'tradeWeapon',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	-3, 'int', 'pre', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'tradeDrug',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	NULL, 'int', 'pre', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'tradeBlack',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	NULL, 'int', 'pre', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'natHegemonie',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	(SELECT id FROM CompetenceSet WHERE name = 'nation'),
	0, 'int', 'pre', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'natRedLeague',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	(SELECT id FROM CompetenceSet WHERE name = 'nation'),
	0, 'int', 'pre', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'natCoralRepublic',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	(SELECT id FROM CompetenceSet WHERE name = 'nation'),
	0, 'int', 'pre', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'natEquinoxe',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	(SELECT id FROM CompetenceSet WHERE name = 'nation'),
	0, 'int', 'pre', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'natMediterraneanUnion',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	(SELECT id FROM CompetenceSet WHERE name = 'nation'),
	0, 'int', 'pre', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'natPolarAlliance',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	(SELECT id FROM CompetenceSet WHERE name = 'nation'),
	-3, 'int', 'pre', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'natAmazonia',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	(SELECT id FROM CompetenceSet WHERE name = 'nation'),
	NULL, 'int', 'pre', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'natRiftState',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	(SELECT id FROM CompetenceSet WHERE name = 'nation'),
	-3, 'int', 'pre', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'natEnderby',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	(SELECT id FROM CompetenceSet WHERE name = 'nation'),
	-3, 'int', 'pre', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'natCapFederation',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	(SELECT id FROM CompetenceSet WHERE name = 'nation'),
	-3, 'int', 'pre', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'natFuegoLibertad',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	(SELECT id FROM CompetenceSet WHERE name = 'nation'),
	-3, 'int', 'pre', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'natLemurie',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	(SELECT id FROM CompetenceSet WHERE name = 'nation'),
	-3, 'int', 'pre', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'natRodhia',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	(SELECT id FROM CompetenceSet WHERE name = 'nation'),
	-3, 'int', 'pre', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'natIndus',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	(SELECT id FROM CompetenceSet WHERE name = 'nation'),
	-3, 'int', 'pre', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'natWatchmen',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	(SELECT id FROM CompetenceSet WHERE name = 'organisation'),
	0, 'int', 'pre', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'natMercenary',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	(SELECT id FROM CompetenceSet WHERE name = 'organisation'),
	0, 'int', 'pre', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'natMilitary',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	(SELECT id FROM CompetenceSet WHERE name = 'organisation'),
	-3, 'int', 'pre', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'natPirate',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	(SELECT id FROM CompetenceSet WHERE name = 'organisation'),
	-3, 'int', 'pre', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'natSmuggler',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	(SELECT id FROM CompetenceSet WHERE name = 'organisation'),
	NULL, 'int', 'pre', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'natScavenger',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	(SELECT id FROM CompetenceSet WHERE name = 'organisation'),
	NULL, 'int', 'pre', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'natCriminality',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	(SELECT id FROM CompetenceSet WHERE name = 'organisation'),
	NULL, 'int', 'pre', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'natTridentWorship',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	(SELECT id FROM CompetenceSet WHERE name = 'organisation'),
	-3, 'int', 'pre', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'natBlackSun',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	(SELECT id FROM CompetenceSet WHERE name = 'organisation'),
	NULL, 'int', 'pre', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'natAbysseBrother',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	(SELECT id FROM CompetenceSet WHERE name = 'organisation'),
	NULL, 'int', 'pre', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'natLeviathan',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	(SELECT id FROM CompetenceSet WHERE name = 'organisation'),
	NULL, 'int', 'pre', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'natThemis',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	(SELECT id FROM CompetenceSet WHERE name = 'organisation'),
	NULL, 'int', 'pre', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'natGeneticist',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	(SELECT id FROM CompetenceSet WHERE name = 'organisation'),
	NULL, 'int', 'pre', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'natAllianceAzure',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	(SELECT id FROM CompetenceSet WHERE name = 'organisation'),
	NULL, 'int', 'pre', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'knowAdministration',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	NULL, 'int', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'knowWeapons',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	NULL, 'int', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'knowAstrophysics',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	NULL, 'int', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'knowBiology',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	NULL, 'int', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'knowBionic',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	NULL, 'int', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'knowBiotechnology',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	NULL, 'int', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'knowBotany',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	NULL, 'int', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'knowForensics',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	NULL, 'int', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'knowLaw',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	NULL, 'int', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'knowEconomic',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	NULL, 'int', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'knowGeology',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	NULL, 'int', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'knowGeography',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	NULL, 'int', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'knowHistory',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	NULL, 'int', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'knowSoftware',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	NULL, 'int', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'knowMedicine',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	NULL, 'int', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'knowNanotechnology',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	NULL, 'int', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'knowPharmacology',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	NULL, 'int', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'knowPhysics',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	NULL, 'int', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'knowPsychology',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	NULL, 'int', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'knowRobotics',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	NULL, 'int', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'knowPoliticalScience',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	NULL, 'int', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'knowSociology',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	NULL, 'int', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'knowTelecom',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	NULL, 'int', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'knowZoology',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	NULL, 'int', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'navalWarfare',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	-3, 'int', 'ada', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'undergroundlWarfare',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	0, 'int', 'ada', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'landCombat',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	0, 'int', 'ada', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'commandoOperation',
	(SELECT id FROM CompetenceCategories WHERE name = 'knowledge'),
	NULL,
	0, 'int', 'ada', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'dissimulation',
	(SELECT id FROM CompetenceCategories WHERE name = 'furtivity'),
	NULL,
	-3, 'per', 'ada', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'disguise',
	(SELECT id FROM CompetenceCategories WHERE name = 'furtivity'),
	NULL,
	0, 'ada', 'pre', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'discretion',
	(SELECT id FROM CompetenceCategories WHERE name = 'furtivity'),
	NULL,
	0, 'per', 'ada', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'escape',
	(SELECT id FROM CompetenceCategories WHERE name = 'furtivity'),
	NULL,
	NULL, 'coo', 'vol', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'stealth',
	(SELECT id FROM CompetenceCategories WHERE name = 'furtivity'),
	NULL,
	0, 'per', 'ada', 1, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'pickpocket',
	(SELECT id FROM CompetenceCategories WHERE name = 'furtivity'),
	NULL,
	-3, 'coo', 'ada', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'hacking',
	(SELECT id FROM CompetenceCategories WHERE name = 'furtivity'),
	NULL,
	NULL, 'vol', 'ada', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'monitoring',
	(SELECT id FROM CompetenceCategories WHERE name = 'furtivity'),
	NULL,
	NULL, 'per', 'ada', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'atmosphericBattlesuits',
	(SELECT id FROM CompetenceCategories WHERE name = 'steering'),
	NULL,
	NULL, 'coo', 'ada', 1, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'externalBattlesuits',
	(SELECT id FROM CompetenceCategories WHERE name = 'steering'),
	NULL,
	0, 'coo', 'ada', 1, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'underwaterBattlesuits',
	(SELECT id FROM CompetenceCategories WHERE name = 'steering'),
	NULL,
	0, 'coo', 'ada', 1, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'fighterFlying',
	(SELECT id FROM CompetenceCategories WHERE name = 'steering'),
	NULL,
	NULL, 'int', 'ada', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'vesselsPilotage',
	(SELECT id FROM CompetenceCategories WHERE name = 'steering'),
	NULL,
	NULL, 'int', 'ada', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'spacecraftDriving',
	(SELECT id FROM CompetenceCategories WHERE name = 'steering'),
	NULL,
	NULL, 'int', 'ada', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'vehicleDriving',
	(SELECT id FROM CompetenceCategories WHERE name = 'steering'),
	NULL,
	NULL, 'per', 'ada', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'scootersDriving',
	(SELECT id FROM CompetenceCategories WHERE name = 'steering'),
	NULL,
	0, 'per', 'ada', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'remotePiloting',
	(SELECT id FROM CompetenceCategories WHERE name = 'steering'),
	NULL,
	-3, 'int', 'ada', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'hunting',
	(SELECT id FROM CompetenceCategories WHERE name = 'survivalCat'),
	NULL,
	0, 'per', 'ada', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'knowCity',
	(SELECT id FROM CompetenceCategories WHERE name = 'survivalCat'),
	NULL,
	0, 'int', 'ada', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'knowOceans',
	(SELECT id FROM CompetenceCategories WHERE name = 'survivalCat'),
	NULL,
	-3, 'int', 'ada', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'knowUnderground',
	(SELECT id FROM CompetenceCategories WHERE name = 'survivalCat'),
	NULL,
	-3, 'int', 'ada', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'knowLand',
	(SELECT id FROM CompetenceCategories WHERE name = 'survivalCat'),
	NULL,
	NULL, 'int', 'ada', 1, 1);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'observation',
	(SELECT id FROM CompetenceCategories WHERE name = 'survivalCat'),
	NULL,
	0, 'per', 'vol', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'orientation',
	(SELECT id FROM CompetenceCategories WHERE name = 'survivalCat'),
	NULL,
	0, 'per', 'ada', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'survival',
	(SELECT id FROM CompetenceCategories WHERE name = 'survivalCat'),
	NULL,
	NULL, 'ada', 'vol', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'firstAid',
	(SELECT id FROM CompetenceCategories WHERE name = 'survivalCat'),
	NULL,
	-3, 'int', 'ada', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'onboardInstrumentation',
	(SELECT id FROM CompetenceCategories WHERE name = 'techniques'),
	NULL,
	NULL, 'int', 'ada', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'farming',
	(SELECT id FROM CompetenceCategories WHERE name = 'techniques'),
	NULL,
	0, 'int', 'pre', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'surgery',
	(SELECT id FROM CompetenceCategories WHERE name = 'techniques'),
	NULL,
	NULL, 'coo', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'animalsTraining',
	(SELECT id FROM CompetenceCategories WHERE name = 'techniques'),
	NULL,
	-3, 'vol', 'pre', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'electronic',
	(SELECT id FROM CompetenceCategories WHERE name = 'techniques'),
	NULL,
	NULL, 'int', 'coo', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'explosive',
	(SELECT id FROM CompetenceCategories WHERE name = 'techniques'),
	NULL,
	NULL, 'int', 'vol', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'tampering',
	(SELECT id FROM CompetenceCategories WHERE name = 'techniques'),
	NULL,
	NULL, 'int', 'per', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'computing',
	(SELECT id FROM CompetenceCategories WHERE name = 'techniques'),
	NULL,
	-3, 'int', 'ada', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'mechanicsLifeSupport',
	(SELECT id FROM CompetenceCategories WHERE name = 'techniques'),
	NULL,
	0, 'coo', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'mechanicsMachinery',
	(SELECT id FROM CompetenceCategories WHERE name = 'techniques'),
	NULL,
	0, 'coo', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'mechanicsVehicle',
	(SELECT id FROM CompetenceCategories WHERE name = 'techniques'),
	NULL,
	0, 'coo', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'mechanicsBattleSuits',
	(SELECT id FROM CompetenceCategories WHERE name = 'techniques'),
	NULL,
	0, 'coo', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'mechanicsVessel',
	(SELECT id FROM CompetenceCategories WHERE name = 'techniques'),
	NULL,
	0, 'coo', 'int', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'traps',
	(SELECT id FROM CompetenceCategories WHERE name = 'techniques'),
	NULL,
	-3, 'coo', 'per', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'security',
	(SELECT id FROM CompetenceCategories WHERE name = 'techniques'),
	NULL,
	NULL, 'int', 'ada', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'absence',
	(SELECT id FROM CompetenceCategories WHERE name = 'specialCat'),
	NULL,
	NULL, 'ada', 'vol', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'mentalShield',
	(SELECT id FROM CompetenceCategories WHERE name = 'specialCat'),
	NULL,
	NULL, 'vol', 'vol', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'bodyControl',
	(SELECT id FROM CompetenceCategories WHERE name = 'specialCat'),
	NULL,
	NULL, 'con', 'vol', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'mutations',
	(SELECT id FROM CompetenceCategories WHERE name = 'specialCat'),
	NULL,
	NULL, 'con', 'vol', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'hybrid',
	(SELECT id FROM CompetenceCategories WHERE name = 'specialCat'),
	NULL,
	NULL, 'vol', 'pre', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'hypnosis',
	(SELECT id FROM CompetenceCategories WHERE name = 'specialCat'),
	NULL,
	NULL, 'vol', 'pre', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'controlPolarisEcho',
	(SELECT id FROM CompetenceCategories WHERE name = 'specialCat'),
	NULL,
	NULL, 'int', 'vol', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'controlPolarisEffect',
	(SELECT id FROM CompetenceCategories WHERE name = 'specialCat'),
	NULL,
	NULL, 'vol', 'vol', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'Meditation',
	(SELECT id FROM CompetenceCategories WHERE name = 'specialCat'),
	NULL,
	NULL, 'vol', 'vol', 0, 0);
INSERT INTO Competence (name, cat_id, set_id, base, attr1, attr2, limiting, naturalIncrease) VALUES(
	'polarisPower',
	(SELECT id FROM CompetenceCategories WHERE name = 'specialCat'),
	NULL,
	NULL, 'int', 'vol', 0, 0);

