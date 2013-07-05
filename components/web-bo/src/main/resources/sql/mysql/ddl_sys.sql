# **** sys_module **** #
DROP TABLE IF EXISTS sys_module;
CREATE TABLE sys_module
(
  id            BIGINT PRIMARY KEY                      NOT NULL AUTO_INCREMENT,
  module_code   VARCHAR(32)                             NOT NULL,
  module_name   VARCHAR(64)                             NOT NULL,
  module_desc   VARCHAR(200) DEFAULT ''                 NOT NULL,
  url           VARCHAR(200) DEFAULT ''                 NOT NULL,
  i18n_key      VARCHAR(200) DEFAULT ''                 NOT NULL,
  active        VARCHAR(1) DEFAULT ''                   NOT NULL,
  display_order SMALLINT                                NULL,
  created_by    VARCHAR(64)                             NOT NULL,
  created_when  TIMESTAMP DEFAULT '0000-00-00 00:00:00' NOT NULL,
  updated_by    VARCHAR(64),
  updated_when  TIMESTAMP
)
  ENGINE =InnoDB;
CREATE UNIQUE INDEX idx_unq_sys_module_module_code ON sys_module (module_code);
CREATE INDEX idx_sys_module_module_code ON sys_module (module_code);


# **** sys_menu_group **** #
DROP TABLE IF EXISTS sys_menu_group;
CREATE TABLE sys_menu_group
(
  id              BIGINT PRIMARY KEY                      NOT NULL AUTO_INCREMENT,
  module_id       BIGINT                                  NOT NULL,
  menu_group_name VARCHAR(64)                             NOT NULL,
  menu_group_desc VARCHAR(200) DEFAULT ''                 NOT NULL,
  url             VARCHAR(200) DEFAULT ''                 NOT NULL,
  i18n_key        VARCHAR(200) DEFAULT ''                 NOT NULL,
  active          VARCHAR(1) DEFAULT ''                   NOT NULL,
  display_order   SMALLINT                                NULL,
  created_by      VARCHAR(64)                             NOT NULL,
  created_when    TIMESTAMP DEFAULT '0000-00-00 00:00:00' NOT NULL,
  updated_by      VARCHAR(64),
  updated_when    TIMESTAMP
)
  ENGINE =InnoDB;
CREATE UNIQUE INDEX idx_unq_sys_menu_group_menu_group_name ON sys_menu_group (menu_group_name);
CREATE INDEX idx_sys_menu_group_menu_group_name ON sys_menu_group (menu_group_name);


# **** sys_menu_item **** #
DROP TABLE IF EXISTS sys_menu_item;
CREATE TABLE sys_menu_item
(
  id             BIGINT PRIMARY KEY                      NOT NULL AUTO_INCREMENT,
  menu_group_id  BIGINT                                  NOT NULL,
  menu_item_name VARCHAR(64)                             NOT NULL,
  menu_item_desc VARCHAR(200) DEFAULT ''                 NOT NULL,
  url            VARCHAR(200) DEFAULT ''                 NOT NULL,
  i18n_key       VARCHAR(200) DEFAULT ''                 NOT NULL,
  active         VARCHAR(1) DEFAULT ''                   NOT NULL,
  display_order  SMALLINT                                NULL,
  created_by     VARCHAR(64)                             NOT NULL,
  created_when   TIMESTAMP DEFAULT '0000-00-00 00:00:00' NOT NULL,
  updated_by     VARCHAR(64),
  updated_when   TIMESTAMP
)
  ENGINE =InnoDB;
CREATE UNIQUE INDEX idx_unq_sys_menu_item_menu_item_name ON sys_menu_item (menu_item_name);
CREATE INDEX idx_sys_menu_item_menu_item_name ON sys_menu_item (menu_item_name);


# **** sys_resource **** #
DROP TABLE IF EXISTS sys_resource;
CREATE TABLE sys_resource
(
  id           BIGINT PRIMARY KEY                      NOT NULL AUTO_INCREMENT,
  resource     VARCHAR(64)                             NOT NULL,
  permission   VARCHAR(200) DEFAULT ''                 NOT NULL,
  active       VARCHAR(1) DEFAULT ''                   NOT NULL,
  created_by   VARCHAR(64)                             NOT NULL,
  created_when TIMESTAMP DEFAULT '0000-00-00 00:00:00' NOT NULL,
  updated_by   VARCHAR(64),
  updated_when TIMESTAMP
)
  ENGINE =InnoDB;
