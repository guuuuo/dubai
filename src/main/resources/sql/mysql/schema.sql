DROP TABLE IF EXISTS dubai_task;
DROP TABLE IF EXISTS dubai_user;
DROP TABLE IF EXISTS dubai_option;
DROP TABLE IF EXISTS dubai_post;

CREATE TABLE dubai_task (
  id          BIGINT AUTO_INCREMENT,
  title       VARCHAR(128) NOT NULL,
  description VARCHAR(255),
  user_id     BIGINT       NOT NULL,
  PRIMARY KEY (id)
)
  ENGINE =InnoDB;

CREATE TABLE dubai_user (
  id             BIGINT AUTO_INCREMENT,
  login_name     VARCHAR(64)                        NOT NULL UNIQUE,
  nice_name      VARCHAR(64)                        NOT NULL DEFAULT '',
  password       VARCHAR(255)                       NOT NULL,
  email          VARCHAR(100)                       NOT NULL,
  salt           VARCHAR(64)                        NOT NULL,
  roles          VARCHAR(255)                       NOT NULL,
  register_date  TIMESTAMP                          NOT NULL DEFAULT 0,
  activation_key VARCHAR(60)                        NOT NULL DEFAULT '',
  status_code         INT DEFAULT 0                      NOT NULL,
  PRIMARY KEY (id)
)
  ENGINE =InnoDB;
CREATE INDEX user_login_name ON dubai_user (login_name);
CREATE INDEX user_nice_name ON dubai_user (nice_name);

CREATE TABLE dubai_option
(
  id       BIGINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name     VARCHAR(64) DEFAULT ''      NOT NULL,
  value    LONGTEXT                    NOT NULL,
  autoload VARCHAR(20) DEFAULT 'yes'   NOT NULL
)
  ENGINE =InnoDB;
CREATE UNIQUE INDEX option_name ON dubai_option (name);

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
  comment_count         BIGINT DEFAULT 0                       NOT NULL
)
  ENGINE =InnoDB;
CREATE INDEX post_name ON dubai_post (post_name);
CREATE INDEX post_status_date ON dubai_post (post_status, create_date, ID);
CREATE INDEX post_parent ON dubai_post (post_parent);
CREATE INDEX post_author ON dubai_post (author);

