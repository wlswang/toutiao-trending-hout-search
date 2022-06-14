SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Data for company_permission(name, description, group_type)
-- group_type 权限分组, 0 - 企业后台，1 - 客户端业务
-- 权限name需要自带分组，按“:”划分层级
-- ----------------------------

INSERT company_permission VALUES ('company:role:get', '查看角色', 0) ON DUPLICATE KEY UPDATE description=VALUES(description);
INSERT company_permission VALUES ('company:role:post', '管理角色', 0) ON DUPLICATE KEY UPDATE description=VALUES(description);
INSERT company_permission VALUES ('company:dept:get', '查看部门', 0) ON DUPLICATE KEY UPDATE description=VALUES(description);
INSERT company_permission VALUES ('company:dept:post', '管理部门', 0) ON DUPLICATE KEY UPDATE description=VALUES(description);
INSERT company_permission VALUES ('company:member:get', '查看成员', 0) ON DUPLICATE KEY UPDATE description=VALUES(description);
INSERT company_permission VALUES ('company:member:post', '管理成员', 0) ON DUPLICATE KEY UPDATE description=VALUES(description);
INSERT company_permission VALUES ('company:company:get', '查看企业基本信息', 0) ON DUPLICATE KEY UPDATE description=VALUES(description);
INSERT company_permission VALUES ('company:company:post', '修改企业基本信息', 0) ON DUPLICATE KEY UPDATE description=VALUES(description);
INSERT company_permission VALUES ('company:database:tag:get', '标签管理-查看内容标签', 0) ON DUPLICATE KEY UPDATE description=VALUES(description);
INSERT company_permission VALUES ('company:database:tag:post', '标签管理-管理内容标签', 0) ON DUPLICATE KEY UPDATE description=VALUES(description);
INSERT company_permission VALUES ('company:customer:tag:get', '标签管理-查看客户标签', 0) ON DUPLICATE KEY UPDATE description=VALUES(description);
INSERT company_permission VALUES ('company:customer:tag:post', '标签管理-管理客户标签', 0) ON DUPLICATE KEY UPDATE description=VALUES(description);
INSERT company_permission VALUES ('company:database:file:get', '资料库管理-查看内容', 0) ON DUPLICATE KEY UPDATE description=VALUES(description);
INSERT company_permission VALUES ('company:database:file:post', '资料库管理-管理内容', 0) ON DUPLICATE KEY UPDATE description=VALUES(description);
INSERT company_permission VALUES ('company:database:file:del', '资料库管理-删除内容', 0) ON DUPLICATE KEY UPDATE description=VALUES(description);
INSERT company_permission VALUES ('company:database:classify:get', '资料库管理-查看分类', 0) ON DUPLICATE KEY UPDATE description=VALUES(description);
INSERT company_permission VALUES ('company:database:classify:post', '资料库管理-管理分类', 0) ON DUPLICATE KEY UPDATE description=VALUES(description);
INSERT company_permission VALUES ('company:database:classify:del', '资料库管理-删除分类', 0) ON DUPLICATE KEY UPDATE description=VALUES(description);
INSERT company_permission VALUES ('company:database:data:get', '资料库管理-查看资料', 0) ON DUPLICATE KEY UPDATE description=VALUES(description);
INSERT company_permission VALUES ('company:database:data:post', '资料库管理-管理资料', 0) ON DUPLICATE KEY UPDATE description=VALUES(description);
INSERT company_permission VALUES ('company:database:data:del', '资料库管理-删除资料', 0) ON DUPLICATE KEY UPDATE description=VALUES(description);
-- 销售业务权限
INSERT company_permission VALUES ('sales:basic', '销售功能', 1) ON DUPLICATE KEY UPDATE description=VALUES(description);
INSERT company_permission VALUES ('sales:manager', '销售管理功能', 1) ON DUPLICATE KEY UPDATE description=VALUES(description);
SET FOREIGN_KEY_CHECKS = 1;