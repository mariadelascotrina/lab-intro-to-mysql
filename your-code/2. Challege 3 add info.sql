DROP DATABASE IF EXISTS mydb;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cars` (
  `idcars` INT NOT NULL AUTO_INCREMENT,
  `vin` VARCHAR(20) NULL,
  `manufacturer` VARCHAR(20) NULL,
  `model` VARCHAR(20) NULL,
  `year` INT NULL,
  `color` VARCHAR(10) NULL,
  PRIMARY KEY (`idcars`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customers` (
  `idCustomers` INT NOT NULL,
  `name` VARCHAR(20) NULL,
  `phone` VARCHAR(30) NULL,
  `email` VARCHAR(20) NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(50) NULL,
  `state/province` VARCHAR(50) NULL,
  `country` VARCHAR(50) NULL,
  `postal code` INT NULL,
  PRIMARY KEY (`idCustomers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`salesperson` (
  `idstaff` INT NOT NULL,
  `name` VARCHAR(20) NULL,
  `store` VARCHAR(20) NULL,
  PRIMARY KEY (`idstaff`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Invoices` (
  `idInvoices` INT NOT NULL,
  `date` DATE NULL,
  `Customers_idCustomers` INT NULL,
  `salesperson_idstaff` INT NULL,
  `cars_idcars` INT NULL,
  PRIMARY KEY (`idInvoices`),
  INDEX `fk_Invoices_Customers1_idx` (`Customers_idCustomers` ASC) VISIBLE,
  INDEX `fk_Invoices_salesperson1_idx` (`salesperson_idstaff` ASC) VISIBLE,
  INDEX `fk_Invoices_cars1_idx` (`cars_idcars` ASC) VISIBLE,
  CONSTRAINT `fk_Invoices_Customers1`
    FOREIGN KEY (`Customers_idCustomers`)
    REFERENCES `mydb`.`Customers` (`idCustomers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_salesperson1`
    FOREIGN KEY (`salesperson_idstaff`)
    REFERENCES `mydb`.`salesperson` (`idstaff`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_cars1`
    FOREIGN KEY (`cars_idcars`)
    REFERENCES `mydb`.`cars` (`idcars`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO cars VALUES
(0,	'3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Blue'),
(1,	'ZM8G7BEUQZ97IH46V', 'Peugeot',	'Rifter', 2019,	'Red'),
(2,	'RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018, 'White'),
(3,	'HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4',	2018, 'Silver'),
(4,	'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019,	'Gray'),
(5,	'DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country',	2019, 'Gray');

INSERT INTO customers VALUES
(10001,	'Pablo Picasso', '0034636176382', null, 'Paseo de la Chopera, 14', 'Madrid','Madrid', 'Spain', 28045),
(20001,	'Abraham Lincoln','13059077086', null, '120 SW 8th St', 'Miami', 'Florida', 'United States', 33130),
(30001,	'Napoléon Bonaparte', '0033179754000', null, '40 Rue du Colisée', 'Paris',	'Île-de-France', 'France', 75008);

INSERT INTO salesperson VALUES
(00001,	'Petey Cruiser', 'Madrid'),
(00002,	'Anna Sthesia',	'Barcelona'),
(00003,	'Paul Molive',	'Berlin'),
(00004,	'Gail Forcewind', 'Paris'),
(00005,	'Paige Turner',	'Mimia'),
(00006,	'Bob Frapples',	'Mexico City'),
(00007,	'Walter Melon',	'Amsterdam'),
(00008,	'Shonda Leer',	'São Paulo');


INSERT INTO invoices VALUES
(0,	'2018-08-22',	1, 3, 0),
(1,	'2018-12-31',	0, 5, 3),
(2,	'2019-01-22',	2, 7, 2);


