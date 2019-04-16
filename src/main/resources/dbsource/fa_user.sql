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

 Date: 16/04/2019 09:06:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for fa_user
-- ----------------------------
DROP TABLE IF EXISTS `fa_user`;
CREATE TABLE `fa_user`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '头像',
  `gender` tinyint(8) UNSIGNED DEFAULT 0 COMMENT '性别',
  `birthday` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '生日',
  `jointime` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '加入时间',
  `createtime` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '创建时间',
  `updatetime` varchar(19) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '更新时间',
  `usertype` int(8) DEFAULT 1 COMMENT '用户类型参照用户表',
  `status` int(8) DEFAULT 0 COMMENT '状态',
  `dr` int(8) DEFAULT 0 COMMENT '逻辑标志：0可用，1表示删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  INDEX `email`(`email`) USING BTREE,
  INDEX `mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_user
-- ----------------------------
INSERT INTO `fa_user` VALUES (1, 'username', 'code', '123', 'tangxkwork@163.com', '13165766090', '', 0, '2019-01-07', '2019-01-07 16:15:57', '2019-01-07 16:15:57', '2019-01-07 16:15:57', 1, 0, 0);
INSERT INTO `fa_user` VALUES (56, 'tangxk', '唐晓康', '123', 'tangxkwork@aliyun.com', '13681630454', '', 1, '2019-02-19', '2019-02-15 16:20:13', '2019-02-15 16:20:13', '', 1, 0, 0);
INSERT INTO `fa_user` VALUES (58, '1031132178', 'lxs', '1', '1031132178@qq.com', '13823721131', NULL, 0, '1994-09-18', '2019-04-09 18:09:16', '2019-04-09 18:09:16', NULL, NULL, 1, 0);
INSERT INTO `fa_user` VALUES (59, 'xiaosong', '唐晓康', '123', '2459464057@qq.com', '13681630451', NULL, 0, '2019-04-09', '2019-04-09 16:04:04', '2019-04-09 16:04:04', NULL, NULL, 1, 0);

SET FOREIGN_KEY_CHECKS = 1;
