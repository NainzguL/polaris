USE polaris;

CREATE TABLE CompetenceRequirement (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    cmp_id INT UNSIGNED NOT NULL,
    requirement_cmp_id INT UNSIGNED NOT NULL,
    requirement_level INT NOT NULL,
    CONSTRAINT fk_cmp_id 
        FOREIGN KEY (cmp_id)
        REFERENCES Competence(id),
    CONSTRAINT fk_requirement_cmp_id 
        FOREIGN KEY (requirement_cmp_id)
        REFERENCES Competence(id)
)
ENGINE=INNODB;


INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'eloquence'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'bureaucracy'),
	(SELECT id FROM Competence WHERE name = 'education'),
	5);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'cryptography'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'navigation'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'seeking'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'tradeFood'),
	(SELECT id FROM Competence WHERE name = 'education'),
	5);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'tradeRawMaterial'),
	(SELECT id FROM Competence WHERE name = 'education'),
	5);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'tradeDevice'),
	(SELECT id FROM Competence WHERE name = 'education'),
	5);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'tradeElectronic'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'tradeMedical'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'tradeInformation'),
	(SELECT id FROM Competence WHERE name = 'education'),
	5);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'tradeVehicle'),
	(SELECT id FROM Competence WHERE name = 'education'),
	5);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'tradeWeapon'),
	(SELECT id FROM Competence WHERE name = 'education'),
	5);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'tradeDrug'),
	(SELECT id FROM Competence WHERE name = 'education'),
	5);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'tradeBlack'),
	(SELECT id FROM Competence WHERE name = 'education'),
	5);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowAdministration'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowWeapons'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowAstrophysics'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowAstrophysics'),
	(SELECT id FROM Competence WHERE name = 'knowPhysics'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowBiology'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowBionic'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowBionic'),
	(SELECT id FROM Competence WHERE name = 'knowBiology'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowBiotechnology'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowBiotechnology'),
	(SELECT id FROM Competence WHERE name = 'knowBiology'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowBotany'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowBotany'),
	(SELECT id FROM Competence WHERE name = 'knowBiology'),
	7);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowForensics'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowForensics'),
	(SELECT id FROM Competence WHERE name = 'knowPhysics'),
	5);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowForensics'),
	(SELECT id FROM Competence WHERE name = 'knowSociology'),
	5);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowLaw'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowEconomic'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowGeology'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowGeology'),
	(SELECT id FROM Competence WHERE name = 'knowPhysics'),
	5);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowGeography'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowHistory'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowSoftware'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowSoftware'),
	(SELECT id FROM Competence WHERE name = 'computing'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowMedicine'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowMedicine'),
	(SELECT id FROM Competence WHERE name = 'knowBiology'),
	7);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowNanotechnology'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowNanotechnology'),
	(SELECT id FROM Competence WHERE name = 'knowPhysics'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowPharmacology'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowPharmacology'),
	(SELECT id FROM Competence WHERE name = 'knowBiology'),
	5);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowPharmacology'),
	(SELECT id FROM Competence WHERE name = 'knowPhysics'),
	5);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowPhysics'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowPsychology'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowRobotics'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowRobotics'),
	(SELECT id FROM Competence WHERE name = 'computing'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowRobotics'),
	(SELECT id FROM Competence WHERE name = 'electronic'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowPoliticalScience'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowPoliticalScience'),
	(SELECT id FROM Competence WHERE name = 'knowGeography'),
	7);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowPoliticalScience'),
	(SELECT id FROM Competence WHERE name = 'knowHistory'),
	5);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowSociology'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowTelecom'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowTelecom'),
	(SELECT id FROM Competence WHERE name = 'computing'),
	5);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowTelecom'),
	(SELECT id FROM Competence WHERE name = 'electronic'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowZoology'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'knowZoology'),
	(SELECT id FROM Competence WHERE name = 'knowBiology'),
	7);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'hacking'),
	(SELECT id FROM Competence WHERE name = 'computing'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'fighterFlying'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'fighterFlying'),
	(SELECT id FROM Competence WHERE name = 'athletism'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'vesselsPilotage'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'spacecraftDriving'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'surgery'),
	(SELECT id FROM Competence WHERE name = 'knowMedicine'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'electronic'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'tampering'),
	(SELECT id FROM Competence WHERE name = 'bureaucracy'),
	7);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'tampering'),
	(SELECT id FROM Competence WHERE name = 'computing'),
	7);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'tampering'),
	(SELECT id FROM Competence WHERE name = 'electronic'),
	7);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'computing'),
	(SELECT id FROM Competence WHERE name = 'education'),
	10);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'mechanicsLifeSupport'),
	(SELECT id FROM Competence WHERE name = 'electronic'),
	5);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'mechanicsBattleSuits'),
	(SELECT id FROM Competence WHERE name = 'electronic'),
	5);
INSERT INTO CompetenceRequirement (cmp_id, requirement_cmp_id, requirement_level) VALUES(
	(SELECT id FROM Competence WHERE name = 'mechanicsVessel'),
	(SELECT id FROM Competence WHERE name = 'electronic'),
	5);

