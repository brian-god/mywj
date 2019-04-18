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

 Date: 18/04/2019 16:42:12
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
  `opdetail` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '选项json数据',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_subject
-- ----------------------------
INSERT INTO `fa_subject` VALUES (54, 1, '选择题修改new二次', 50, '选择题', '单选', 0, NULL);
INSERT INTO `fa_subject` VALUES (58, 2, '填空题', 50, '选择题', '单选', 0, NULL);
INSERT INTO `fa_subject` VALUES (61, 3, '简答题', 50, '简答题', NULL, 1, NULL);
INSERT INTO `fa_subject` VALUES (62, 3, '', 50, '简答题', NULL, 1, NULL);
INSERT INTO `fa_subject` VALUES (63, 4, '选择题', 50, '选择题', '单选', 0, NULL);
INSERT INTO `fa_subject` VALUES (64, 1, '5666', 20, '简答题', NULL, 1, NULL);
INSERT INTO `fa_subject` VALUES (65, 1, '爱好', 51, '简答题', NULL, 0, NULL);
INSERT INTO `fa_subject` VALUES (66, 1, '这是选择题', 21, '选择题', '单选', 0, NULL);
INSERT INTO `fa_subject` VALUES (67, 1, '啊 测试啊&nbsp;<br>是的<br>&nbsp;是的', 43, '选择题', '单选', 0, NULL);
INSERT INTO `fa_subject` VALUES (68, 1, '啊实打实多', 53, '选择题', '多选', 0, NULL);
INSERT INTO `fa_subject` VALUES (69, 2, '萨大', 53, '填空题', NULL, 0, NULL);
INSERT INTO `fa_subject` VALUES (70, 1, '啊实打实多', 54, '选择题', '单选', 0, NULL);
INSERT INTO `fa_subject` VALUES (71, 1, '啊实打实多1', 54, '选择题', '单选', 0, NULL);
INSERT INTO `fa_subject` VALUES (72, 1, '啊实打实多2', 54, '选择题', '单选', 0, NULL);
INSERT INTO `fa_subject` VALUES (73, 3, '发搜房卡我', 53, '选择题', '单选', 0, NULL);

SET FOREIGN_KEY_CHECKS = 1;
