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
-- Table `assign03`.`sellers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assign03`.`sellers` (
  `seller_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`seller_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign03`.`items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assign03`.`items` (
  `items_id` INT NOT NULL AUTO_INCREMENT,
  `opening_price` DOUBLE NOT NULL,
  `ending_price` DOUBLE NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `sellers_seller_id` INT NOT NULL,
  PRIMARY KEY (`items_id`, `sellers_seller_id`),
  INDEX `fk_items_sellers_idx` (`sellers_seller_id` ASC) VISIBLE,
  CONSTRAINT `fk_items_sellers`
    FOREIGN KEY (`sellers_seller_id`)
    REFERENCES `assign03`.`sellers` (`seller_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign03`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assign03`.`customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `bid` DOUBLE NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign03`.`customers_has_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assign03`.`customers_has_items` (
  `customers_customer_id` INT NOT NULL,
  `items_items_id` INT NOT NULL,
  `items_sellers_seller_id` INT NOT NULL,
  PRIMARY KEY (`customers_customer_id`, `items_items_id`, `items_sellers_seller_id`),
  INDEX `fk_customers_has_items_items1_idx` (`items_items_id` ASC, `items_sellers_seller_id` ASC) VISIBLE,
  INDEX `fk_customers_has_items_customers1_idx` (`customers_customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_customers_has_items_customers1`
    FOREIGN KEY (`customers_customer_id`)
    REFERENCES `assign03`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customers_has_items_items1`
    FOREIGN KEY (`items_items_id` , `items_sellers_seller_id`)
    REFERENCES `assign03`.`items` (`items_id` , `sellers_seller_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
