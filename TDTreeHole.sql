/*
 Navicat Premium Data Transfer

 Source Server         : 云数据库
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 39.97.109.245:3306
 Source Schema         : TDTreeHole

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 06/05/2020 18:42:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `userid` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `postid` int(10) NOT NULL AUTO_INCREMENT COMMENT '帖子唯一标识',
  `postcontent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '帖子内容',
  `modifytime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `posttime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发表时间',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `userid` int(10) NOT NULL COMMENT '发帖人ID,链接user表的userid的外键',
  `posttype` int(10) NULL DEFAULT NULL COMMENT '帖子种类。1代表吐槽，2代表交友，3代表表白，4代表其他',
  PRIMARY KEY (`postid`) USING BTREE,
  INDEX `postuserid`(`userid`) USING BTREE,
  CONSTRAINT `postuserid` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for repost
-- ----------------------------
DROP TABLE IF EXISTS `repost`;
CREATE TABLE `repost`  (
  `repostid` int(10) NOT NULL AUTO_INCREMENT COMMENT '回帖唯一标识\r\n',
  `modifytime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `publishtime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布时间',
  `postid` int(10) NULL DEFAULT NULL COMMENT '回复的帖子ID',
  `userid` int(10) NULL DEFAULT NULL COMMENT '回帖人ID\r\n',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回帖内容\r\n',
  PRIMARY KEY (`repostid`) USING BTREE,
  INDEX `postid`(`postid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  CONSTRAINT `postid` FOREIGN KEY (`postid`) REFERENCES `post` (`postid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userid` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户唯一标识',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码',
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
