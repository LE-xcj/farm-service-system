/*
 Navicat Premium Data Transfer

 Source Server         : 服务器
 Source Server Type    : MySQL
 Source Server Version : 50643
 Source Host           : 106.14.139.8:3306
 Source Schema         : zhku

 Target Server Type    : MySQL
 Target Server Version : 50643
 File Encoding         : 65001

 Date: 08/04/2019 23:28:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_bill
-- ----------------------------
DROP TABLE IF EXISTS `t_bill`;
CREATE TABLE `t_bill`  (
  `bid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `money` float(8, 2) NULL DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT 0 COMMENT '订单状态：0：未确认；1：确认；2：完成；-1：拒绝；-2：取消',
  `createTime` datetime(0) NULL DEFAULT NULL,
  `deadline` datetime(0) NULL DEFAULT NULL COMMENT '预约日期',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `location` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`bid`) USING BTREE,
  INDEX `Reft_merchant31`(`mid`) USING BTREE,
  INDEX `Reft_farmer41`(`fid`) USING BTREE,
  CONSTRAINT `Reft_farmer41` FOREIGN KEY (`fid`) REFERENCES `t_farmer` (`fid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Reft_merchant31` FOREIGN KEY (`mid`) REFERENCES `t_merchant` (`mid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_bill_item
-- ----------------------------
DROP TABLE IF EXISTS `t_bill_item`;
CREATE TABLE `t_bill_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iid` int(11) NOT NULL,
  `bid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `num` int(8) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Reft_item71`(`iid`) USING BTREE,
  INDEX `Reft_bill81`(`bid`) USING BTREE,
  CONSTRAINT `Reft_bill81` FOREIGN KEY (`bid`) REFERENCES `t_bill` (`bid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Reft_item71` FOREIGN KEY (`iid`) REFERENCES `t_item` (`iid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_bill_operator
-- ----------------------------
DROP TABLE IF EXISTS `t_bill_operator`;
CREATE TABLE `t_bill_operator`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Reft_controller101`(`oid`) USING BTREE,
  INDEX `Reft_bill111`(`bid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_certify_record
-- ----------------------------
DROP TABLE IF EXISTS `t_certify_record`;
CREATE TABLE `t_certify_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(2) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_farmer
-- ----------------------------
DROP TABLE IF EXISTS `t_farmer`;
CREATE TABLE `t_farmer`  (
  `fid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '农户',
  `psw` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `location` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `picture` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `decription` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_item
-- ----------------------------
DROP TABLE IF EXISTS `t_item`;
CREATE TABLE `t_item`  (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `iname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `price` float(8, 2) NOT NULL,
  `unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位',
  `media` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '媒体资源url',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(2) NOT NULL DEFAULT 1 COMMENT '1:上架；0:下架',
  PRIMARY KEY (`iid`) USING BTREE,
  INDEX `Reft_merchant11`(`mid`) USING BTREE,
  CONSTRAINT `Reft_merchant11` FOREIGN KEY (`mid`) REFERENCES `t_merchant` (`mid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_item_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `t_item_evaluation`;
CREATE TABLE `t_item_evaluation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` float(8, 1) NOT NULL,
  `evaluation` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` date NULL DEFAULT NULL,
  `iid` int(11) NOT NULL,
  `bid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Reft_item51`(`iid`) USING BTREE,
  CONSTRAINT `Reft_item51` FOREIGN KEY (`iid`) REFERENCES `t_item` (`iid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_merchant
-- ----------------------------
DROP TABLE IF EXISTS `t_merchant`;
CREATE TABLE `t_merchant`  (
  `mid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mname` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '商户',
  `psw` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `location` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `picture` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isVerify` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` int(2) NOT NULL DEFAULT 1 COMMENT '1：农户；2：商户',
  `destination` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '目标id',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(2) NULL DEFAULT 0 COMMENT '1:已读；2:未读',
  `sendTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_operator
-- ----------------------------
DROP TABLE IF EXISTS `t_operator`;
CREATE TABLE `t_operator`  (
  `oid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `oname` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '男',
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `picture` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
