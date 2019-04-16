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

 Date: 16/04/2019 09:06:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for fa_subject
-- ----------------------------
DROP TABLE IF EXISTS `fa_subject`;
CREATE TABLE `fa_subject`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `num` int(255) NOT NULL COMMENT '题号',
  `subject` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '题目',
  `questionnaire` int(255) DEFAULT NULL COMMENT '所属问卷',
  `subjecttype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '题目类型：选择题；填空题；简答题',
  `chosetype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '选择题的类型：单选题；多选题',
  `dr` int(255) DEFAULT 0 COMMENT '逻辑标志：0--可显示；1--不可显示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_subject
-- ----------------------------
INSERT INTO `fa_subject` VALUES (12, 1, '测试', 43, '选择题', '单选', NULL);
INSERT INTO `fa_subject` VALUES (13, 1, '测试', 43, '选择题', '单选', NULL);
INSERT INTO `fa_subject` VALUES (14, 1, '测试', 43, '选择题', '单选', NULL);
INSERT INTO `fa_subject` VALUES (15, 1, '测试', 43, '选择题', '单选', NULL);
INSERT INTO `fa_subject` VALUES (16, 1, '测试', 43, '选择题', '单选', NULL);
INSERT INTO `fa_subject` VALUES (17, 1, '测试题目', 43, '选择题', '单选', NULL);
INSERT INTO `fa_subject` VALUES (18, 1, '测试', 43, '选择题', '单选', NULL);
INSERT INTO `fa_subject` VALUES (19, 1, '测试的题目111', 43, '选择题', '单选', NULL);
INSERT INTO `fa_subject` VALUES (20, 1, '测试的题目111', 43, '选择题', '单选', NULL);
INSERT INTO `fa_subject` VALUES (21, 1, 'sssss', 43, '选择题', '单选', NULL);
INSERT INTO `fa_subject` VALUES (22, 1, 'casdas', 43, '选择题', '单选', NULL);
INSERT INTO `fa_subject` VALUES (23, 1, '深大', 43, '选择题', '单选', NULL);

SET FOREIGN_KEY_CHECKS = 1;
