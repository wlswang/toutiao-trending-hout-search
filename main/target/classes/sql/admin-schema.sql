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

 Date: 19/05/2022 09:35:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_company_web_menu
-- ----------------------------
CREATE TABLE IF NOT EXISTS `admin_company_web_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50)  NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200)  NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255)  NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255)  NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1)  NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1)  NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1)  NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100)  NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100)  NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64)  NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64)  NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500)  NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for admin_company_plan
-- ----------------------------
CREATE TABLE IF NOT EXISTS `admin_company_plan`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT '版本名称',
  `total_member_count` int NOT NULL DEFAULT 1,
  `total_storage_capacity` bigint NOT NULL DEFAULT 5368709120 COMMENT '默认5GB',
  `price` decimal(20, 2) NOT NULL,
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '0-正常，1-停用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
