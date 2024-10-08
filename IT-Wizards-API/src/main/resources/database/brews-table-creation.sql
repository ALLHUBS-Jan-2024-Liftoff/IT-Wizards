-- MySQL Script generated by MySQL Workbench

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema it-wizards
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema it-wizards
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `it-wizards` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `it-wizards` ;

-- -----------------------------------------------------
-- Table `it-wizards`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `it-wizards`.`category` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(45) NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `it-wizards`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `it-wizards`.`product` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(255) NULL,
  `product_price` DOUBLE NULL,
  `product_description` VARCHAR(255) NULL,
  `product_inventory` INT NULL,
  `image` VARCHAR(255) NULL,
  `category_category_id` INT NOT NULL,
  PRIMARY KEY (`product_id`),
  INDEX `fk_product_category_idx` (`category_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_category`
    FOREIGN KEY (`category_category_id`)
    REFERENCES `it-wizards`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `it-wizards`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `it-wizards`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(80) NULL,
  `first_name` VARCHAR(80) NULL,
  `password` VARCHAR(80) NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `it-wizards`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `it-wizards`.`cart` (
  `cart_id` INT NOT NULL AUTO_INCREMENT,
  `user_user_id` INT NOT NULL,
  PRIMARY KEY (`cart_id`),
  INDEX `fk_cart_user1_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_cart_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `it-wizards`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `it-wizards`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `it-wizards`.`address` (
  `address_id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(255) NULL,
  `city` VARCHAR(80) NULL,
  `state` VARCHAR(80) NULL,
  `zipcode` INT NULL,
  PRIMARY KEY (`address_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `it-wizards`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `it-wizards`.`order` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `user_user_id` INT NOT NULL,
  `address_address_id` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_order_user1_idx` (`user_user_id` ASC) VISIBLE,
  INDEX `fk_order_address1_idx` (`address_address_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `it-wizards`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_address1`
    FOREIGN KEY (`address_address_id`)
    REFERENCES `it-wizards`.`address` (`address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `it-wizards`.`cart_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `it-wizards`.`cart_product` (
  `cart_product_id` INT NOT NULL AUTO_INCREMENT,
  `quantity` INT NULL,
  `product_product_id` INT NOT NULL,
  `cart_cart_id` INT NOT NULL,
  `order_order_id` INT NOT NULL,
  PRIMARY KEY (`cart_product_id`),
  INDEX `fk_cart_product_product1_idx` (`product_product_id` ASC) VISIBLE,
  INDEX `fk_cart_product_cart1_idx` (`cart_cart_id` ASC) VISIBLE,
  INDEX `fk_cart_product_order1_idx` (`order_order_id` ASC) VISIBLE,
  CONSTRAINT `fk_cart_product_product1`
    FOREIGN KEY (`product_product_id`)
    REFERENCES `it-wizards`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cart_product_cart1`
    FOREIGN KEY (`cart_cart_id`)
    REFERENCES `it-wizards`.`cart` (`cart_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cart_product_order1`
    FOREIGN KEY (`order_order_id`)
    REFERENCES `it-wizards`.`order` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `it-wizards`.`payment_information`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `it-wizards`.`payment_information` (
  `payment_information_id` INT NOT NULL AUTO_INCREMENT,
  `cardholder_name` VARCHAR(255) NULL,
  `card_number` INT NULL,
  `month` INT NULL,
  `year` INT NULL,
  `cvc` INT NULL,
  PRIMARY KEY (`payment_information_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
