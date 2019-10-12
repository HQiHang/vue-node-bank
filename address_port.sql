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

 Date: 12/10/2019 15:25:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address_port
-- ----------------------------
DROP TABLE IF EXISTS `address_port`;
CREATE TABLE `address_port`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipaddress` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ipport` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ftpaddress` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ftpport` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bankid` int(11) NULL DEFAULT NULL,
  `bankname` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `activation` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address_port
-- ----------------------------
INSERT INTO `address_port` VALUES (1, '127.0.0.1', '8080', '127.0.0.1', '8080', 1, '工商银行', '否');
INSERT INTO `address_port` VALUES (2, '127.0.0.2', '8081', '127.0.0.2', '8081', 2, '建设银行', '是');
INSERT INTO `address_port` VALUES (3, '127.0.0.3', '8082', '127.0.0.3', '8082', 3, '农业银行', '是');
INSERT INTO `address_port` VALUES (4, '127.0.0.4', '8083', '127.0.0.4', '8083', 4, '交通银行', '是');
INSERT INTO `address_port` VALUES (5, '127.0.0.5', '8084', '127.0.0.5', '8084', 5, '中国银行', '是');
INSERT INTO `address_port` VALUES (6, '127.0.0.6', '8085', '127.0.0.6', '8085', 6, '招商银行', '是');
INSERT INTO `address_port` VALUES (7, '127.0.0.7', '8086', '127.0.0.7', '8086', 7, '锦州银行', '是');
INSERT INTO `address_port` VALUES (8, '127.0.0.8', '8087', '127.0.0.8', '8087', 8, '浦发银行', '否');
INSERT INTO `address_port` VALUES (9, '127.0.0.9', '8088', '127.0.0.9', '8088', 9, '广发银行', '否');
INSERT INTO `address_port` VALUES (10, '127.0.1.0', '8089', '127.0.1.0', '8089', 10, '盛京银行', '否');
INSERT INTO `address_port` VALUES (11, '127.0.1.1', '8090', '127.0.1.1', '8090', 11, '抚顺银行', '否');
INSERT INTO `address_port` VALUES (12, '127.0.1.2', '8091', '127.0.1.2', '8091', 12, '抚顺银行', '否');

SET FOREIGN_KEY_CHECKS = 1;
