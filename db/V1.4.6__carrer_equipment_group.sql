USE polaris;


CREATE TABLE CarrerEquipmentGroup (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    carrer_id INT UNSIGNED NOT NULL,
    equipment_group_id INT UNSIGNED NOT NULL,
    
    CONSTRAINT fk_EquipmentGroup_carrer_id 
        FOREIGN KEY (carrer_id)
        REFERENCES Carrer(id),
    CONSTRAINT fk_CarrerEquipmentGroup_equipment_group_id
        FOREIGN KEY (equipment_group_id)
        REFERENCES EquipmentGroup(id)
)
ENGINE=INNODB;
