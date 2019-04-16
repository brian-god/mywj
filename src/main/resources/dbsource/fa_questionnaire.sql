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

 Date: 16/04/2019 09:06:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for fa_questionnaire
-- ----------------------------
DROP TABLE IF EXISTS `fa_questionnaire`;
CREATE TABLE `fa_questionnaire`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '问卷名称',
  `describes` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '问卷描述',
  `user` int(8) DEFAULT NULL COMMENT '所属用户',
  `state` int(8) DEFAULT -1 COMMENT '流程状态：-1--自由态；1--提交状态；2--审批通过；3--驳回',
  `qtstate` int(8) DEFAULT 0 COMMENT '问卷状态；0--可展示；1不可展示',
  `createtime` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建时间',
  `updatetime` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '修改时间',
  `modifier` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人',
  `dr` int(8) DEFAULT 0 COMMENT '逻辑标志',
  `number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '问卷编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_questionnaire
-- ----------------------------
INSERT INTO `fa_questionnaire` VALUES (20, 'bsfasdad', 'asdasdasdad2e', 1, -1, NULL, '2019-04-09 16:43:27', NULL, 'username', 0, '20190409164327012');
INSERT INTO `fa_questionnaire` VALUES (21, '测试问卷1', '这个是测试问卷1哦', 1, -1, NULL, '2019-04-09 16:44:19', NULL, 'username', 0, '20190409164419016');
INSERT INTO `fa_questionnaire` VALUES (27, '不登高山不显平地', '上爽肤水', 1, 1, NULL, '2019-04-09 16:52:10', NULL, 'username', 0, '20190409165210028');
INSERT INTO `fa_questionnaire` VALUES (43, '修改测试问卷', '我的测试问卷经过修改', 1, -1, NULL, '2019-04-09 21:50:50', '2019-04-15 21:46:54', 'username', 0, '20190409215050073');
INSERT INTO `fa_questionnaire` VALUES (44, '我的测试问卷', '这是我修改后的问卷', 1, 1, NULL, '2019-04-15 19:15:40', '2019-04-16 09:01:15', 'username', 0, '20190415191540038');
INSERT INTO `fa_questionnaire` VALUES (45, '流程问卷', '流程测试问卷修改', 1, 1, NULL, '2019-04-15 23:13:10', '2019-04-16 09:01:15', 'username', 0, '20190415231310042');

SET FOREIGN_KEY_CHECKS = 1;
