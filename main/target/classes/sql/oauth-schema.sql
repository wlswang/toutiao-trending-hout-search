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

 Date: 19/05/2022 09:42:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for oauth_access_token
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `oauth_access_token`  (
  `token_id` varchar(64)  NULL DEFAULT NULL,
  `token` blob NULL,
  `authentication_id` varchar(64)  NOT NULL,
  `user_name` varchar(64)  NULL DEFAULT NULL,
  `client_id` varchar(64)  NULL DEFAULT NULL,
  `authentication` blob NULL,
  `refresh_token` varchar(64)  NULL DEFAULT NULL,
  PRIMARY KEY (`authentication_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for oauth_refresh_token
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `oauth_refresh_token`  (
  `token_id` varchar(64)  NULL DEFAULT NULL,
  `token` blob NULL,
  `authentication` blob NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