CREATE UNIQUE INDEX idx_unq_sys_resource_resource ON sys_resource (resource);
CREATE INDEX idx_sys_resource_resource ON sys_resource (resource);


# **** sys_dept **** #
DROP TABLE IF EXISTS sys_dept;
CREATE TABLE sys_dept
(
  id             BIGINT PRIMARY KEY                      NOT NULL AUTO_INCREMENT,
  dept_name      VARCHAR(64)                             NOT NULL,
  dept_desc      VARCHAR(200) DEFAULT ''                 NOT NULL,
  active         VARCHAR(1) DEFAULT ''                   NOT NULL,
  parent_dept_id BIGINT,
  created_by     VARCHAR(64)                             NOT NULL,
  created_when   TIMESTAMP DEFAULT '0000-00-00 00:00:00' NOT NULL,
  updated_by     VARCHAR(64),
  updated_when   TIMESTAMP
)
  ENGINE =InnoDB;
CREATE UNIQUE INDEX idx_unq_sys_dept_dept_name ON sys_dept (dept_name);
CREATE INDEX idx_sys_dept_dept_name ON sys_dept (dept_name);


# **** sys_role **** #
DROP TABLE IF EXISTS sys_role;
CREATE TABLE sys_role
(
  id             BIGINT PRIMARY KEY                      NOT NULL AUTO_INCREMENT,
  role_name      VARCHAR(64)                             NOT NULL,
  role_desc      VARCHAR(200) DEFAULT ''                 NOT NULL,
  active         VARCHAR(1) DEFAULT ''                   NOT NULL,
  parent_role_id BIGINT,
  created_by     VARCHAR(64)                             NOT NULL,
  created_when   TIMESTAMP DEFAULT '0000-00-00 00:00:00' NOT NULL,
  updated_by     VARCHAR(64),
  updated_when   TIMESTAMP
)
  ENGINE =InnoDB;
CREATE UNIQUE INDEX idx_unq_sys_role_role_name ON sys_role (role_name);
CREATE INDEX idx_sys_role_role_name ON sys_role (role_name);


# **** sys_dept_role **** #
DROP TABLE IF EXISTS sys_dept_role;
CREATE TABLE sys_dept_role
(
  id      BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  dept_id BIGINT,
  role_id BIGINT
)
  ENGINE =InnoDB;


# **** sys_user **** #
DROP TABLE IF EXISTS sys_user;
CREATE TABLE sys_user
(
  id               BIGINT PRIMARY KEY                      NOT NULL AUTO_INCREMENT,
  login_name       VARCHAR(64)                             NOT NULL,
  nice_name        VARCHAR(64) DEFAULT ''                  NOT NULL,
  password         VARCHAR(255)                            NOT NULL,
  email            VARCHAR(100)                            NOT NULL,
  salt             VARCHAR(64)                             NOT NULL,
  roles            VARCHAR(255)                            NOT NULL,
  register_date    TIMESTAMP DEFAULT '0000-00-00 00:00:00' NOT NULL,
  status_code      INT DEFAULT 0                           NOT NULL,
  act_key          VARCHAR(60) DEFAULT ''                  NOT NULL,
  act_key_gen_date TIMESTAMP DEFAULT '0000-00-00 00:00:00' NOT NULL,
  act_date         TIMESTAMP DEFAULT '0000-00-00 00:00:00' NOT NULL,
  created_by       VARCHAR(64)                             NOT NULL,
  created_when     TIMESTAMP DEFAULT '0000-00-00 00:00:00' NOT NULL,
  updated_by       VARCHAR(64),
  updated_when     TIMESTAMP
)
  ENGINE =InnoDB;
CREATE UNIQUE INDEX idx_unq_sys_user_login_name ON sys_user (login_name);
CREATE INDEX idx_sys_user_login_name ON sys_user (login_name);
CREATE INDEX idx_sys_user_nice_name ON sys_user (nice_name);