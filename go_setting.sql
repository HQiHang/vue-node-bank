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

 Date: 12/10/2019 15:26:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for go_setting
-- ----------------------------
DROP TABLE IF EXISTS `go_setting`;
CREATE TABLE `go_setting`  (
  `id` int(11) NOT NULL,
  `ipaddress` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ipport` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ftpaddress` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ftpport` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of go_setting
-- ----------------------------
INSERT INTO `go_setting` VALUES (1, '126.254.3.17', '8006', '192.168.1.1', '3005');

SET FOREIGN_KEY_CHECKS = 1;
