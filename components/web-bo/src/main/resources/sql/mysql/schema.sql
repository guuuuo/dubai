DROP TABLE IF EXISTS sys_module;
DROP TABLE IF EXISTS sys_menu_group;
DROP TABLE IF EXISTS sys_menu_item;
DROP TABLE IF EXISTS sys_resource;
DROP TABLE IF EXISTS sys_dept;
DROP TABLE IF EXISTS sys_role;
DROP TABLE IF EXISTS sys_dept_role;
DROP TABLE IF EXISTS sys_user;
DROP TABLE IF EXISTS sys_option;
DROP TABLE IF EXISTS dubai_post;

CREATE TABLE sys_module
(
  id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  module_code VARCHAR(32) NOT NULL,
  module_name VARCHAR(64) NOT NULL,
  module_desc VARCHAR(200) DEFAULT '' NOT NULL,
  url VARCHAR(200) DEFAULT '' NOT NULL,
  i18n_key VARCHAR(200) DEFAULT '' NOT NULL,
  active VARCHAR(1) DEFAULT '' NOT NULL,
  display_order SMALLINT NULL,
  created_by VARCHAR(64) NOT NULL,
  created_when TIMESTAMP DEFAULT '0000-00-00 00:00:00' NOT NULL,
  updated_by VARCHAR(64),
  updated_when TIMESTAMP
)
  ENGINE =InnoDB;

CREATE TABLE sys_menu_group
(
  id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  module_id BIGINT NOT NULL,
  menu_group_name VARCHAR(64) NOT NULL,
  menu_group_desc VARCHAR(200) DEFAULT '' NOT NULL,
  url VARCHAR(200) DEFAULT '' NOT NULL,
  i18n_key VARCHAR(200) DEFAULT '' NOT NULL,
  active VARCHAR(1) DEFAULT '' NOT NULL,
  display_order SMALLINT NULL,
  created_by VARCHAR(64) NOT NULL,
  created_when TIMESTAMP DEFAULT '0000-00-00 00:00:00' NOT NULL,
  updated_by VARCHAR(64),
  updated_when TIMESTAMP
)
  ENGINE =InnoDB;


CREATE TABLE sys_menu_item
(
  id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  menu_group_id BIGINT NOT NULL,
  menu_item_name VARCHAR(64) NOT NULL,
  menu_item_desc VARCHAR(200) DEFAULT '' NOT NULL,
  url VARCHAR(200) DEFAULT '' NOT NULL,
  i18n_key VARCHAR(200) DEFAULT '' NOT NULL,
  active VARCHAR(1) DEFAULT '' NOT NULL,
  display_order SMALLINT NULL,
  created_by VARCHAR(64) NOT NULL,
  created_when TIMESTAMP DEFAULT '0000-00-00 00:00:00' NOT NULL,
  updated_by VARCHAR(64),
  updated_when TIMESTAMP
)
  ENGINE =InnoDB;

CREATE TABLE sys_resource
(
  id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  resource VARCHAR(64) NOT NULL,
  permission VARCHAR(200) DEFAULT '' NOT NULL,
  active VARCHAR(1) DEFAULT '' NOT NULL,
  created_by VARCHAR(64) NOT NULL,
  created_when TIMESTAMP DEFAULT '0000-00-00 00:00:00' NOT NULL,
  updated_by VARCHAR(64),
  updated_when TIMESTAMP
)
  ENGINE =InnoDB;
CREATE UNIQUE INDEX idx_unq_sys_resource_resource ON sys_resource ( resource );
CREATE INDEX idx_sys_resource_resource ON sys_resource ( resource );

CREATE TABLE sys_dept
(
  id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  dept_name VARCHAR(64) NOT NULL,
  dept_desc VARCHAR(200) DEFAULT '' NOT NULL,
  active VARCHAR(1) DEFAULT '' NOT NULL,
  parent_dept_id BIGINT,
  created_by VARCHAR(64) NOT NULL,
  created_when TIMESTAMP DEFAULT '0000-00-00 00:00:00' NOT NULL,
  updated_by VARCHAR(64),
  updated_when TIMESTAMP
)
  ENGINE =InnoDB;
CREATE UNIQUE INDEX idx_unq_sys_dept_dept_name ON sys_dept ( dept_name );
CREATE INDEX idx_sys_dept_dept_name ON sys_dept ( dept_name );

