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

 Date: 15/10/2019 17:22:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dashboard_three
-- ----------------------------
DROP TABLE IF EXISTS `dashboard_three`;
CREATE TABLE `dashboard_three`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interface` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bankname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `year` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dashboard_three
-- ----------------------------
INSERT INTO `dashboard_three` VALUES (1, 'A接口', '建设银行', '2019', '10-15', 5);
INSERT INTO `dashboard_three` VALUES (2, 'A接口', '建设银行', '2019', '10-14', 6);
INSERT INTO `dashboard_three` VALUES (3, 'A接口', '工商银行', '2019', '10-15', 3);
INSERT INTO `dashboard_three` VALUES (4, 'A接口', '工商银行', '2019', '10-14', 3);
INSERT INTO `dashboard_three` VALUES (5, 'A接口', '工商银行', '2019', '10-13', 5);
INSERT INTO `dashboard_three` VALUES (6, 'A接口', '工商银行', '2019', '10-12', 4);
INSERT INTO `dashboard_three` VALUES (7, 'A接口', '工商银行', '2018', '12-31', 20);
INSERT INTO `dashboard_three` VALUES (8, 'A接口', '工商银行', '2018', '12-30', 40);
INSERT INTO `dashboard_three` VALUES (9, 'A接口', '工商银行', '2018', '12-29', 25);
INSERT INTO `dashboard_three` VALUES (10, 'A接口', '工商银行', '2018', '12-28', 15);
INSERT INTO `dashboard_three` VALUES (11, 'A接口', '建设银行', '2018', '12-31', 3);
INSERT INTO `dashboard_three` VALUES (12, 'A接口', '建设银行', '2018', '12-30', 15);
INSERT INTO `dashboard_three` VALUES (13, 'A接口', '建设银行', '2018', '12-29', 5);

SET FOREIGN_KEY_CHECKS = 1;
