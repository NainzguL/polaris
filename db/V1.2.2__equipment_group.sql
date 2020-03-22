USE polaris;

CREATE TABLE EquipmentGroup (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE
)
ENGINE=INNODB;

INSERT INTO EquipmentGroup VALUES (NULL, 'standardEquipment');
INSERT INTO EquipmentGroup VALUES (NULL, 'computerEquipment');
INSERT INTO EquipmentGroup VALUES (NULL, 'craftEquipment');
INSERT INTO EquipmentGroup VALUES (NULL, 'translationDataDrone');
INSERT INTO EquipmentGroup VALUES (NULL, 'contactWeapon');
INSERT INTO EquipmentGroup VALUES (NULL, 'handgun');
INSERT INTO EquipmentGroup VALUES (NULL, 'longGun');
INSERT INTO EquipmentGroup VALUES (NULL, 'spyingEquipment');
INSERT INTO EquipmentGroup VALUES (NULL, 'securityTools');
INSERT INTO EquipmentGroup VALUES (NULL, 'tamperingTools');
INSERT INTO EquipmentGroup VALUES (NULL, 'standardProtections');
INSERT INTO EquipmentGroup VALUES (NULL, 'underwaterBattlesuits');
INSERT INTO EquipmentGroup VALUES (NULL, 'externalBattlesuits');
INSERT INTO EquipmentGroup VALUES (NULL, 'hybridBattlesuits');
INSERT INTO EquipmentGroup VALUES (NULL, 'industrialArmor');
INSERT INTO EquipmentGroup VALUES (NULL, 'smalTransportVessel');