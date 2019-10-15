/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50716
 Source Host           : localhost:3306
 Source Schema         : bank

 Target Server Type    : MySQL
 Target Server Version : 50716
 File Encoding         : 65001

 Date: 15/10/2019 17:22:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dashboard
-- ----------------------------
DROP TABLE IF EXISTS `dashboard`;
CREATE TABLE `dashboard`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interface` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` int(11) NULL DEFAULT NULL,
  `year` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dashboard
-- ----------------------------
INSERT INTO `dashboard` VALUES (1, 'A接口', 55, '2019');
INSERT INTO `dashboard` VALUES (2, 'B接口', 78, '2019');
INSERT INTO `dashboard` VALUES (3, 'C接口', 155, '2019');
INSERT INTO `dashboard` VALUES (4, 'D接口', 103, '2019');
INSERT INTO `dashboard` VALUES (5, 'A接口', 123, '2018');
INSERT INTO `dashboard` VALUES (6, 'B接口', 56, '2018');
INSERT INTO `dashboard` VALUES (7, 'C接口', 254, '2018');
INSERT INTO `dashboard` VALUES (8, 'D接口', 100, '2018');

SET FOREIGN_KEY_CHECKS = 1;
