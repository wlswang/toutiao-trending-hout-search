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

 Date: 29/05/2022 16:24:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mk_database_classify
-- ----------------------------
CREATE TABLE IF NOT EXISTS `mk_database_classify`  (
  `classify_id` bigint NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `company_id` bigint NOT NULL COMMENT '企业ID',
  `classify_name` varchar(10) NOT NULL COMMENT '分类名称',
  `classify_parent` bigint NOT NULL DEFAULT 0 COMMENT '父级菜单',
  `screen` tinyint NOT NULL DEFAULT 1,
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`classify_id`) USING BTREE,
  INDEX `company_id`(`company_id`) USING BTREE,
  INDEX `classify_parent_idx`(`classify_parent`) USING BTREE,
  CONSTRAINT `fg_classify_company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '企业资料库分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mk_database_data
-- ----------------------------
CREATE TABLE IF NOT EXISTS `mk_database_data`  (
  `data_id` bigint NOT NULL COMMENT '资料ID',
  `data_name` varchar(24) NOT NULL COMMENT '资料名称',
  `file_id` bigint NOT NULL COMMENT '内容ID',
  `classify_id` bigint NOT NULL COMMENT '分类ID',
  `screen` tinyint NOT NULL DEFAULT 1 COMMENT '是否显示',
  `browse` int NOT NULL DEFAULT '0',
  `is_share` tinyint NULL DEFAULT NULL COMMENT '是否共享(1 true  0 flase)，代理逻辑',
  `description` varchar(255) NULL DEFAULT NULL COMMENT '说明/备注',
  `company_id` bigint NOT NULL COMMENT '企业ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`data_id`) USING BTREE,
  INDEX `company_id`(`company_id`) USING BTREE,
  INDEX `classify_id`(`classify_id`) USING BTREE,
  CONSTRAINT `fg_data_company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '企业公共资料库' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mk_database_file
-- ----------------------------
CREATE TABLE IF NOT EXISTS `mk_database_file`  (
  `id` bigint NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '文件标题',
  `size` int NOT NULL DEFAULT 0 COMMENT '文件大小',
  `type` tinyint NOT NULL DEFAULT 1 COMMENT '文件类型(1 文件 2 视频 3 图片 4 网页 5 文章)',
  `path` varchar(255) NOT NULL COMMENT '文件路径， 其他为文件地址， 网页类型的为链接',
  `preview` varchar(255) NULL COMMENT '预览路径',
  `suffix` varchar(45) NULL COMMENT '文件后缀',
  `fingerprint` varchar(127) NOT NULL COMMENT '文件唯一性',
  `member_id` bigint NOT NULL COMMENT '成员ID',
  `company_id` bigint NOT NULL COMMENT '企业ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_file_title_company`(`company_id`, `title`) USING BTREE,
  INDEX `company_id`(`company_id`) USING BTREE,
  CONSTRAINT `fg_file_company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '文件' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mk_database_tag
-- ----------------------------
CREATE TABLE IF NOT EXISTS `mk_database_tag`  (
  `tag_id` bigint NOT NULL,
  `tag_name` varchar(45) NOT NULL COMMENT '标签名称',
  `screen` tinyint NOT NULL DEFAULT 1 COMMENT '是否显示',
  `count` int NOT NULL DEFAULT 0 COMMENT '引用计数',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态 (0 启用 1 暂停 2 删除)',
  `company_id` bigint NOT NULL COMMENT '企业ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tag_id`) USING BTREE,
  UNIQUE INDEX `unique_database_tag_name_company`(`company_id`, `tag_name`) USING BTREE,
  CONSTRAINT `fg_tag_company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mk_database_tag_data
-- ----------------------------
CREATE TABLE IF NOT EXISTS `mk_database_tag_data`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_id` bigint NOT NULL,
  `data_id` bigint NOT NULL,
  `company_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_tag_data_idx`(`tag_id`, `data_id`) USING BTREE,
  INDEX `tag_id_idx`(`tag_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
