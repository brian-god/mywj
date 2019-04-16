/*
 Navicat Premium Data Transfer

 Source Server         : 服务器
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : 47.98.164.175:3306
 Source Schema         : mywj

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 16/04/2019 09:06:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for fa_option
-- ----------------------------
DROP TABLE IF EXISTS `fa_option`;
CREATE TABLE `fa_option`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `option` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '选择题选项：如A,B,C,D',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '选择题的选项，描述',
  `subject` int(225) DEFAULT NULL COMMENT '选项属于哪个题目',
  `dr` int(255) DEFAULT 0 COMMENT '逻辑标志：0--可显示；1，删除的',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
