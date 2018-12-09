-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema assign06
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema assign06
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `assign06` DEFAULT CHARACTER SET utf8 ;
USE `assign06` ;

-- -----------------------------------------------------
-- Table `assign06`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assign06`.`users` ;

CREATE TABLE IF NOT EXISTS `assign06`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `author` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign06`.`data`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assign06`.`data` ;

CREATE TABLE IF NOT EXISTS `assign06`.`data` (
  `subreddit` VARCHAR(45) NOT NULL,
  `approved_at_utc` TINYINT(1) NOT NULL,
  `selftext` VARCHAR(45) NOT NULL,
  `author_fullname` VARCHAR(45) NULL,
  `saved` TINYINT(1) NULL,
  `mod_reason_title` VARCHAR(45) NULL,
  `gilded` INT NULL,
  `clicked` TINYINT(1) NULL,
  `title` VARCHAR(45) NULL,
  `link_flair_richtext` VARCHAR(45) NULL,
  PRIMARY KEY (`subreddit`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign06`.`subreddit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assign06`.`subreddit` ;

CREATE TABLE IF NOT EXISTS `assign06`.`subreddit` (
  `subreddit_name_prefixed` VARCHAR(45) NOT NULL,
  `hidden` TINYINT(1) NULL,
  `pwls` INT NULL,
  `link_flair_css_class` VARCHAR(45) NULL,
  `downs` VARCHAR(45) NULL,
  `thumbnail_height` INT NULL,
  `hide_score` TINYINT(1) NULL,
  `name` VARCHAR(45) NULL,
  `quarantine` TINYINT(1) NULL,
  `link_flair_text_color` VARCHAR(45) NOT NULL,
  `author_flair_background_color` VARCHAR(45) NULL,
  `subreddit_type` VARCHAR(45) NULL,
  `ups` INT NULL,
  `domain` VARCHAR(45) NULL,
  `media_embed` VARCHAR(45) NULL,
  PRIMARY KEY (`subreddit_name_prefixed`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign06`.`thumbnail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assign06`.`thumbnail` ;

CREATE TABLE IF NOT EXISTS `assign06`.`thumbnail` (
  `thumbnail_width` INT NOT NULL,
  `author_flair_template_id` INT NULL,
  `users_user_id` INT NOT NULL,
  `is_original_content` TINYINT(1) NULL,
  `user_reports` VARCHAR(45) NULL,
  PRIMARY KEY (`thumbnail_width`, `users_user_id`),
  INDEX `fk_thumbnail_users_idx` (`users_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_thumbnail_users`
    FOREIGN KEY (`users_user_id`)
    REFERENCES `assign06`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign06`.`secure_media`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assign06`.`secure_media` ;

CREATE TABLE IF NOT EXISTS `assign06`.`secure_media` (
  `secure_media` TINYINT(1) NOT NULL,
  `is_reddit_media_domain` TINYINT(1) NULL,
  `is_meta` TINYINT(1) NULL,
  `category` VARCHAR(45) NULL,
  `secure_media_embed` VARCHAR(45) NULL,
  PRIMARY KEY (`secure_media`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign06`.`post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assign06`.`post` ;

CREATE TABLE IF NOT EXISTS `assign06`.`post` (
  `thumbnail` VARCHAR(120) NOT NULL,
  `link_flair_text` VARCHAR(45) NULL,
  `can_mod_post` VARCHAR(45) NULL,
  `score` INT NULL,
  `edited` TINYINT(1) NULL,
  `author_flair_css_class` VARCHAR(45) NULL,
  `author_flair_richtext` VARCHAR(45) NULL,
  PRIMARY KEY (`thumbnail`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign06`.`glidings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assign06`.`glidings` ;

CREATE TABLE IF NOT EXISTS `assign06`.`glidings` (
  `gid_1` INT NOT NULL,
  `gid_2` INT NULL,
  `god_3` INT NULL,
  PRIMARY KEY (`gid_1`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign06`.`post_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assign06`.`post_details` ;

CREATE TABLE IF NOT EXISTS `assign06`.`post_details` (
  `created` INT NOT NULL,
  `post_hint` VARCHAR(45) NULL,
  `content_categories` VARCHAR(45) NULL,
  `is_self` VARCHAR(45) NULL,
  `mod_note` VARCHAR(45) NULL,
  `link_flair_type` VARCHAR(45) NULL,
  `contest_mode` TINYINT(1) NULL,
  `selftext_html` VARCHAR(45) NULL,
  `likes` INT NULL,
  `suggest_sort` VARCHAR(45) NULL,
  `banned_at_utc` TINYINT(1) NULL,
  `view_count` INT NULL,
  `archived` TINYINT(1) NULL,
  `no_follow` TINYINT(1) NULL,
  `is_crosspostable` TINYINT(1) NULL,
  `pinned` TINYINT(1) NULL,
  `over_18` TINYINT(1) NULL,
  `variants` VARCHAR(45) NULL,
  `id` VARCHAR(45) NULL,
  `enabled` TINYINT(1) NULL,
  PRIMARY KEY (`created`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign06`.`source`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assign06`.`source` ;

CREATE TABLE IF NOT EXISTS `assign06`.`source` (
  `url` VARCHAR(120) NOT NULL,
  `width` INT NULL,
  `height` INT NULL,
  PRIMARY KEY (`url`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign06`.`resolutions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assign06`.`resolutions` ;

CREATE TABLE IF NOT EXISTS `assign06`.`resolutions` (
  `url` VARCHAR(120) NOT NULL,
  `width` INT NULL,
  `height` INT NULL,
  `url2` VARCHAR(45) NULL,
  `width2` VARCHAR(45) NULL,
  `height2` VARCHAR(45) NULL,
  `url3` VARCHAR(45) NULL,
  `width3` VARCHAR(45) NULL,
  `height3` VARCHAR(45) NULL,
  `url4` VARCHAR(45) NULL,
  `width4` VARCHAR(45) NULL,
  `height4` VARCHAR(45) NULL,
  PRIMARY KEY (`url`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign06`.`media_only`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assign06`.`media_only` ;

CREATE TABLE IF NOT EXISTS `assign06`.`media_only` (
  `media_only` TINYINT(1) NOT NULL,
  `link_flair_template_id` VARCHAR(45) NULL,
  `can_gild` TINYINT(1) NULL,
  `spoiler` TINYINT(1) NULL,
  `locked` TINYINT(1) NULL,
  `author_flair_text` VARCHAR(45) NULL,
  `visited` TINYINT(1) NULL,
  `num_reports` INT NULL,
  `distinguished` VARCHAR(45) NULL,
  `subreddit_subreddit_name_prefixed` VARCHAR(45) NOT NULL,
  `mod_reason_by` VARCHAR(45) NULL,
  `removal_reason` VARCHAR(45) NULL,
  `link_flair_background_color` VARCHAR(45) NULL,
  `id` VARCHAR(45) NULL,
  `is_robot_indexable` VARCHAR(45) NULL,
  `reports_reasons` TINYINT(1) NULL,
  `author` VARCHAR(45) NULL,
  `num_crossposts` INT NULL,
  `num_comments` INT NULL,
  `send_replies` TINYINT(1) NULL,
  `whitelist_status` VARCHAR(45) NULL,
  `mod_reports` VARCHAR(45) NULL,
  PRIMARY KEY (`media_only`),
  INDEX `fk_media_only_subreddit1_idx` (`subreddit_subreddit_name_prefixed` ASC) VISIBLE,
  CONSTRAINT `fk_media_only_subreddit1`
    FOREIGN KEY (`subreddit_subreddit_name_prefixed`)
    REFERENCES `assign06`.`subreddit` (`subreddit_name_prefixed`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assign06`.`peralink`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assign06`.`peralink` ;

CREATE TABLE IF NOT EXISTS `assign06`.`peralink` (
  `permalink` VARCHAR(120) NOT NULL,
  `author_patreon_flair` TINYINT(1) NULL,
  `author_flair_text_color` VARCHAR(45) NULL,
  `parent_whitelist_status` VARCHAR(45) NULL,
  `stickied` TINYINT(1) NULL,
  `url` VARCHAR(120) NULL,
  `subreddit_subscribers` INT NULL,
  `created_utc` INT NULL,
  `media` VARCHAR(45) NULL,
  `is_video` TINYINT(1) NULL,
  PRIMARY KEY (`permalink`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
