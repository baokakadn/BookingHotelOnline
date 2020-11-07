-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hotelbooking
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hotelbooking
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hotelbooking` DEFAULT CHARACTER SET utf8 ;
USE `hotelbooking` ;

-- -----------------------------------------------------
-- Table `hotelbooking`.`promotion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelbooking`.`promotion` (
  `promId` INT NOT NULL AUTO_INCREMENT,
  `promName` VARCHAR(100) NOT NULL,
  `description` VARCHAR(500) NULL DEFAULT NULL,
  `startDate` DATE NOT NULL,
  `endDate` DATE NOT NULL,
  `code` VARCHAR(45) NOT NULL,
  `type` ENUM('PERCENTAGE', 'FIXED') NOT NULL,
  `value` INT NOT NULL,
  PRIMARY KEY (`promId`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hotelbooking`.`roomtype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelbooking`.`roomtype` (
  `room_type_id` INT NOT NULL AUTO_INCREMENT,
  `typename` VARCHAR(45) NOT NULL,
  `description` VARCHAR(2000) NULL DEFAULT NULL,
  `adult_capacity` INT NOT NULL,
  `children_capacity` INT NOT NULL,
  `price` DOUBLE(8,2) NOT NULL,
  `image` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`room_type_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hotelbooking`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelbooking`.`user` (
  `userId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `phone` VARCHAR(11) NULL DEFAULT NULL,
  `username` VARCHAR(100) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `address` VARCHAR(200) NULL DEFAULT NULL,
  `picture` VARCHAR(200) NULL DEFAULT NULL,
  `status` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 60
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hotelbooking`.`booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelbooking`.`booking` (
  `bookingId` INT NOT NULL AUTO_INCREMENT,
  `booking_uid` VARCHAR(50) NOT NULL,
  `userId` INT NOT NULL,
  `room_type_id` INT NOT NULL,
  `promId` INT NULL DEFAULT NULL,
  `bookingDate` DATETIME NOT NULL,
  `checkInDate` DATE NOT NULL,
  `checkOutDate` DATE NOT NULL,
  `status` ENUM('PENDING', 'CANCEL', 'SUCCESS', 'ONLINE_PENDING') NOT NULL DEFAULT 'PENDING',
  `note` VARCHAR(100) NULL DEFAULT NULL,
  `adult` INT NOT NULL,
  `children` INT NOT NULL,
  `numberOfRooms` INT NULL DEFAULT NULL,
  `cancelDate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`bookingId`),
  UNIQUE INDEX `booking_uid_UNIQUE` (`booking_uid` ASC) VISIBLE,
  INDEX `fk_Booking_RoomType1_idx` (`room_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_Booking_Promotion1`
    FOREIGN KEY (`promId`)
    REFERENCES `hotelbooking`.`promotion` (`promId`),
  CONSTRAINT `fk_Booking_RoomType1`
    FOREIGN KEY (`room_type_id`)
    REFERENCES `hotelbooking`.`roomtype` (`room_type_id`),
  CONSTRAINT `fk_Booking_User1`
    FOREIGN KEY (`userId`)
    REFERENCES `hotelbooking`.`user` (`userId`))
