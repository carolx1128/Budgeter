-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema heroku_98fbc899c66fe0b
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `heroku_98fbc899c66fe0b` ;

-- -----------------------------------------------------
-- Schema heroku_98fbc899c66fe0b
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `heroku_98fbc899c66fe0b` DEFAULT CHARACTER SET utf8 ;
USE `heroku_98fbc899c66fe0b` ;

-- -----------------------------------------------------
-- Table `heroku_98fbc899c66fe0b`.`expenditures`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `heroku_98fbc899c66fe0b`.`expenditures` ;

CREATE TABLE IF NOT EXISTS `heroku_98fbc899c66fe0b`.`expenditures` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `date` VARCHAR(25) NOT NULL,
  `genre_id` INT(11) NOT NULL DEFAULT '0',
  `amount` DOUBLE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 424
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `heroku_98fbc899c66fe0b`.`genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `heroku_98fbc899c66fe0b`.`genre` ;

CREATE TABLE IF NOT EXISTS `heroku_98fbc899c66fe0b`.`genre` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 24
DEFAULT CHARACTER SET = utf8;

INSERT INTO `heroku_98fbc899c66fe0b`.`genre` (`id`, `name`) VALUES ('1', 'Groceries');
INSERT INTO `heroku_98fbc899c66fe0b`.`genre` (`id`, `name`) VALUES ('2', 'Health');
INSERT INTO `heroku_98fbc899c66fe0b`.`genre` (`id`, `name`) VALUES ('3', 'Dining');
INSERT INTO `heroku_98fbc899c66fe0b`.`genre` (`id`, `name`) VALUES ('4', 'Travel');
INSERT INTO `heroku_98fbc899c66fe0b`.`genre` (`id`, `name`) VALUES ('5', 'Online Shopping');

-- -----------------------------------------------------
-- Table `heroku_98fbc899c66fe0b`.`groups`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `heroku_98fbc899c66fe0b`.`groups` ;

CREATE TABLE IF NOT EXISTS `heroku_98fbc899c66fe0b`.`groups` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 784
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `heroku_98fbc899c66fe0b`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `heroku_98fbc899c66fe0b`.`user` ;

CREATE TABLE IF NOT EXISTS `heroku_98fbc899c66fe0b`.`user` (
  `idUser` INT(11) NOT NULL AUTO_INCREMENT,
  `userName` VARCHAR(45) NOT NULL,
  `userEmail` VARCHAR(45) NOT NULL,
  `userPassword` VARCHAR(45) NOT NULL,
  `groupID` VARCHAR(45) NULL DEFAULT NULL,
  `budget` DOUBLE NOT NULL DEFAULT '1000',
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB
AUTO_INCREMENT = 484
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
