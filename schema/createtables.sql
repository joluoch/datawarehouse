-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema richards
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema richards
-- -----------------------------------------------------


-- -----------------------------------------------------
-- Table `richards`.`station`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `richards`.`station` (
  `idstation` INT NOT NULL,
  `stationname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idstation`),
  UNIQUE INDEX `idstation_UNIQUE` (`idstation` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `richards`.`time`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `richards`.`time` (
  `idtime` INT NOT NULL,
  `idstation` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `dayofweek` INT NOT NULL,
  `hour` INT NOT NULL,
  `minute` INT NOT NULL,
  `seconds` INT NOT NULL,
  PRIMARY KEY (`idtime`),
  INDEX `stationtime_idx` (`idstation` ASC) VISIBLE,
  CONSTRAINT `stationtime`
    FOREIGN KEY (`idstation`)
    REFERENCES `richards`.`station` (`idstation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `richards`.`flow`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `richards`.`flow` (
  `flowid` INT NOT NULL,
  `idstation` INT NOT NULL,
  `idtime` INT NOT NULL,
  `time` DATETIME NOT NULL,
  `flow1` INT NOT NULL,
  `flow2` INT NOT NULL,
  `flow3` INT NOT NULL,
  `flowtotal` INT NOT NULL,
  PRIMARY KEY (`flowid`),
  INDEX `stationflow_idx` (`idstation` ASC) VISIBLE,
  INDEX `timeflow_idx` (`idtime` ASC) VISIBLE,
  CONSTRAINT `stationflow`
    FOREIGN KEY (`idstation`)
    REFERENCES `richards`.`station` (`idstation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `timeflow`
    FOREIGN KEY (`idtime`)
    REFERENCES `richards`.`time` (`idtime`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `richards`.`occupancy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `richards`.`occupancy` (
  `idoccupancy` INT NOT NULL,
  `stationid` INT NOT NULL,
  `time` INT NULL,
  `occupancy1` INT NULL,
  `occupancy2` VARCHAR(45) NULL,
  PRIMARY KEY (`idoccupancy`, `stationid`),
  INDEX `statiooccup_idx` (`stationid` ASC) VISIBLE,
  INDEX `time_idx` (`time` ASC) VISIBLE,
  CONSTRAINT `statiooccup`
    FOREIGN KEY (`stationid`)
    REFERENCES `richards`.`station` (`idstation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `time`
    FOREIGN KEY (`time`)
    REFERENCES `richards`.`time` (`idtime`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
