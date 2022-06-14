
/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : salesnet

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 10/05/2022 10:45:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
CREATE TABLE IF NOT EXISTS `account`  (
  `id` bigint NOT NULL COMMENT '账户ID',
  `phone_number` varchar(45)  NOT NULL COMMENT '手机号，唯一',
  `password` varchar(255)  NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(45)  NOT NULL COMMENT '账户昵称',
  `avatar_url` varchar(255) NULL DEFAULT NULL COMMENT '头像URL',
  `wechat_focus` tinyint NULL DEFAULT 0 COMMENT '是否关注服务号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_phone_number`(`phone_number`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `account_third_account`  (
  `id` bigint NOT NULL,
  `third` varchar(45)  NULL DEFAULT NULL COMMENT '三方平台 weixin/dingTalk',
  `open_id` varchar(45)  NULL DEFAULT NULL,
  `nick_name` varchar(45)  NULL DEFAULT NULL,
  `account_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_third_openId`(`third`, `open_id`) USING BTREE,
  INDEX `fg_account_third_account_idx`(`account_id`) USING BTREE,
  CONSTRAINT `fg_account_third_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;