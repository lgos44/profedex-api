-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema profedex
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema profedex
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `profedex` DEFAULT CHARACTER SET utf8 ;
USE `profedex` ;

-- -----------------------------------------------------
-- Table `profedex`.`professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `profedex`.`professor` (
  `professor_id` INT NOT NULL AUTO_INCREMENT,
  `professor_name` VARCHAR(255) NULL,
  `professor_email` VARCHAR(255) NULL,
  `professor_picture` VARCHAR(255) NULL,
  `professor_description` VARCHAR(4000) NULL,
  `professor_room` VARCHAR(45) NULL,
  PRIMARY KEY (`professor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profedex`.`academic_center`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `profedex`.`academic_center` (
  `center_id` INT NOT NULL AUTO_INCREMENT,
  `center_name` VARCHAR(45) NULL,
  PRIMARY KEY (`center_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profedex`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `profedex`.`user` (
  `user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(255) NULL,
  `user_email` VARCHAR(255) NULL,
  `password_hash` TEXT NOT NULL,
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL,
  `academic_center_center_id` INT NULL,
  `api_key` VARCHAR(32) NOT NULL,
  `status` INT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`user_id`),
  INDEX `fk_student_academic_center1_idx` (`academic_center_center_id` ASC),
  CONSTRAINT `fk_student_academic_center1`
    FOREIGN KEY (`academic_center_center_id`)
    REFERENCES `profedex`.`academic_center` (`center_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profedex`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `profedex`.`comment` (
  `comment_id` INT NOT NULL AUTO_INCREMENT,
  `comment_text` VARCHAR(1000) NULL,
  `comment_date` DATETIME NULL DEFAULT NOW(),
  `professor_id` INT NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`comment_id`, `user_id`),
  INDEX `fk_comment_student1_idx` (`user_id` ASC),
  INDEX `fk_commnent_professor_idx` (`professor_id` ASC),
  CONSTRAINT `fk_commnent_professor`
    FOREIGN KEY (`professor_id`)
    REFERENCES `profedex`.`professor` (`professor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_student1`
    FOREIGN KEY (`user_id`)
    REFERENCES `profedex`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profedex`.`rating_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `profedex`.`rating_type` (
  `rating_type_id` INT NOT NULL AUTO_INCREMENT,
  `rating_type_name` VARCHAR(45) NULL,
  PRIMARY KEY (`rating_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profedex`.`rating`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `profedex`.`rating` (
  `rating_id` INT NOT NULL AUTO_INCREMENT,
  `rating_name` VARCHAR(45) NULL,
  `rating_value` FLOAT NULL,
  `professor_id` INT NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `rating_type_id` INT NOT NULL,
  PRIMARY KEY (`rating_id`),
  INDEX `fk_rating_professor1_idx` (`professor_id` ASC),
  INDEX `fk_rating_student1_idx` (`user_id` ASC),
  INDEX `fk_rating_rating_type1_idx` (`rating_type_id` ASC),
  CONSTRAINT `fk_rating_professor1`
    FOREIGN KEY (`professor_id`)
    REFERENCES `profedex`.`professor` (`professor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rating_student1`
    FOREIGN KEY (`user_id`)
    REFERENCES `profedex`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rating_rating_type1`
    FOREIGN KEY (`rating_type_id`)
    REFERENCES `profedex`.`rating_type` (`rating_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profedex`.`location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `profedex`.`location` (
  `location_id` INT NOT NULL AUTO_INCREMENT,
  `location_data` VARCHAR(45) NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `professor_professor_id` INT NOT NULL,
  PRIMARY KEY (`location_id`, `professor_professor_id`),
  INDEX `fk_location_student1_idx` (`user_id` ASC),
  INDEX `fk_location_professor1_idx` (`professor_professor_id` ASC),
  CONSTRAINT `fk_location_student1`
    FOREIGN KEY (`user_id`)
    REFERENCES `profedex`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_location_professor1`
    FOREIGN KEY (`professor_professor_id`)
    REFERENCES `profedex`.`professor` (`professor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profedex`.`complaint`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `profedex`.`complaint` (
  `complaint_id` INT NOT NULL AUTO_INCREMENT,
  `complaint_info` VARCHAR(45) NULL,
  `complaint_date` DATETIME NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `con_user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`complaint_id`, `user_id`),
  INDEX `fk_complaint_student1_idx` (`user_id` ASC),
  INDEX `fk_complaint_student2_idx` (`con_user_id` ASC),
  CONSTRAINT `fk_complaint_student1`
    FOREIGN KEY (`user_id`)
    REFERENCES `profedex`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_complaint_student2`
    FOREIGN KEY (`con_user_id`)
    REFERENCES `profedex`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profedex`.`subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `profedex`.`subject` (
  `subject_id` INT NOT NULL AUTO_INCREMENT,
  `subject_name` VARCHAR(45) NULL,
  `subject_info` VARCHAR(255) NULL,
  `subject_code` VARCHAR(10) NULL,
  PRIMARY KEY (`subject_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profedex`.`subject_lecturer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `profedex`.`subject_lecturer` (
  `subject_lecturer_id` INT NOT NULL AUTO_INCREMENT,
  `subject_lecturer_semester` VARCHAR(45) NULL,
  `professor_professor_id` INT NOT NULL,
  `subject_subject_id` INT NOT NULL,
  PRIMARY KEY (`subject_lecturer_id`),
  INDEX `fk_subject_lecturer_professor1_idx` (`professor_professor_id` ASC),
  INDEX `fk_subject_lecturer_subject1_idx` (`subject_subject_id` ASC),
  CONSTRAINT `fk_subject_lecturer_professor1`
    FOREIGN KEY (`professor_professor_id`)
    REFERENCES `profedex`.`professor` (`professor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subject_lecturer_subject1`
    FOREIGN KEY (`subject_subject_id`)
    REFERENCES `profedex`.`subject` (`subject_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profedex`.`contact_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `profedex`.`contact_info` (
  `professor_id` INT NOT NULL AUTO_INCREMENT,
  `contact_info_id` INT NOT NULL,
  `contact_info_name` VARCHAR(45) NULL,
  `contact_info_value` VARCHAR(45) NULL,
  INDEX `fk_contact_info_professor1_idx` (`professor_id` ASC),
  PRIMARY KEY (`contact_info_id`),
  CONSTRAINT `fk_contact_info_professor1`
    FOREIGN KEY (`professor_id`)
    REFERENCES `profedex`.`professor` (`professor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profedex`.`professor_picture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `profedex`.`professor_picture` (
  `professor_id` INT NOT NULL AUTO_INCREMENT,
  `picture_id` INT NOT NULL,
  `picture_path` VARCHAR(255) NULL,
  INDEX `fk_table1_professor1_idx` (`professor_id` ASC),
  PRIMARY KEY (`picture_id`),
  CONSTRAINT `fk_table1_professor1`
    FOREIGN KEY (`professor_id`)
    REFERENCES `profedex`.`professor` (`professor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profedex`.`vote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `profedex`.`vote` (
  `vote_id` INT NOT NULL AUTO_INCREMENT,
  `comment_id` INT NOT NULL,
  `comment_user_id` INT UNSIGNED NOT NULL,
  `voter_id` INT UNSIGNED NOT NULL,
  `vote_val` INT(1) NULL,
  PRIMARY KEY (`vote_id`),
  INDEX `fk_vote_user1_idx` (`voter_id` ASC),
  CONSTRAINT `fk_vote_comment1`
    FOREIGN KEY (`comment_id` , `comment_user_id`)
    REFERENCES `profedex`.`comment` (`comment_id` , `user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vote_user1`
    FOREIGN KEY (`voter_id`)
    REFERENCES `profedex`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
