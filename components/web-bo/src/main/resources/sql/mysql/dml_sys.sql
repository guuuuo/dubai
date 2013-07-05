INSERT INTO sys_module (id, module_code, module_name, module_desc, i18n_key, display_order, url, active, created_by, created_when, updated_by, updated_when) VALUES
(1, 'home', 'Home', 'Home', 'module.home', 1, '/dashboard', '1', 'niko', current_timestamp, NULL, current_timestamp),
(2, 'sys', 'System', 'System Management', 'module.sys', 2, '/system', '1', 'niko', current_timestamp, NULL, current_timestamp),
(3, 'cms', 'CMS', 'Content Management', 'module.cms', 3, '/cms', '1', 'niko', current_timestamp, NULL, current_timestamp);

INSERT INTO sys_menu_group (id, module_id, menu_group_name, menu_group_desc, display_order, url, i18n_key, active, created_by, created_when, updated_by, updated_when) VALUES
(1, 1, 'Main', 'Main', 1, '', '', '1', 'niko', current_timestamp, NULL, current_timestamp),
(2, 2, '组织结构管理', '组织结构管理', 1, '', '', '1', 'niko', current_timestamp, NULL, current_timestamp),
(3, 2, '资源权限管理', '资源权限管理', 2, '', '', '1', 'niko', current_timestamp, NULL, current_timestamp);

INSERT INTO sys_menu_item (id, menu_group_id, menu_item_name, display_order, menu_item_desc, url, i18n_key, active, created_by, created_when, updated_by, updated_when) VALUES
(1, 2, 'Dept Mgr', 1, 'Dept', 'system/dept', '', '1', 'niko', current_timestamp, NULL, current_timestamp),
(2, 2, 'Role Mgr', 2, 'Role', 'system/role', '', '1', 'niko', current_timestamp, NULL, current_timestamp),
(3, 2, 'User Mgr', 3, 'User', 'system/user', '', '1', 'niko', current_timestamp, NULL, current_timestamp),
(4, 3, 'Menu Mgr', 1, 'Menu Management', 'system/menu', '', '1', 'niko', current_timestamp, NULL, current_timestamp),
(5, 3, 'Acl Mgr', 2, 'Acl Management', 'system/acl', '', '1', 'niko', current_timestamp, NULL, current_timestamp),
(6, 1, 'Dashboard', 1, 'Dashboard', 'dashboard', '', '1', 'niko', current_timestamp, NULL, current_timestamp);

INSERT INTO sys_user (id, login_name, nice_name, password, email, salt, roles, register_date, status_code, act_key, act_key_gen_date, act_date, created_by, created_when, updated_by, updated_when) VALUES
(1, 'admin', 'Administrator', '0116ed4e2e8f52dfb7b9b7cd0e5f6bcd4b78f336', 'niko.guo@gmail.com', '0dda6609345384ea', 'admin', current_timestamp, 1, '88e6fb94c83f72146b61b8aecc0b22c093a0bc3e', current_timestamp, current_timestamp, 'xmfish', current_timestamp, null, current_timestamp);

COMMIT;