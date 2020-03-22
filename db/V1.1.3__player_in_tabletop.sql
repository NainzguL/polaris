USE polaris;

CREATE TABLE PlayerInTabletop (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    tabletop_id INT UNSIGNED NOT NULL,
    player_id INT UNSIGNED NOT NULL,
    CONSTRAINT fk_tabletop_id
        FOREIGN KEY (tabletop_id)
        REFERENCES Tabletop(id),
    CONSTRAINT fk_player_id
        FOREIGN KEY (player_id)
        REFERENCES User(id)
)
ENGINE=INNODB;
