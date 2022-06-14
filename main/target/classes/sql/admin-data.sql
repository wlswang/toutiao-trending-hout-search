SET FOREIGN_KEY_CHECKS = 0;
-----------------
-- 企业后台菜单
-----------------

INSERT IGNORE INTO `admin_company_web_menu` VALUES (1, '系统管理', 0, 888, 'system', NULL, '', 1, 0, 'M', '0', '0', 'admin:get', 'system', 'admin', '2022-04-26 09:51:04', 'admin', '2022-05-11 11:42:39', '系统管理目录');
INSERT IGNORE INTO `admin_company_web_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'admin:menu:get', 'tree-table', 'admin', '2022-04-26 09:51:04', '', NULL, '菜单管理菜单');
INSERT IGNORE INTO `admin_company_web_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-04-26 09:51:05', '', NULL, '');
INSERT IGNORE INTO `admin_company_web_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-04-26 09:51:05', '', NULL, '');
INSERT IGNORE INTO `admin_company_web_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-04-26 09:51:05', '', NULL, '');
INSERT IGNORE INTO `admin_company_web_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-04-26 09:51:05', '', NULL, '');

INSERT IGNORE INTO `admin_company_web_menu` VALUES (2002, '角色权限', 0, 6, 'ggy-role', 'ggy/role/index', NULL, 1, 0, 'C', '0', '0', 'company:role:get', 'peoples', 'admin', '2022-04-27 10:26:51', 'admin', '2022-05-06 11:13:42', '');
INSERT IGNORE INTO `admin_company_web_menu` VALUES (2004, '企业设置', 0, 6, 'company', 'ggy/companySetting/index', NULL, 1, 0, 'C', '0', '0', 'company:company:get', 'logininfor', 'admin', '2022-04-29 16:57:11', 'admin', '2022-05-06 11:14:57', '');
INSERT IGNORE INTO `admin_company_web_menu` VALUES (2005, '标签管理', 0, 7, 'label/content', '', NULL, 1, 0, 'M', '0', '0', NULL, 'tab', 'admin', '2022-05-05 14:00:32', 'admin', '2022-05-06 10:51:57', '');
INSERT IGNORE INTO `admin_company_web_menu` VALUES (2006, '内容标签', 2005, 5, 'label/content', 'ggy/label/content/index', NULL, 1, 0, 'C', '0', '0', 'company:database:tag:get', 'education', 'admin', '2022-05-05 14:01:58', 'admin', '2022-05-06 16:09:25', '');
INSERT IGNORE INTO `admin_company_web_menu` VALUES (2008, '客户标签', 2005, 6, 'label/customer', 'ggy/label/customer/index', NULL, 1, 0, 'C', '0', '0', 'company:customer:tag:get', 'user', 'admin', '2022-05-05 14:28:35', 'admin', '2022-05-11 18:21:58', '');
INSERT IGNORE INTO `admin_company_web_menu` VALUES (2009, '组织架构', 0, 6, 'organize', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'people', 'admin', '2022-05-06 11:18:00', '', NULL, '');
INSERT IGNORE INTO `admin_company_web_menu` VALUES (2010, '部门管理', 2009, 5, 'system/dept', 'system/dept/index', NULL, 1, 0, 'C', '0', '0', 'company:dept:get', 'tree', 'admin', '2022-05-06 11:19:26', 'admin', '2022-05-06 11:20:12', '');
INSERT IGNORE INTO `admin_company_web_menu` VALUES (2011, '成员管理', 2009, 6, 'system/user', 'ggy/organize/user/index', NULL, 1, 0, 'C', '0', '0', 'company:member:get', 'user', 'admin', '2022-05-06 11:41:11', 'admin', '2022-05-06 11:45:09', '');
INSERT IGNORE INTO `admin_company_web_menu` VALUES (2012, '资料库管理', 0, 8, 'database', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'documentation', 'admin', '2022-05-06 14:20:34', '', NULL, '');
INSERT IGNORE INTO `admin_company_web_menu` VALUES (2013, '内容上传', 2012, 5, 'database/content', 'ggy/database/content/index', NULL, 1, 0, 'C', '0', '0', 'company:database:file:get', 'education', 'admin', '2022-05-06 14:22:00', 'admin', '2022-05-11 18:22:28', '');
INSERT IGNORE INTO `admin_company_web_menu` VALUES (2014, '资料管理', 2012, 8, 'database/data', 'ggy/database/data/index', NULL, 1, 0, 'C', '0', '0', 'company:database:data:get', 'dict', 'admin', '2022-05-06 14:23:03', 'admin', '2022-05-11 18:22:34', '');

SET FOREIGN_KEY_CHECKS = 1;