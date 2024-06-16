/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80300 (8.3.0)
 Source Host           : localhost:3306
 Source Schema         : pet

 Target Server Type    : MySQL
 Target Server Version : 80300 (8.3.0)
 File Encoding         : 65001

 Date: 16/06/2024 15:18:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `manageId` int NOT NULL AUTO_INCREMENT,
  `manageTel` varchar(255) DEFAULT NULL,
  `manageGender` varchar(255) DEFAULT NULL,
  `manageName` varchar(255) DEFAULT NULL,
  `managePassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`manageId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of admin
-- ----------------------------
BEGIN;
INSERT INTO `admin` (`manageId`, `manageTel`, `manageGender`, `manageName`, `managePassword`) VALUES (1, '123', '123', '1', '1');
COMMIT;

-- ----------------------------
-- Table structure for adopt
-- ----------------------------
DROP TABLE IF EXISTS `adopt`;
CREATE TABLE `adopt` (
  `userName` varchar(255) DEFAULT NULL,
  `animalName` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `approved` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of adopt
-- ----------------------------
BEGIN;
INSERT INTO `adopt` (`userName`, `animalName`, `reason`, `experience`, `id`, `approved`) VALUES ('1', '小狗', '123', '123', 2, 'ͬ同意');
INSERT INTO `adopt` (`userName`, `animalName`, `reason`, `experience`, `id`, `approved`) VALUES ('1', '小猫', '123123', '1123', 3, '不同意');
INSERT INTO `adopt` (`userName`, `animalName`, `reason`, `experience`, `id`, `approved`) VALUES ('1', '小猫', 'fghf', 'hkjhk', 4, 'ͬ同意');
INSERT INTO `adopt` (`userName`, `animalName`, `reason`, `experience`, `id`, `approved`) VALUES ('1', '小猫', 'hhh', 'shhs', 5, NULL);
INSERT INTO `adopt` (`userName`, `animalName`, `reason`, `experience`, `id`, `approved`) VALUES ('1', '小猫', 'nn', 'hh', 6, NULL);
INSERT INTO `adopt` (`userName`, `animalName`, `reason`, `experience`, `id`, `approved`) VALUES ('1', '小猫', '喜欢', '一只', 7, NULL);
INSERT INTO `adopt` (`userName`, `animalName`, `reason`, `experience`, `id`, `approved`) VALUES ('1', '小猫', 'kkk', 'jjj', 8, NULL);
INSERT INTO `adopt` (`userName`, `animalName`, `reason`, `experience`, `id`, `approved`) VALUES ('1', 'xiaomao', '很喜欢', '2只', 9, 'ͬ同意');
INSERT INTO `adopt` (`userName`, `animalName`, `reason`, `experience`, `id`, `approved`) VALUES ('1', '大黑', '喜欢', '没有', 10, 'ͬ同意');
COMMIT;

-- ----------------------------
-- Table structure for animals
-- ----------------------------
DROP TABLE IF EXISTS `animals`;
CREATE TABLE `animals` (
  `AnimalId` int NOT NULL AUTO_INCREMENT,
  `AnimalName` varchar(50) DEFAULT NULL,
  `AnimalType` varchar(50) DEFAULT NULL,
  `AnimalGender` varchar(50) DEFAULT NULL,
  `Health` varchar(50) DEFAULT NULL,
  `LYStatus` varchar(10) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `PicAnimal` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AnimalId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of animals
-- ----------------------------
BEGIN;
INSERT INTO `animals` (`AnimalId`, `AnimalName`, `AnimalType`, `AnimalGender`, `Health`, `LYStatus`, `Age`, `PicAnimal`) VALUES (8, '小猫', '0', '0', '良好', '1', 3, 'imgs/13e75c3b6a8747c5b39b60c3aed1a3aa.png');
INSERT INTO `animals` (`AnimalId`, `AnimalName`, `AnimalType`, `AnimalGender`, `Health`, `LYStatus`, `Age`, `PicAnimal`) VALUES (9, 'xiaomao', '0', '0', '健康', '1', 12, 'imgs/156bad4407ff4447a20dc96c23d5020a.jpg');
INSERT INTO `animals` (`AnimalId`, `AnimalName`, `AnimalType`, `AnimalGender`, `Health`, `LYStatus`, `Age`, `PicAnimal`) VALUES (10, '大黑', '1', '0', '未知', '1', 10, 'imgs/8e77237c310a45c4af36583f0db8a9c2.png');
INSERT INTO `animals` (`AnimalId`, `AnimalName`, `AnimalType`, `AnimalGender`, `Health`, `LYStatus`, `Age`, `PicAnimal`) VALUES (12, '小花', '2', '0', '健康', '0', 1, 'imgs/357a9fe0ff8f422596b1bff3ca75e2dc.jpeg');
INSERT INTO `animals` (`AnimalId`, `AnimalName`, `AnimalType`, `AnimalGender`, `Health`, `LYStatus`, `Age`, `PicAnimal`) VALUES (13, '小花', '0', '0', '健康', '0', 1, 'imgs/9a3610f5a46f49c9a6149c5656c9cc57.jpeg');
INSERT INTO `animals` (`AnimalId`, `AnimalName`, `AnimalType`, `AnimalGender`, `Health`, `LYStatus`, `Age`, `PicAnimal`) VALUES (15, '小花', '2', '0', '生病中', '0', 3, 'imgs/2f0c9bceb4f64d1cbf469a264bfdaf8b.jpeg');
INSERT INTO `animals` (`AnimalId`, `AnimalName`, `AnimalType`, `AnimalGender`, `Health`, `LYStatus`, `Age`, `PicAnimal`) VALUES (16, '123', '0', '0', '123', '0', 123, 'imgs/62c34a32e00748018444c496ca5d4101.jpeg');
INSERT INTO `animals` (`AnimalId`, `AnimalName`, `AnimalType`, `AnimalGender`, `Health`, `LYStatus`, `Age`, `PicAnimal`) VALUES (17, '花花', '0', '0', '健康', '0', 12, 'imgs/c0e5950aa53940d7a1839059b7ac4b08.jpeg');
COMMIT;

-- ----------------------------
-- Table structure for fruiter
-- ----------------------------
DROP TABLE IF EXISTS `fruiter`;
CREATE TABLE `fruiter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `price` double NOT NULL DEFAULT '0',
  `production` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of fruiter
-- ----------------------------
BEGIN;
INSERT INTO `fruiter` (`id`, `name`, `price`, `production`) VALUES (1, '苹果树树', 200, '江西西西');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userName` varchar(255) NOT NULL,
  `userPwd` varchar(255) DEFAULT NULL,
  `userId` varchar(255) DEFAULT NULL,
  `userTel` varchar(255) DEFAULT NULL,
  `userGender` varchar(255) DEFAULT NULL,
  `userAddress` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`userName`, `userPwd`, `userId`, `userTel`, `userGender`, `userAddress`) VALUES ('admin', 'admin', '1', '111', '11', '111');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
