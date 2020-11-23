-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema booking
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema booking
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `booking` DEFAULT CHARACTER SET utf8 ;
USE `booking` ;

-- -----------------------------------------------------
-- Table `booking`.`promotion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `booking`.`promotion` (
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
DEFAULT CHARACTER SET = utf8;

Insert into `booking`.`promotion` (promName, startDate, endDate, code, type, value)
values ('Mid Autumn', '2020-11-03', '2020-11-25', 'autumn', 'PERCENTAGE', 15),
('Christmas', '2020-11-01', '2020-11-20', 'christmas', 'FIXED', 200);
-- -----------------------------------------------------
-- Table `booking`.`roomtype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `booking`.`roomtype` (
  `room_type_id` INT NOT NULL AUTO_INCREMENT,
  `typename` VARCHAR(45) NOT NULL,
  `description` VARCHAR(2000) NULL DEFAULT NULL,
  `adult_capacity` INT NOT NULL,
  `children_capacity` INT NOT NULL,
  `price` DOUBLE(8,2) NOT NULL,
  `image` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`room_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

Insert into `booking`.`roomtype` (typename, adult_capacity, children_capacity, price, image)
values
('Superior City View', 2, 2, 200, '0dca3df9380afac3c77bf156a18d802c-2020-11-06-20-49-50-2020-11-13-15-37-7.jpg'),
('Deluxe Twin', 2, 2, 250, '1fd4ff018a2166354a1c09f0c071bcb0-2020-11-06-20-47-1-2020-11-13-15-38-12.jpg'),
('Deluxe Double', 2, 3, 300, '6b15205f7333184fc61f1e50e5fc63d5-2020-11-06-20-45-16-2020-11-13-15-37-41.jpg'),
('Junior Suite', 2, 1, 200, '1617cee9dec3d45527e6a1b5757ed666-2020-11-06-20-48-21-2020-11-13-15-39-13.jpg'),
('Grand Apartment', 4, 2, 400, '42e9e107aeba260cc6b07e59cc147ccd-2020-11-06-20-52-32-2020-11-13-15-38-40.jpg'),
('Premier Apartment', 4, 1, 350, '175b4bb3ada6f6362097a657c2dcb0b5-2020-11-06-20-55-0-2020-11-13-15-39-42.jpg');
-- -----------------------------------------------------
-- Table `booking`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `booking`.`user` (
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
DEFAULT CHARACTER SET = utf8;

Insert into `booking`.`user` (name, email, phone, username, password, address, picture, status)
value ('Angelina Jolie', 'jolie@gmail.com', '0123456789', 'jolie', '$2a$10$GPcJOsLLAey6n4kNOwNVDODx1UtQ7U.pzFnuYOi08CVCdlRtw8Sli', 'Ha Noi', 'Angelina-Jolie.jpg', 1);
-- -----------------------------------------------------
-- Table `booking`.`booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `booking`.`booking` (
  `bookingId` INT NOT NULL AUTO_INCREMENT,
  `booking_uid` VARCHAR(50) NOT NULL,
  `userId` INT NOT NULL,
  `room_type_id` INT NOT NULL,
  `promId` INT NULL DEFAULT NULL,
  `bookingDate` DATETIME NOT NULL,
  `checkInDate` DATE NOT NULL,
  `checkOutDate` DATE NOT NULL,
  `status` ENUM('STAYING', 'CANCEL', 'SUCCESS', 'ONLINE_PENDING') NOT NULL,
  `note` VARCHAR(100) NULL DEFAULT NULL,
  `adult` INT NOT NULL,
  `children` INT NOT NULL,
  `numberOfRooms` INT NULL DEFAULT NULL,
  `price` DOUBLE NOT NULL,
  `cancelDate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`bookingId`),
  UNIQUE INDEX `booking_uid_UNIQUE` (`booking_uid` ASC) VISIBLE,
  INDEX `fk_Booking_RoomType1_idx` (`room_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_Booking_Promotion1`
    FOREIGN KEY (`promId`)
    REFERENCES `booking`.`promotion` (`promId`),
  CONSTRAINT `fk_Booking_RoomType1`
    FOREIGN KEY (`room_type_id`)
    REFERENCES `booking`.`roomtype` (`room_type_id`),
  CONSTRAINT `fk_Booking_User1`
    FOREIGN KEY (`userId`)
    REFERENCES `booking`.`user` (`userId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

Insert into `booking`.`booking` (booking_uid, userId, room_type_id, bookingDate, checkInDate, checkOutDate, status, adult, children, numberOfRooms, price)
value ('3670-478900059', 1, 4, '2020-11-07 19:52:56', '2020-11-22', '2020-11-24', 'STAYING', 2, 3, 2, 200),
('1290-121300060', 1, 3, '2020-11-08 12:38:44', '2020-11-25', '2020-11-27', 'ONLINE_PENDING', 3, 2, 2, 300);

-- -----------------------------------------------------
-- Table `booking`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `booking`.`room` (
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
    REFERENCES `booking`.`roomtype` (`room_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

Insert into `booking`.`room`(room_number, room_type_id, floor, status)
values
(101, 2, 1, 1),
(102, 3, 1, 1),
(103, 3, 1, 1),
(201, 1, 2, 1),
(202, 4, 2, 1),
(203, 5, 2, 1),
(301, 2, 3, 1),
(302, 6, 3, 1),
(303, 1, 3, 1),
(401, 5, 4, 1),
(402, 4, 4, 1),
(403, 6, 4, 1);
-- -----------------------------------------------------
-- Table `booking`.`bookingdetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `booking`.`bookingdetails` (
  `booking_details_id` INT NOT NULL AUTO_INCREMENT,
  `bookingId` INT NOT NULL,
  `roomId` INT NOT NULL,
  `checkinDate` DATETIME NOT NULL,
  `checkoutDate` DATETIME NOT NULL,
  PRIMARY KEY (`booking_details_id`),
  CONSTRAINT `fk_BookingDetails_Booking1`
    FOREIGN KEY (`bookingId`)
    REFERENCES `booking`.`booking` (`bookingId`),
  CONSTRAINT `fk_BookingDetails_Room1`
    FOREIGN KEY (`roomId`)
    REFERENCES `booking`.`room` (`roomId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

Insert into `booking`.`bookingdetails` (bookingId, roomId, checkinDate, checkoutDate)
values 
(1, 5, '2020-11-22 13:00:00', '2020-11-24 12:00:00'),
(1, 11, '2020-11-22 13:00:00', '2020-11-24 12:00:00'),
(2, 2, '2020-11-25 13:00:00', '2020-11-27 12:00:00'),
(2, 3, '2020-11-25 13:00:00', '2020-11-27 12:00:00');
-- -----------------------------------------------------
-- Table `booking`.`service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `booking`.`service` (
  `serviceId` INT NOT NULL AUTO_INCREMENT,
  `serviceName` VARCHAR(100) NOT NULL,
  `description` VARCHAR(500) NULL DEFAULT NULL,
  `unit` VARCHAR(45) NOT NULL,
  `price` DOUBLE NOT NULL,
  PRIMARY KEY (`serviceId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

Insert into `booking`.`service` (serviceName, unit, price)
values
('Bana Hills', 'ticket', 100),
('Massage', 'ticket', 50);
-- -----------------------------------------------------
-- Table `booking`.`charge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `booking`.`charge` (
  `chargeId` INT NOT NULL AUTO_INCREMENT,
  `chargeDate` DATETIME NOT NULL,
  `quantity` INT NOT NULL,
  `serviceId` INT NOT NULL,
  `bookingId` INT NOT NULL,
  PRIMARY KEY (`chargeId`),
  CONSTRAINT `fk_Charge_Booking1`
    FOREIGN KEY (`bookingId`)
    REFERENCES `booking`.`booking` (`bookingId`),
  CONSTRAINT `fk_Charge_Service1`
    FOREIGN KEY (`serviceId`)
    REFERENCES `booking`.`service` (`serviceId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `booking`.`creditcard`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `booking`.`creditcard` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cardNumber` VARCHAR(30) NOT NULL,
  `ownerName` VARCHAR(50) NOT NULL,
  `expiryMonth` INT NOT NULL,
  `expiryYear` INT NOT NULL,
  `cvv_code` INT NOT NULL,
  `balance` DOUBLE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

Insert into `booking`.`creditcard` (cardNumber, ownerName, expiryMonth, expiryYear, cvv_code, balance)
value ('2222 3333 4444 5555', 'JOHN HENRY', 12, 21, 123, 5000);
-- -----------------------------------------------------
-- Table `booking`.`position`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `booking`.`position` (
  `position_id` INT NOT NULL AUTO_INCREMENT,
  `position_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`position_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

Insert into `booking`.`position` (position_name)
values ('Administrator'), ('Manager'), ('Receptionist'), ('Bell man');
-- -----------------------------------------------------
-- Table `booking`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `booking`.`employee` (
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
    REFERENCES `booking`.`position` (`position_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

Insert into `booking`.`employee` (empName, gender, dateOfBirth, address, phone, photo, username, password, position_id)
values ('Admin', 'Male', '1997-01-01', 'Da Nang', '012345678', 'Jin-Woo_Profile.png', 'admin', '$2a$10$GHgGvDv1bD95pAEy83g.I.nY9SPCTnLGFhRBq1G0C2./1E0slqH3W', 1);
-- -----------------------------------------------------
-- Table `booking`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `booking`.`role` (
  `role_id` INT NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`role_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

Insert into `booking`.`role` (role_name)
values ("ROLE_ADMIN"), ("ROLE_STAFF"), ("ROLE_USER");
-- -----------------------------------------------------
-- Table `booking`.`employee_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `booking`.`employee_role` (
  `empId` INT NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`empId`, `role_id`),
  INDEX `fk_Emp_Role2` (`role_id` ASC) VISIBLE,
  CONSTRAINT `fk_Emp_Role1`
    FOREIGN KEY (`empId`)
    REFERENCES `booking`.`employee` (`empId`),
  CONSTRAINT `fk_Emp_Role2`
    FOREIGN KEY (`role_id`)
    REFERENCES `booking`.`role` (`role_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

Insert into `booking`.`employee_role`
value (1, 1);
-- -----------------------------------------------------
-- Table `booking`.`guestinroom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `booking`.`guestinroom` (
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
    REFERENCES `booking`.`bookingdetails` (`booking_details_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `booking`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `booking`.`invoice` (
  `invoiceId` INT NOT NULL AUTO_INCREMENT,
  `invoiceDate` DATETIME NOT NULL,
  `amount` DOUBLE NOT NULL,
  `bookingId` INT NOT NULL,
  `cardId` INT NULL,
  PRIMARY KEY (`invoiceId`),
  CONSTRAINT `fk_Invoice_Booking1`
    FOREIGN KEY (`bookingId`)
    REFERENCES `booking`.`booking` (`bookingId`),
  CONSTRAINT `fk_Invoice_CreditCard1`
    FOREIGN KEY (`cardId`)
    REFERENCES `booking`.`creditcard` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

Insert into `booking`.`invoice` (invoiceDate, amount, bookingId, cardId)
values
('2020-11-07 19:52:56', 880, 1, 1),
('2020-11-08 12:38:44', 1320, 2, 1);

-- -----------------------------------------------------
-- Table `booking`.`room_type_image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `booking`.`room_type_image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `image` VARCHAR(200) NOT NULL,
  `room_type_id` INT NOT NULL,
  `feature` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Room_Type_Image_RoomType1_idx` (`room_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_Room_Type_Image_RoomType1`
    FOREIGN KEY (`room_type_id`)
    REFERENCES `booking`.`roomtype` (`room_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

Insert into `booking`.`room_type_image` (image, room_type_id, feature)
values
('0dca3df9380afac3c77bf156a18d802c-2020-11-06-20-49-50-2020-11-13-15-37-7.jpg', 1, 1),
('3d94151a72a4b7a632e5a09d6254e5bd-2020-11-06-20-49-50-2020-11-13-15-37-7.jpg', 1, 0),
('249cb2c9b42d6445c41a1a39a20c97cc-2020-11-06-20-49-50-2020-11-13-15-37-7.jpg', 1, 0),
('1030702_17102014140058115018-2020-11-06-20-49-50-2020-11-13-15-37-7.jpg', 1, 0),
('1030702_17102014140058115034-2020-11-06-20-49-50-2020-11-13-15-37-7.jpg', 1, 0),
('1fd4ff018a2166354a1c09f0c071bcb0-2020-11-06-20-47-1-2020-11-13-15-38-12.jpg', 2, 1),
('80b19952c215baca0da2b115283cf687-2020-11-06-20-47-1-2020-11-13-15-38-12.jpg', 2, 0),
('a9e7ac88cde7ac3694bd94d671ae1c94-2020-11-06-20-47-1-2020-11-13-15-38-12.jpg', 2, 0),
('ee7f5618b0262dd8d2f7fad7ce61cf70-2020-11-06-20-47-1-2020-11-13-15-38-12.jpg', 2, 0),
('6b15205f7333184fc61f1e50e5fc63d5-2020-11-06-20-45-16-2020-11-13-15-37-41.jpg', 3, 1),
('52f4057785598ae4c09a82a5b3f140dc-2020-11-06-20-45-16-2020-11-13-15-37-41.jpg', 3, 0),
('175b4bb3ada6f6362097a657c2dcb0b5-2020-11-07-9-5-51-2020-11-13-15-37-41.jpg', 3, 0),
('b35fb361bb8346807377467fc83d63d0-2020-11-06-20-45-16-2020-11-13-15-37-41.jpg', 3, 0),
('dc5e98bc594df762e008455a1fe7ae90-2020-11-06-20-45-16-2020-11-13-15-37-41.jpg', 3, 0),
('e25f211e8a057964cf0d7d468ae096cb-2020-11-06-20-45-16-2020-11-13-15-37-41.jpg', 3, 0),
('ed0344770fe044c7eefb086bf9eb22f2-2020-11-07-9-5-51-2020-11-13-15-37-41.jpg', 3, 0),
('7af897dd50b56278d14e50bd389caf59-2020-11-06-20-48-21-2020-11-13-15-39-13.jpg', 4, 0),
('058b242654621a9b06d2541fa58d72ec-2020-11-06-20-48-21-2020-11-13-15-39-13.jpg', 4, 0),
('1617cee9dec3d45527e6a1b5757ed666-2020-11-06-20-48-21-2020-11-13-15-39-13.jpg', 4, 1),
('08736934c957e7a5f821e8982e384602-2020-11-06-20-48-21-2020-11-13-15-39-13.jpg', 4, 0),
('4cdba220056f2801af761fce31518349-2020-11-06-20-52-32-2020-11-13-15-38-40.jpg', 5, 0),
('9fb1ff198b45d4b22da57ceabeb52cf3-2020-11-06-20-52-32-2020-11-13-15-38-40.jpg', 5, 0),
('38f802bc50ebacf0284ee0c2581a3e1a-2020-11-06-20-52-32-2020-11-13-15-38-40.jpg', 5, 0),
('42e9e107aeba260cc6b07e59cc147ccd-2020-11-06-20-52-32-2020-11-13-15-38-40.jpg', 5, 1),
('1330b1fe438e570ee77b1a1f5b031799-2020-11-06-20-52-32-2020-11-13-15-38-40.jpg', 5, 0),
('80729943dbf530bdc1202f84d3cf1692-2020-11-06-20-52-32-2020-11-13-15-38-40.jpg', 5, 0),
('0e476d09e78f717e8b77c3ea0b8761e3-2020-11-06-20-55-0-2020-11-13-15-39-42.jpg', 6, 0),
('6ce8dfe53541d12075ffea948e2700c2-2020-11-06-20-55-0-2020-11-13-15-39-42.jpg', 6, 0),
('44f2dc4bf105c572ba36552586d5fef6-2020-11-06-20-55-0-2020-11-13-15-39-42.jpg', 6, 0),
('175b4bb3ada6f6362097a657c2dcb0b5-2020-11-06-20-55-0-2020-11-13-15-39-42.jpg', 6, 1),
('e70f80f866136e7b15997d1f1204b3e5-2020-11-06-20-55-0-2020-11-13-15-39-42.jpg', 6, 0),
('ed0344770fe044c7eefb086bf9eb22f2-2020-11-06-20-55-0-2020-11-13-15-39-42.jpg', 6, 0);
-- -----------------------------------------------------
-- Table `booking`.`user_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `booking`.`user_role` (
  `role_id` INT NOT NULL,
  `userId` INT NOT NULL,
  PRIMARY KEY (`role_id`, `userId`),
  INDEX `fk_User_Role1_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `fk_User_Role1`
    FOREIGN KEY (`userId`)
    REFERENCES `booking`.`user` (`userId`),
  CONSTRAINT `fk_User_Role2`
    FOREIGN KEY (`role_id`)
    REFERENCES `booking`.`role` (`role_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

Insert into `booking`.`user_role`
value (3, 1);

-- -----------------------------------------------------
-- Table `booking`.`verificationtoken`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `booking`.`verificationtoken` (
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
    REFERENCES `booking`.`user` (`userId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
