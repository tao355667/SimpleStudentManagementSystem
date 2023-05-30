/*
 Navicat MySQL Data Transfer

 Source Server         : demo
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : demo

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 30/05/2023 15:55:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sex` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `age` int(0) NULL DEFAULT NULL,
  `department` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `classes` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '202200010001', '小白子', '女', 19, '计算机学院', '计算机科学与技术1班');
INSERT INTO `student` VALUES (2, '202200010002', '菜虚鲲', '男', 19, '计算机学院', '计算机科学与技术2班');
INSERT INTO `student` VALUES (6, 'qwer', '小789', '男', 666, '789', '计算机科学与技术2班');
INSERT INTO `student` VALUES (7, 'qwer', '小789', '男', 14, '789', '计算机科学与技术2班');
INSERT INTO `student` VALUES (9, 'update9', 'update测试', '男', 465, '789', '计算机科学与技术2班');
INSERT INTO `student` VALUES (12, 'qwer', '小789', '男', 14, '789', '计科1班');
INSERT INTO `student` VALUES (13, 'qwer', '小789', '男', 14, '789', '计科1班');
INSERT INTO `student` VALUES (14, 'qwer', '小789', '男', 14, '789', '计科1班');
INSERT INTO `student` VALUES (15, 'qwer', '的风格', '男', 14, '789', '计科1班');
INSERT INTO `student` VALUES (16, 'qwer', '小789', '男', 7896, '789', '计科1班');
INSERT INTO `student` VALUES (17, 'qwer', '小789', '男', 14, '789', '计科1班');
INSERT INTO `student` VALUES (18, 'qwer', '小789', '男', 14, '789', '计科1班');
INSERT INTO `student` VALUES (20, 'qwer', '小789', '男', 14, '789', '计科1班');
INSERT INTO `student` VALUES (22, 'qwer', '小789', '男', 9876, '789', '计科1班');
INSERT INTO `student` VALUES (23, 'qwer', '小789', '男', 14, '789', '计科1班');
INSERT INTO `student` VALUES (24, 'qwer', '小789', '男', 14, '789', '计科1班');
INSERT INTO `student` VALUES (25, 'qwer', '小789', '男', 14, '789', '计科1班');
INSERT INTO `student` VALUES (26, 'qwer', '小789', '男', 14, '789', '计科1班');
INSERT INTO `student` VALUES (27, 'qwer', '小789', '男', 14, '789', '计科1班');
INSERT INTO `student` VALUES (28, 'qwer', '小789', '男', 6789, '789', '计科1班');
INSERT INTO `student` VALUES (29, 'qwer', '小789', '男', 14, '789', '计科1班');
INSERT INTO `student` VALUES (30, 'qwer', '小789', '男', 14, '789', '计科1班');
INSERT INTO `student` VALUES (31, 'qwer', '小789', '男', 3333, '789', '计科1班');
INSERT INTO `student` VALUES (32, 'qwer', '小789', '男', 14, '789', '计科1班');
INSERT INTO `student` VALUES (33, 'qwer', '小789', '男', 14, '789', '计科1班');
INSERT INTO `student` VALUES (35, 'qwer', '小789', '男', 14, '789', '计科1班');
INSERT INTO `student` VALUES (36, 'qwer', '小789', '男', 14, '789', '计科1班');
INSERT INTO `student` VALUES (38, 'qwer', '小789', '男', 14, '789', '计科1班');
INSERT INTO `student` VALUES (39, 'qwer', '小789', '男', 1000, '789', '计科1班');
INSERT INTO `student` VALUES (40, 'qwer', '小789', '男', 14, '789', '计科1班');
INSERT INTO `student` VALUES (41, 'qwer', '小789', '男', 14, '789', '计科1班');
INSERT INTO `student` VALUES (42, 'qwer', '小789', '男', 14, '789', '计科1班');
INSERT INTO `student` VALUES (43, 'qwer', '小789', '男', 14, '789', '计科1班');
INSERT INTO `student` VALUES (44, 'qwer', '小789', '男', 14, '789', '计科1班');
INSERT INTO `student` VALUES (45, 'qwer', '小789', '男', 14, '789', '计科1班');
INSERT INTO `student` VALUES (46, '对方是否', '小789', '男', 14, '789', '计科1班');
INSERT INTO `student` VALUES (48, '123', '123', '1', 12, '123', NULL);
INSERT INTO `student` VALUES (49, '对方是否', '小789', '男', 14, '789', '计科1班');
INSERT INTO `student` VALUES (52, '123', '123', '1', 1000, '123', '123');
INSERT INTO `student` VALUES (54, '4756', '78', '4', 8, '45645特瑞特', '789');
INSERT INTO `student` VALUES (56, '艾德', '小789', '男', 14, '789', '计科1班');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '123');
INSERT INTO `user` VALUES ('111', 'ddd');
INSERT INTO `user` VALUES ('123', '123');
INSERT INTO `user` VALUES ('1234', '123');
INSERT INTO `user` VALUES ('1239', '1239');
INSERT INTO `user` VALUES ('789', '159');
INSERT INTO `user` VALUES ('abc', '123');
INSERT INTO `user` VALUES ('admin', '123456');
INSERT INTO `user` VALUES ('ddd', 'ddd');

SET FOREIGN_KEY_CHECKS = 1;
