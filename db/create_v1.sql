-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hop_shop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hop_shop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hop_shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `hop_shop` ;

-- -----------------------------------------------------
-- Table `hop_shop`.`manufacturers_shoess`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hop_shop`.`manufacturers_shoess` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hop_shop`.`order_status_shopp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hop_shop`.`order_status_shopp` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hop_shop`.`pvzska`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hop_shop`.`pvzska` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `postcode` CHAR(6) NOT NULL,
  `city` VARCHAR(30) NOT NULL,
  `street` VARCHAR(30) NOT NULL,
  `house` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 37
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hop_shop`.`roles_vvvr`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hop_shop`.`roles_vvvr` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hop_shop`.`users_shop`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hop_shop`.`users_shop` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(50) NOT NULL,
  `login` VARCHAR(60) NOT NULL,
  `password` VARCHAR(30) NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_users_shop_roles_vvvr_idx` (`role_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_shop_roles_vvvr`
    FOREIGN KEY (`role_id`)
    REFERENCES `hop_shop`.`roles_vvvr` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hop_shop`.`orders_shop`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hop_shop`.`orders_shop` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_date` DATETIME NOT NULL,
  `delivery_date` DATETIME NOT NULL,
  `pvz_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `receive_code` VARCHAR(5) NOT NULL,
  `status_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_orders_shop_pvzska_idx` (`pvz_id` ASC) VISIBLE,
  INDEX `fk_orders_shop_users_shop_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_orders_shop_order_status_shopp_idx` (`status_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_shop_order_status_shopp`
    FOREIGN KEY (`status_id`)
    REFERENCES `hop_shop`.`order_status_shopp` (`id`),
  CONSTRAINT `fk_orders_shop_pvzska`
    FOREIGN KEY (`pvz_id`)
    REFERENCES `hop_shop`.`pvzska` (`id`),
  CONSTRAINT `fk_orders_shop_users_shop`
    FOREIGN KEY (`user_id`)
    REFERENCES `hop_shop`.`users_shop` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hop_shop`.`shoes_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hop_shop`.`shoes_categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `shoes_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hop_shop`.`sup4`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hop_shop`.`sup4` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hop_shop`.`products_shopa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hop_shop`.`products_shopa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `article` VARCHAR(10) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `unit` VARCHAR(10) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `discount` INT NOT NULL,
  `stock_qty` INT NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `photo` VARCHAR(50) NOT NULL,
  `category_id` INT NOT NULL,
  `manufacturer_id` INT NOT NULL,
  `supplier_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_products_shopa_shoes_categories_idx` (`category_id` ASC) VISIBLE,
  INDEX `fk_products_shopa_sup4_idx` (`supplier_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_shopa_shoes_categories`
    FOREIGN KEY (`category_id`)
    REFERENCES `hop_shop`.`shoes_categories` (`id`),
  CONSTRAINT `fk_products_shopa_sup4`
    FOREIGN KEY (`supplier_id`)
    REFERENCES `hop_shop`.`sup4` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 31
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hop_shop`.`produx_orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hop_shop`.`produx_orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `qty` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_produx_orders_ordesr_shop_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_produx_orders_ordesr_shop_idx1` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_produx_orders_ordesr_shop`
    FOREIGN KEY (`order_id`)
    REFERENCES `hop_shop`.`orders_shop` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_produx_orders_produx_orders`
    FOREIGN KEY (`product_id`)
    REFERENCES `hop_shop`.`produx_orders` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