CREATE TABLE sys_role
(
  id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  role_name VARCHAR(64) NOT NULL,
  role_desc VARCHAR(200) DEFAULT '' NOT NULL,
  active VARCHAR(1) DEFAULT '' NOT NULL,
  parent_role_id BIGINT,
  created_by VARCHAR(64) NOT NULL,
  created_when TIMESTAMP DEFAULT '0000-00-00 00:00:00' NOT NULL,
  updated_by VARCHAR(64),
  updated_when TIMESTAMP
)
  ENGINE =InnoDB;
CREATE UNIQUE INDEX idx_unq_sys_role_role_name ON sys_role ( role_name );
CREATE INDEX idx_sys_role_role_name ON sys_role ( role_name );


CREATE TABLE sys_dept_role
(
  id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  dept_id BIGINT,
  role_id BIGINT
)
  ENGINE =InnoDB;


CREATE TABLE sys_user
(
  id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  login_name VARCHAR(64) NOT NULL,
  nice_name VARCHAR(64) DEFAULT '' NOT NULL,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(100) NOT NULL,
  salt VARCHAR(64) NOT NULL,
  roles VARCHAR(255) NOT NULL,
  register_date TIMESTAMP DEFAULT '0000-00-00 00:00:00' NOT NULL,
  status_code INT DEFAULT 0 NOT NULL,
  act_key VARCHAR(60) DEFAULT '' NOT NULL,
  act_key_gen_date TIMESTAMP DEFAULT '0000-00-00 00:00:00' NOT NULL,
  act_date TIMESTAMP DEFAULT '0000-00-00 00:00:00' NOT NULL,
  created_by VARCHAR(64) NOT NULL,
  created_when TIMESTAMP DEFAULT '0000-00-00 00:00:00' NOT NULL,
  updated_by VARCHAR(64),
  updated_when TIMESTAMP
)
  ENGINE =InnoDB;
CREATE UNIQUE INDEX idx_unq_sys_user_login_name ON sys_user ( login_name );
CREATE INDEX idx_sys_user_login_name ON sys_user ( login_name );
CREATE INDEX idx_sys_user_nice_name ON sys_user ( nice_name );

CREATE TABLE sys_option
(
  id       BIGINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name     VARCHAR(64) DEFAULT ''      NOT NULL,
  value    LONGTEXT                    NOT NULL,
  autoload VARCHAR(20) DEFAULT 'yes'   NOT NULL,
  created_by VARCHAR(64) NOT NULL,
  created_when TIMESTAMP DEFAULT '0000-00-00 00:00:00' NOT NULL,
  updated_by VARCHAR(64),
  updated_when TIMESTAMP
)
  ENGINE =InnoDB;
CREATE UNIQUE INDEX idx_unq_option_name ON sys_option (name);

CREATE TABLE dubai_post
(
  ID                    BIGINT UNSIGNED PRIMARY KEY            NOT NULL AUTO_INCREMENT,
  author                BIGINT UNSIGNED DEFAULT 0              NOT NULL,
  create_date           DATETIME DEFAULT '0000-00-00 00:00:00' NOT NULL,
  post_content LONGTEXT NOT NULL,
  post_title            LONGTEXT                               NOT NULL,
  excerpt               LONGTEXT                               NOT NULL,
  post_status           VARCHAR(20) DEFAULT 'publish'          NOT NULL,
  comment_status        VARCHAR(20) DEFAULT 'open'             NOT NULL,
  ping_status           VARCHAR(20) DEFAULT 'open'             NOT NULL,
  post_password         VARCHAR(20) DEFAULT ''                 NOT NULL,
  post_name             VARCHAR(200) DEFAULT ''                NOT NULL,
  to_ping               LONGTEXT                               NOT NULL,
  pinged                LONGTEXT                               NOT NULL,
  update_date           DATETIME DEFAULT '0000-00-00 00:00:00' NOT NULL,
  post_content_filtered LONGTEXT                               NOT NULL,
  post_parent           BIGINT UNSIGNED DEFAULT 0              NOT NULL,
  guid                  VARCHAR(255) DEFAULT ''                NOT NULL,
  comment_count         BIGINT DEFAULT 0                       NOT NULL,
  created_by VARCHAR(64) NOT NULL,
  created_when TIMESTAMP DEFAULT '0000-00-00 00:00:00' NOT NULL,
  updated_by VARCHAR(64),
  updated_when TIMESTAMP
)
  ENGINE =InnoDB;
CREATE INDEX idx_post_name ON dubai_post (post_name);
CREATE INDEX idx_post_status_date ON dubai_post (post_status, create_date, ID);
CREATE INDEX idx_post_parent ON dubai_post (post_parent);
CREATE INDEX idx_post_author ON dubai_post (author);

