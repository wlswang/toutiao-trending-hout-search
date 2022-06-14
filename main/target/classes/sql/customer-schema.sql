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

 Date: 26/05/2022 13:55:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mk_customer_tag_type
-- ----------------------------
CREATE TABLE IF NOT EXISTS `mk_customer_tag_type`  (
  `tag_type_id` bigint NOT NULL,
  `type_name` varchar(45) NOT NULL COMMENT '标签分类名称',
  `screen` tinyint NOT NULL DEFAULT 1 COMMENT '是否参与筛选',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态 (0 启用 1 暂停 2 删除)',
  `is_preset` tinyint NOT NULL DEFAULT 0 COMMENT '是否预设',
  `company_id` bigint NOT NULL COMMENT '企业ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tag_type_id`) USING BTREE,
  UNIQUE INDEX `unique_customer_tag_type_name_idx`(`company_id`, `type_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mk_customer_tag
-- ----------------------------
CREATE TABLE IF NOT EXISTS `mk_customer_tag`  (
  `tag_id` bigint NOT NULL,
  `tag_name` varchar(45) NOT NULL COMMENT '标签名称',
  `tag_type_id` bigint NOT NULL COMMENT '标签分类ID',
  `count` int NOT NULL DEFAULT 0 COMMENT '引用计数',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态 (0 启用 1 暂停 2 删除)',
  `company_id` bigint NOT NULL COMMENT '企业ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tag_id`) USING BTREE,
  UNIQUE INDEX `unique_customer_tag_name_company`(`company_id`, `tag_name`) USING BTREE,
  INDEX `fg_customer_tag_tag_type_id_idx`(`tag_type_id`) USING BTREE,
  CONSTRAINT `fg_customer_tag_tag_type_id` FOREIGN KEY (`tag_type_id`) REFERENCES `mk_customer_tag_type` (`tag_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;