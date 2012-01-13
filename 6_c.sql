SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `araba` DEFAULT CHARACTER SET latin5 COLLATE latin5_turkish_ci ;
USE `araba` ;

-- -----------------------------------------------------
-- Table `araba`.`musteri`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `araba`.`musteri` (
  `user_id` INT NOT NULL AUTO_INCREMENT ,
  `ad` VARCHAR(45) NULL ,
  `soyad` VARCHAR(45) NULL ,
  `e_posta` VARCHAR(45) NULL ,
  `cep_no` VARCHAR(45) NULL ,
  PRIMARY KEY (`user_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `araba`.`satici`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `araba`.`satici` (
  `satici_id` INT NOT NULL AUTO_INCREMENT ,
  `ad` VARCHAR(45) NULL ,
  `soyad` VARCHAR(45) NULL ,
  `e_posta` VARCHAR(45) NULL ,
  `cep_no` VARCHAR(45) NULL ,
  PRIMARY KEY (`satici_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `araba`.`ilan`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `araba`.`ilan` (
  `ilan_no` INT NOT NULL AUTO_INCREMENT ,
  `ilan_turu` VARCHAR(45) NULL ,
  `ilan_tarihi` DATE NULL ,
  PRIMARY KEY (`ilan_no`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `araba`.`model`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `araba`.`model` (
  `model_id` INT NOT NULL AUTO_INCREMENT ,
  `model_ad` VARCHAR(45) NULL ,
  `renk` VARCHAR(45) NULL ,
  `m_hacmi` VARCHAR(45) NULL ,
  `fiyat` VARCHAR(45) NULL ,
  `model_yili` VARCHAR(45) NULL ,
  `yakit_turu` VARCHAR(45) NULL ,
  `km` VARCHAR(45) NULL ,
  `arac_durumu` VARCHAR(45) NULL ,
  `kasa_turu` VARCHAR(45) NULL ,
  `vites_turu` VARCHAR(45) NULL ,
  PRIMARY KEY (`model_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `araba`.`marka`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `araba`.`marka` (
  `marka_id` INT NOT NULL AUTO_INCREMENT ,
  `marka_adi` VARCHAR(45) NULL ,
  `model_id` INT NULL ,
  PRIMARY KEY (`marka_id`) ,
  INDEX `fk_marka_1` (`model_id` ASC) ,
  CONSTRAINT `fk_marka_1`
    FOREIGN KEY (`model_id` )
    REFERENCES `araba`.`model` (`model_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `araba`.`arac`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `araba`.`arac` (
  `arac_id` INT NOT NULL AUTO_INCREMENT ,
  `marka_id` INT NULL ,
  `satici_id` INT NULL ,
  `ilan_no` INT NULL ,
  PRIMARY KEY (`arac_id`) ,
  INDEX `fk_arac_1` (`marka_id` ASC) ,
  INDEX `fk_arac_2` (`satici_id` ASC) ,
  INDEX `fk_arac_3` (`ilan_no` ASC) ,
  CONSTRAINT `fk_arac_1`
    FOREIGN KEY (`marka_id` )
    REFERENCES `araba`.`marka` (`marka_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_arac_2`
    FOREIGN KEY (`satici_id` )
    REFERENCES `araba`.`satici` (`satici_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_arac_3`
    FOREIGN KEY (`ilan_no` )
    REFERENCES `araba`.`ilan` (`ilan_no` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `araba`.`odeme`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `araba`.`odeme` (
  `odeme_id` INT NOT NULL AUTO_INCREMENT ,
  `user_id` INT NULL ,
  `satici_id` INT NULL ,
  `odeme_sekli` VARCHAR(45) NULL ,
  `ilan_no` INT NULL ,
  PRIMARY KEY (`odeme_id`) ,
  INDEX `fk_odeme_1` (`user_id` ASC) ,
  INDEX `fk_odeme_2` (`ilan_no` ASC) ,
  INDEX `fk_odeme_3` (`satici_id` ASC) ,
  CONSTRAINT `fk_odeme_1`
    FOREIGN KEY (`user_id` )
    REFERENCES `araba`.`musteri` (`user_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_odeme_2`
    FOREIGN KEY (`ilan_no` )
    REFERENCES `araba`.`ilan` (`ilan_no` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_odeme_3`
    FOREIGN KEY (`satici_id` )
    REFERENCES `araba`.`satici` (`satici_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
