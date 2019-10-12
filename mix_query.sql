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

 Date: 12/10/2019 15:26:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mix_query
-- ----------------------------
DROP TABLE IF EXISTS `mix_query`;
CREATE TABLE `mix_query`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `send` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `interface` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requestcontent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `responsecontent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requesttime` datetime(0) NULL DEFAULT NULL,
  `responsetime` datetime(0) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL COMMENT '(1.请求和响应都成功,2请求成功,响应失败 3.其他待定)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mix_query
-- ----------------------------
INSERT INTO `mix_query` VALUES (1, '工商银行', '工商银行', '接口1', '已请求', '已响应', '2019-10-10 10:33:03', '2019-10-18 09:59:44', 1);
INSERT INTO `mix_query` VALUES (2, '农业银行', '农业银行', '接口2', '已请求', '已响应', '2019-10-12 14:24:41', '2019-10-12 14:24:44', 2);
INSERT INTO `mix_query` VALUES (3, '中国银行', '中国银行', '接口3', '已请求', '已响应', '2019-10-10 14:25:21', '2019-10-12 14:25:28', 3);
INSERT INTO `mix_query` VALUES (4, '建设银行', '建设银行', '接口4', '已请求', '已响应', '2019-10-12 14:25:44', '2019-10-12 14:25:47', 2);
INSERT INTO `mix_query` VALUES (5, '交通银行', '交通银行', '接口3', '已请求', '已响应', '2019-10-11 14:26:13', '2019-10-11 17:26:17', 3);
INSERT INTO `mix_query` VALUES (6, '招商银行', '招商银行', '接口1', '已请求', '已响应', '2019-10-12 14:26:37', '2019-10-12 14:26:39', 1);

SET FOREIGN_KEY_CHECKS = 1;
