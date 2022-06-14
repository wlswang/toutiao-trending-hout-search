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

 Date: 15/05/2022 21:19:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for company
-- ----------------------------
CREATE TABLE IF NOT EXISTS `company`  (
  `id` bigint NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '企业简称',
  `full_name` varchar(255) NOT NULL COMMENT '企业全称',
  `logo_url` varchar(255) NULL DEFAULT NULL,
  `city` varchar(255) NULL DEFAULT NULL,
  `description` varchar(255) NULL DEFAULT NULL,
  `contact_number` varchar(255) NULL DEFAULT NULL,
  `official_website` varchar(255) NULL DEFAULT NULL COMMENT '官网',
  `email` varchar(45) NULL DEFAULT NULL COMMENT '联系邮箱',
  `address` varchar(255) NULL DEFAULT NULL COMMENT '联系地址',
  `address_lng` decimal(10, 6) NULL DEFAULT NULL,
  `address_lat` decimal(10, 6) NULL DEFAULT NULL,
  `owner_id` bigint NOT NULL COMMENT '企业拥有者/超级管理员ID',
  `owner_member_id` bigint DEFAULT NULL COMMENT '关联超级管理员成员ID，防止误删',
  `status` int DEFAULT '0' COMMENT '状态: 0 正常, 1停用',
  `expired` DATETIME NULL DEFAULT NULL COMMENT '过期时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `full_name_UNIQUE`(`full_name`) USING BTREE,
  KEY `fg_company_owner_idx_idx` (`id`,`owner_id`),
  KEY `fg_owner_member_id_idx` (`owner_member_id`),
  CONSTRAINT `fg_owner_member_id` FOREIGN KEY (`owner_member_id`) REFERENCES `company_member` (`id`) ON DELETE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for company_dept
-- ----------------------------
CREATE TABLE IF NOT EXISTS `company_dept`  (
  `id` bigint NOT NULL,
  `name` varchar(45) NOT NULL,
  `parent_id` bigint NOT NULL COMMENT '上级部门ID，顶级部门为0',
  `ancestors` varchar(255) NOT NULL DEFAULT '0' COMMENT '祖级列表',
  `status` int DEFAULT '0' COMMENT '状态: 0 正常, 1停用',
  `company_id` bigint NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fg_company_id_idx`(`company_id`) USING BTREE,
  UNIQUE KEY `unique_dept_name` (`company_id`,`name`),
  CONSTRAINT `fg_dept_company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for company_member
-- ----------------------------
CREATE TABLE IF NOT EXISTS `company_member`  (
  `id` bigint NOT NULL,
  `name` varchar(45) NOT NULL COMMENT '成员姓名',
  `phone_number` varchar(45) COMMENT '成员手机号，与账户无需同步',
  `avatar_url` varchar(255) DEFAULT NULL COMMENT '头像',
  `email` varchar(45) NULL DEFAULT NULL,
  `wechat_code` varchar(128) DEFAULT NULL COMMENT '微信二维码',
  `wechat_id` varchar(24) DEFAULT NULL COMMENT '微信号',
  `position_name` varchar(45) NOT NULL,
  `role_id` bigint NOT NULL,
  `dept_Id` bigint NOT NULL,
  `company_id` bigint NOT NULL,
  `account_id` bigint NOT NULL,
  `status` int NOT NULL DEFAULT 0 COMMENT '0=未激活，1=正常，2=离职',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_member_name`(`company_id`, `phone_number`) USING BTREE,
  INDEX `fg_member_company_id_idx`(`company_id`) USING BTREE,
  INDEX `fg_member_role_id_idx`(`role_id`) USING BTREE,
  INDEX `fg_member_dept_id_idx`(`dept_Id`) USING BTREE,
  INDEX `fg_member_account_id_idx`(`account_id`) USING BTREE,
  CONSTRAINT `fg_member_account_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fg_member_company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fg_member_dept_id` FOREIGN KEY (`dept_Id`) REFERENCES `company_dept` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fg_member_role_id` FOREIGN KEY (`role_id`) REFERENCES `company_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for company_permission
-- ----------------------------
CREATE TABLE IF NOT EXISTS `company_permission`  (
  `name` varchar(45) NOT NULL,
  `description` varchar(45) NULL DEFAULT NULL,
  `group_type` int NOT NULL COMMENT '权限分组, 0 - 企业后台，1 - 客户端业务',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for company_role
-- ----------------------------
CREATE TABLE IF NOT EXISTS `company_role`  (
  `id` bigint NOT NULL,
  `name` varchar(45) NOT NULL COMMENT '名称',
  `data_scope` int NOT NULL DEFAULT 1,
  `type` int NULL DEFAULT NULL COMMENT '0:自定义角色，1:预设角色，10：预设企业超级管理员角色',
  `company_id` bigint NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fg_company_id_idx`(`company_id`) USING BTREE,
  CONSTRAINT `fg_role_company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for company_role_permission
-- ----------------------------
CREATE TABLE IF NOT EXISTS `company_role_permission`  (
  `role_id` bigint NOT NULL COMMENT '角色',
  `name` varchar(45) NOT NULL COMMENT '权限名称',
  `company_id` bigint NOT NULL,
  PRIMARY KEY (`role_id`, `name`) USING BTREE,
  INDEX `fg_role_permission_company_id_idx`(`company_id`) USING BTREE,
  INDEX `fg_role_permission_name`(`name`) USING BTREE,
  CONSTRAINT `fg_role_permission_company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fg_role_permission_id` FOREIGN KEY (`role_id`) REFERENCES `company_role` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fg_role_permission_name` FOREIGN KEY (`name`) REFERENCES `company_permission` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for company_usage
-- ----------------------------
CREATE TABLE IF NOT EXISTS `company_usage`  (
  `id` bigint NOT NULL,
  `plan_name` varchar(45) NOT NULL COMMENT '初始版本名称',
  `active_member_count` int NOT NULL DEFAULT 1,
  `total_member_count` int NOT NULL DEFAULT 15,
  `used_storage_capacity` bigint NOT NULL DEFAULT 0 COMMENT '已用空间',
  `total_storage_capacity` bigint NOT NULL DEFAULT 5368709120 COMMENT '总空间，默认5GB，进制1024',
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `fg_company_usage_id` FOREIGN KEY (`id`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for company_member_usage
-- ----------------------------
CREATE TABLE IF NOT EXISTS `company_member_usage`  (
  `id` bigint NOT NULL,
  `used_capacity` bigint NOT NULL DEFAULT 0 COMMENT '已用容量',
  `capacity_limit` bigint NOT NULL DEFAULT 209715200 COMMENT '成员容量限制，默认200MB',
  `company_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `fg_member_usage_id` FOREIGN KEY (`id`) REFERENCES `company_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for company_app_member
-- ----------------------------
CREATE TABLE IF NOT EXISTS `company_app_member`  (
  `id` bigint NOT NULL,
  `member_id` bigint NOT NULL,
  `app_id` int NOT NULL COMMENT '1:企业中心 2:销售',
  `company_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `unique_app_member_id_idx`(`member_id`, `app_id`) USING BTREE,
  INDEX `fg_app_member_company_id_idx`(`company_id`) USING BTREE,
  CONSTRAINT `fg_app_member_company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fg_app_member_member_id` FOREIGN KEY (`member_id`) REFERENCES `company_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `company_member_active` (
  `id` int NOT NULL AUTO_INCREMENT,
  `epoch_day` bigint NOT NULL COMMENT 'java-EpochDay',
  `member_id` bigint NOT NULL COMMENT '成员ID',
  `company_id` bigint NOT NULL COMMENT '企业ID',
  `count` int NOT NULL DEFAULT '0' COMMENT '活跃次数',
  PRIMARY KEY (`id`),
  KEY `active_member_id_idx` (`member_id`),
  KEY `epoch_day_idx` (`epoch_day`),
  KEY `company_id_idx` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='成员活跃记录';

SET FOREIGN_KEY_CHECKS = 1;
