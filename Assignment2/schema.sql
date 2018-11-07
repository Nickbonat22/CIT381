-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema assignment2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema assignment2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `assignment2` DEFAULT CHARACTER SET utf8 ;
USE `assignment2` ;

-- -----------------------------------------------------
-- Table `assignment2`.`person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assignment2`.`person` ;

CREATE TABLE IF NOT EXISTS `assignment2`.`person` (
  `person_id` INT NOT NULL AUTO_INCREMENT,
  `last_name` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NULL,
  PRIMARY KEY (`person_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment2`.`relationship`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assignment2`.`relationship` ;

CREATE TABLE IF NOT EXISTS `assignment2`.`relationship` (
  `relationship_id` INT NOT NULL,
  `relationship` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`relationship_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment2`.`family`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assignment2`.`family` ;

CREATE TABLE IF NOT EXISTS `assignment2`.`family` (
  `person_id` INT NOT NULL,
  `related_person_id` INT NOT NULL,
  `relationship_id` INT NOT NULL,
  PRIMARY KEY (`person_id`, `related_person_id`, `relationship_id`),
  INDEX `fk_family_person2_idx` (`related_person_id` ASC) VISIBLE,
  INDEX `fk_family_relationship1_idx` (`relationship_id` ASC) VISIBLE,
  CONSTRAINT `fk_family_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `assignment2`.`person` (`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_family_person2`
    FOREIGN KEY (`related_person_id`)
    REFERENCES `assignment2`.`person` (`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_family_relationship1`
    FOREIGN KEY (`relationship_id`)
    REFERENCES `assignment2`.`relationship` (`relationship_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment2`.`friend`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assignment2`.`friend` ;

CREATE TABLE IF NOT EXISTS `assignment2`.`friend` (
  `person_id` INT NOT NULL,
  `friend_person_id` INT NOT NULL,
  `relationship_id` INT NOT NULL,
  PRIMARY KEY (`person_id`, `friend_person_id`, `relationship_id`),
  INDEX `fk_friend_person1_idx` (`friend_person_id` ASC) VISIBLE,
  INDEX `fk_friend_relationship1_idx` (`relationship_id` ASC) VISIBLE,
  CONSTRAINT `fk_friend_person`
    FOREIGN KEY (`person_id`)
    REFERENCES `assignment2`.`person` (`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_friend_person1`
    FOREIGN KEY (`friend_person_id`)
    REFERENCES `assignment2`.`person` (`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_friend_relationship1`
    FOREIGN KEY (`relationship_id`)
    REFERENCES `assignment2`.`relationship` (`relationship_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
