USE polaris;

CREATE TABLE Tabletop (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(256) NOT NULL,
    mj_id INT UNSIGNED NOT NULL,
    CONSTRAINT fk_mj_id
        FOREIGN KEY (mj_id)
        REFERENCES User(id)
)
ENGINE=INNODB;
