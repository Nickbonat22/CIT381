-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema assign03
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema assign03
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `assign03` DEFAULT CHARACTER SET utf8 ;
USE `assign03` ;

-- -----------------------------------------------------
-- Table `assign03`.`managers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assign03`.`managers` (
  `manager_id` INT NOT NULL AUTO_INCREMENT,
  `last_name` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`manager_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign03`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assign03`.`employees` (
  `employee_id` INT NOT NULL AUTO_INCREMENT,
  `last_name` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `hire_data` DATE NULL,
  `release_data` DATE NULL,
  `manager` VARCHAR(45) NULL,
  `managers_manager_id` INT NOT NULL,
  PRIMARY KEY (`employee_id`, `managers_manager_id`),
  INDEX `fk_employees_managers1_idx` (`managers_manager_id` ASC) VISIBLE,
  CONSTRAINT `fk_employees_managers1`
    FOREIGN KEY (`managers_manager_id`)
    REFERENCES `assign03`.`managers` (`manager_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign03`.`regions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assign03`.`regions` (
  `regions_id` INT NOT NULL AUTO_INCREMENT,
  `region_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`regions_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign03`.`stores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assign03`.`stores` (
  `store_id` INT NOT NULL AUTO_INCREMENT,
  `regions_regions_id` INT NOT NULL,
  `store_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`store_id`, `regions_regions_id`),
  INDEX `fk_stores_regions1_idx` (`regions_regions_id` ASC) VISIBLE,
  CONSTRAINT `fk_stores_regions1`
    FOREIGN KEY (`regions_regions_id`)
    REFERENCES `assign03`.`regions` (`regions_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign03`.`stores_has_employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assign03`.`stores_has_employees` (
  `stores_store_id` INT NOT NULL,
  `employees_employee_id` INT NOT NULL,
  PRIMARY KEY (`stores_store_id`, `employees_employee_id`),
  INDEX `fk_stores_has_employees_employees1_idx` (`employees_employee_id` ASC) VISIBLE,
  INDEX `fk_stores_has_employees_stores_idx` (`stores_store_id` ASC) VISIBLE,
  CONSTRAINT `fk_stores_has_employees_stores`
    FOREIGN KEY (`stores_store_id`)
    REFERENCES `assign03`.`stores` (`store_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stores_has_employees_employees1`
    FOREIGN KEY (`employees_employee_id`)
    REFERENCES `assign03`.`employees` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
