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

 Date: 15/10/2019 17:22:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dashboard_two
-- ----------------------------
DROP TABLE IF EXISTS `dashboard_two`;
CREATE TABLE `dashboard_two`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interface` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bankname` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` int(11) NULL DEFAULT NULL,
  `year` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dashboard_two
-- ----------------------------
INSERT INTO `dashboard_two` VALUES (1, 'A接口', '建设银行', 11, '2019');
INSERT INTO `dashboard_two` VALUES (2, 'A接口', '工商银行', 15, '2019');
INSERT INTO `dashboard_two` VALUES (3, 'A接口', '招商银行', 20, '2019');
INSERT INTO `dashboard_two` VALUES (4, 'A接口', '交通银行', 9, '2019');
INSERT INTO `dashboard_two` VALUES (5, 'B接口', '建设银行', 70, '2019');
INSERT INTO `dashboard_two` VALUES (6, 'B接口', '农业银行', 8, '2019');
INSERT INTO `dashboard_two` VALUES (7, 'C接口', '交通银行', 22, '2019');
INSERT INTO `dashboard_two` VALUES (8, 'C接口', '中国银行', 33, '2019');
INSERT INTO `dashboard_two` VALUES (9, 'C接口', '工商银行', 100, '2019');
INSERT INTO `dashboard_two` VALUES (10, 'D接口', '浦发银行', 3, '2019');
INSERT INTO `dashboard_two` VALUES (11, 'D接口', '工商银行', 72, '2019');
INSERT INTO `dashboard_two` VALUES (12, 'D接口', '建设银行', 28, '2019');
INSERT INTO `dashboard_two` VALUES (13, 'A接口', '工商银行', 100, '2018');
INSERT INTO `dashboard_two` VALUES (14, 'A接口', '建设银行', 23, '2018');
INSERT INTO `dashboard_two` VALUES (15, 'B接口', '工商银行', 10, '2018');
INSERT INTO `dashboard_two` VALUES (16, 'B接口', '交通银行', 41, '2018');
INSERT INTO `dashboard_two` VALUES (17, 'B接口', '抚顺银行', 5, '2018');
INSERT INTO `dashboard_two` VALUES (18, 'C接口', '中国银行', 54, '2018');
INSERT INTO `dashboard_two` VALUES (19, 'C接口', '农业银行', 100, '2018');
INSERT INTO `dashboard_two` VALUES (20, 'C接口', '浦发银行', 100, '2018');
INSERT INTO `dashboard_two` VALUES (21, 'D接口', '招商银行', 26, '2018');
INSERT INTO `dashboard_two` VALUES (22, 'D接口', '中国银行', 50, '2018');
INSERT INTO `dashboard_two` VALUES (23, 'D接口', '锦州银行', 24, '2018');

SET FOREIGN_KEY_CHECKS = 1;
