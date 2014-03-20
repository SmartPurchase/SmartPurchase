SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Table `smartpurchase`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smartpurchase`.`users` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(60) NOT NULL,
  `profile_type` SMALLINT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NULL,
  `uf` CHAR(2) NOT NULL,
  `city` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `smartpurchase`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smartpurchase`.`categories` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `smartpurchase`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smartpurchase`.`products` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `category_id` INT UNSIGNED NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_products_categories_idx` (`category_id` ASC),
  CONSTRAINT `fk_products_categories`
    FOREIGN KEY (`category_id`)
    REFERENCES `smartpurchase`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `smartpurchase`.`establishments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smartpurchase`.`establishments` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `pontuaction` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `smartpurchase`.`prices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smartpurchase`.`prices` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `products_id` INT UNSIGNED NOT NULL,
  `price` FLOAT(10,3) NOT NULL,
  `measure` SMALLINT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `confirmed` INT NOT NULL,
  `author` INT UNSIGNED NOT NULL,
  `establishment_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_prices_products1_idx` (`products_id` ASC),
  INDEX `fk_prices_users1_idx` (`author` ASC),
  INDEX `fk_prices_establishments1_idx` (`establishment_id` ASC),
  CONSTRAINT `fk_prices_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `smartpurchase`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prices_users1`
    FOREIGN KEY (`author`)
    REFERENCES `smartpurchase`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prices_establishments1`
    FOREIGN KEY (`establishment_id`)
    REFERENCES `smartpurchase`.`establishments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `smartpurchase`.`lists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smartpurchase`.`lists` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `author` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_lists_users1_idx` (`author` ASC),
  CONSTRAINT `fk_lists_users1`
    FOREIGN KEY (`author`)
    REFERENCES `smartpurchase`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `smartpurchase`.`list_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smartpurchase`.`list_items` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `smartpurchase`.`lists_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smartpurchase`.`lists_items` (
  `list_id` INT UNSIGNED NOT NULL,
  `price_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`list_id`, `price_id`),
  INDEX `fk_lists_has_prices_prices1_idx` (`price_id` ASC),
  INDEX `fk_lists_has_prices_lists1_idx` (`list_id` ASC),
  CONSTRAINT `fk_lists_has_prices_lists1`
    FOREIGN KEY (`list_id`)
    REFERENCES `smartpurchase`.`lists` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lists_has_prices_prices1`
    FOREIGN KEY (`price_id`)
    REFERENCES `smartpurchase`.`prices` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