ENGINE = InnoDB
AUTO_INCREMENT = 48
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hotelbooking`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelbooking`.`room` (
  `roomId` INT NOT NULL AUTO_INCREMENT,
  `room_number` INT NOT NULL,
  `room_type_id` INT NOT NULL,
  `floor` INT NULL DEFAULT NULL,
  `description` VARCHAR(100) NULL DEFAULT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`roomId`),
  INDEX `fk_Room_RoomType1_idx` (`room_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_Room_RoomType1`
    FOREIGN KEY (`room_type_id`)
    REFERENCES `hotelbooking`.`roomtype` (`room_type_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hotelbooking`.`bookingdetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelbooking`.`bookingdetails` (
  `booking_details_id` INT NOT NULL AUTO_INCREMENT,
  `bookingId` INT NOT NULL,
  `roomId` INT NOT NULL,
  `date` DATE NOT NULL,
  `checkinDate` DATETIME NOT NULL,
  `checkoutDate` DATETIME NOT NULL,
  `price` DOUBLE NOT NULL,
  PRIMARY KEY (`booking_details_id`),
  CONSTRAINT `fk_BookingDetails_Booking1`
    FOREIGN KEY (`bookingId`)
    REFERENCES `hotelbooking`.`booking` (`bookingId`),
  CONSTRAINT `fk_BookingDetails_Room1`
    FOREIGN KEY (`roomId`)
    REFERENCES `hotelbooking`.`room` (`roomId`))
ENGINE = InnoDB
AUTO_INCREMENT = 110
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hotelbooking`.`service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelbooking`.`service` (
  `serviceId` INT NOT NULL AUTO_INCREMENT,
  `serviceName` VARCHAR(100) NOT NULL,
  `description` VARCHAR(500) NULL DEFAULT NULL,
  `unit` VARCHAR(45) NOT NULL,
  `price` DOUBLE NOT NULL,
  PRIMARY KEY (`serviceId`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hotelbooking`.`charge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelbooking`.`charge` (
  `chargeId` INT NOT NULL AUTO_INCREMENT,
  `chargeDate` DATETIME NOT NULL,
  `quantity` INT NOT NULL,
  `serviceId` INT NOT NULL,
  `bookingId` INT NOT NULL,
  PRIMARY KEY (`chargeId`),
  CONSTRAINT `fk_Charge_Booking1`
    FOREIGN KEY (`bookingId`)
    REFERENCES `hotelbooking`.`booking` (`bookingId`),
  CONSTRAINT `fk_Charge_Service1`
    FOREIGN KEY (`serviceId`)
    REFERENCES `hotelbooking`.`service` (`serviceId`))
ENGINE = InnoDB
AUTO_INCREMENT = 20
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hotelbooking`.`creditcard`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelbooking`.`creditcard` (
  `cardNumber` VARCHAR(30) NOT NULL,
  `ownerName` VARCHAR(50) NOT NULL,
  `expiryMonth` INT NOT NULL,
  `expiryYear` INT NOT NULL,
  `cvv_code` INT NOT NULL,
  `balance` DOUBLE NOT NULL,
  PRIMARY KEY (`cardNumber`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

Insert into `hotelbooking`.`creditcard`
value ('2222 3333 4444 5555', 'JOHN HENRY', 12, 21, 123, 5000);
-- -----------------------------------------------------
-- Table `hotelbooking`.`position`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelbooking`.`position` (
  `position_id` INT NOT NULL AUTO_INCREMENT,
  `position_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`position_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;

Insert into `hotelbooking`.`position` (position_name)
values ('Administrator'), ('Manager'), ('Receptionist'), ('Bell man');
-- -----------------------------------------------------
-- Table `hotelbooking`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelbooking`.`employee` (
  `empId` INT NOT NULL AUTO_INCREMENT,
  `empName` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  `dateOfBirth` DATE NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(11) NULL DEFAULT NULL,
  `photo` VARCHAR(300) NULL DEFAULT NULL,
  `username` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `position_id` INT NOT NULL,
  PRIMARY KEY (`empId`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  INDEX `fk_Employee_Position_idx` (`position_id` ASC) VISIBLE,
  CONSTRAINT `fk_Employee_Position`
    FOREIGN KEY (`position_id`)
    REFERENCES `hotelbooking`.`position` (`position_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;

Insert into `hotelbooking`.`employee` (empName, gender, dateOfBirth, address, phone, username, password, position_id)
values ('Admin', 'Male', '1997-01-01', 'Da Nang', '012345678', 'Jin-Woo_Profile.png', 'admin', '$2a$10$GHgGvDv1bD95pAEy83g.I.nY9SPCTnLGFhRBq1G0C2./1E0slqH3W', 1);
-- -----------------------------------------------------
-- Table `hotelbooking`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelbooking`.`role` (
  `role_id` INT NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`role_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;

Insert into `hotelbooking`.`role` (role_name)
values ("ROLE_ADMIN"), ("ROLE_STAFF"), ("ROLE_USER");
-- -----------------------------------------------------
-- Table `hotelbooking`.`employee_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelbooking`.`employee_role` (
  `empId` INT NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`empId`, `role_id`),
  INDEX `fk_Emp_Role2` (`role_id` ASC) VISIBLE,
  CONSTRAINT `fk_Emp_Role1`
    FOREIGN KEY (`empId`)
    REFERENCES `hotelbooking`.`employee` (`empId`),
  CONSTRAINT `fk_Emp_Role2`
    FOREIGN KEY (`role_id`)
    REFERENCES `hotelbooking`.`role` (`role_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

Insert into `hotelbooking`.`employee_role`
value (1, 1);
-- -----------------------------------------------------
-- Table `hotelbooking`.`guestinroom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelbooking`.`guestinroom` (
  `guestId` INT NOT NULL AUTO_INCREMENT,
  `booking_details_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `identify_type` VARCHAR(45) NOT NULL,
  `identify_no` VARCHAR(45) NOT NULL,
  `identify_image` VARCHAR(200) NULL DEFAULT NULL,
  `sex` VARCHAR(45) NULL DEFAULT NULL,
  `dateOfBirth` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`guestId`),
  INDEX `fk_GuestInRoom_BookingDetails1_idx` (`booking_details_id` ASC) VISIBLE,
  CONSTRAINT `fk_GuestInRoom_BookingDetails1`
    FOREIGN KEY (`booking_details_id`)
    REFERENCES `hotelbooking`.`bookingdetails` (`booking_details_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hotelbooking`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelbooking`.`invoice` (
  `invoiceId` INT NOT NULL AUTO_INCREMENT,
  `invoiceDate` DATETIME NOT NULL,
  `amount` DOUBLE NOT NULL,
  `bookingId` INT NOT NULL,
  `cardNumber` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`invoiceId`),
  CONSTRAINT `fk_Invoice_Booking1`
    FOREIGN KEY (`bookingId`)
    REFERENCES `hotelbooking`.`booking` (`bookingId`),
  CONSTRAINT `fk_Invoice_CreditCard1`
    FOREIGN KEY (`cardNumber`)
    REFERENCES `hotelbooking`.`creditcard` (`cardNumber`))
ENGINE = InnoDB
AUTO_INCREMENT = 40
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hotelbooking`.`room_type_image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelbooking`.`room_type_image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `image` VARCHAR(200) NOT NULL,
  `room_type_id` INT NOT NULL,
  `feature` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Room_Type_Image_RoomType1_idx` (`room_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_Room_Type_Image_RoomType1`
    FOREIGN KEY (`room_type_id`)
    REFERENCES `hotelbooking`.`roomtype` (`room_type_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 40
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hotelbooking`.`user_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelbooking`.`user_role` (
  `role_id` INT NOT NULL,
  `userId` INT NOT NULL,
  PRIMARY KEY (`role_id`, `userId`),
  INDEX `fk_User_Role1_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `fk_User_Role1`
    FOREIGN KEY (`userId`)
    REFERENCES `hotelbooking`.`user` (`userId`),
  CONSTRAINT `fk_User_Role2`
    FOREIGN KEY (`role_id`)
    REFERENCES `hotelbooking`.`role` (`role_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hotelbooking`.`verificationtoken`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelbooking`.`verificationtoken` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `token` VARCHAR(255) NULL DEFAULT NULL,
  `userId` INT NOT NULL,
  `expiryDate` DATE NOT NULL,
  `createdDate` DATETIME(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `token_UNIQUE` (`token` ASC) VISIBLE,
  INDEX `fk_Veri_User1_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `fk_Veri_User1`
    FOREIGN KEY (`userId`)
    REFERENCES `hotelbooking`.`user` (`userId`))
ENGINE = InnoDB
AUTO_INCREMENT = 18
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
