
CREATE TABLE IF NOT EXISTS `time` (
  `date` DATETIME NOT NULL,
  `dayofweek` INT NOT NULL,
  `hour` INT NOT NULL,
  `minute` INT NOT NULL,
  `seconds` INT NOT NULL,
  PRIMARY KEY (`date`)

)ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `flow` (

  `flowid` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `flow1` INT NOT NULL,
  `flow2` INT NOT NULL,
  `flow3` INT NOT NULL,
  `flowtotal` INT NOT NULL,
  PRIMARY KEY (`flowid`) 
) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS `ocuppancy` (
  `idocuppancy` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `ocuppancy1` INT NOT NULL,
  `ocuppancy2` INT NOT NULL,
  PRIMARY KEY (`idocuppancy`)
)ENGINE=InnoDB;





