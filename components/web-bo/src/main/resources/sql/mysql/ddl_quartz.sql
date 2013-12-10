#
# in your quartz properties file, you'll need to set 
# org.quartz.jobstore.driverdelegateclass = org.quartz.impl.jdbcjobstore.stdjdbcdelegate
#
#
# by: ron cordell - roncordell
#  i didn't see this anywhere, so i thought i'd post it here. this is the script from quartz to create the tables in a mysql database, modified to use innodb instead of myisam.

DROP TABLE IF EXISTS QRTZ_JOB_LISTENERS;
DROP TABLE IF EXISTS QRTZ_TRIGGER_LISTENERS;
DROP TABLE IF EXISTS QRTZ_FIRED_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_PAUSED_TRIGGER_GRPS;
DROP TABLE IF EXISTS QRTZ_SCHEDULER_STATE;
DROP TABLE IF EXISTS QRTZ_LOCKS;
DROP TABLE IF EXISTS QRTZ_SIMPLE_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_CRON_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_BLOB_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_JOB_DETAILS;
DROP TABLE IF EXISTS QRTZ_CALENDARS;

CREATE TABLE QRTZ_JOB_DETAILS (
  job_name          VARCHAR(200) NOT NULL,
  job_group         VARCHAR(200) NOT NULL,
  description       VARCHAR(250) NULL,
  job_class_name    VARCHAR(250) NOT NULL,
  is_durable        VARCHAR(1)   NOT NULL,
  is_volatile       VARCHAR(1)   NOT NULL,
  is_stateful       VARCHAR(1)   NOT NULL,
  requests_recovery VARCHAR(1)   NOT NULL,
  job_data          BLOB         NULL,
  PRIMARY KEY (job_name, job_group))
  ENGINE =innodb;

CREATE TABLE QRTZ_JOB_LISTENERS (
  job_name     VARCHAR(200) NOT NULL,
  job_group    VARCHAR(200) NOT NULL,
  job_listener VARCHAR(200) NOT NULL,
  PRIMARY KEY (job_name, job_group, job_listener),
  INDEX (job_name, job_group),
  FOREIGN KEY (job_name, job_group)
  REFERENCES QRTZ_JOB_DETAILS (job_name, job_group))
  ENGINE =innodb;

CREATE TABLE QRTZ_TRIGGERS (
  trigger_name   VARCHAR(200) NOT NULL,
  trigger_group  VARCHAR(200) NOT NULL,
  job_name       VARCHAR(200) NOT NULL,
  job_group      VARCHAR(200) NOT NULL,
  is_volatile    VARCHAR(1)   NOT NULL,
  description    VARCHAR(250) NULL,
  next_fire_time BIGINT(13)   NULL,
  prev_fire_time BIGINT(13)   NULL,
  priority       INTEGER      NULL,
  trigger_state  VARCHAR(16)  NOT NULL,
  trigger_type   VARCHAR(8)   NOT NULL,
  start_time     BIGINT(13)   NOT NULL,
  end_time       BIGINT(13)   NULL,
  calendar_name  VARCHAR(200) NULL,
  misfire_instr  SMALLINT(2)  NULL,
  job_data       BLOB         NULL,
  PRIMARY KEY (trigger_name, trigger_group),
  INDEX (job_name, job_group),
  FOREIGN KEY (job_name, job_group)
  REFERENCES QRTZ_JOB_DETAILS (job_name, job_group))
  ENGINE =innodb;

CREATE TABLE QRTZ_SIMPLE_TRIGGERS (
  trigger_name    VARCHAR(200) NOT NULL,
  trigger_group   VARCHAR(200) NOT NULL,
  repeat_count    BIGINT(7)    NOT NULL,
  repeat_interval BIGINT(12)   NOT NULL,
  times_triggered BIGINT(10)   NOT NULL,
  PRIMARY KEY (trigger_name, trigger_group),
  INDEX (trigger_name, trigger_group),
  FOREIGN KEY (trigger_name, trigger_group)
  REFERENCES QRTZ_TRIGGERS (trigger_name, trigger_group))
  ENGINE =innodb;

CREATE TABLE QRTZ_CRON_TRIGGERS (
  trigger_name    VARCHAR(200) NOT NULL,
  trigger_group   VARCHAR(200) NOT NULL,
  cron_expression VARCHAR(120) NOT NULL,
  time_zone_id    VARCHAR(80),
  PRIMARY KEY (trigger_name, trigger_group),
  INDEX (trigger_name, trigger_group),
  FOREIGN KEY (trigger_name, trigger_group)
  REFERENCES QRTZ_TRIGGERS (trigger_name, trigger_group))
  ENGINE =innodb;

CREATE TABLE QRTZ_BLOB_TRIGGERS (
  trigger_name  VARCHAR(200) NOT NULL,
  trigger_group VARCHAR(200) NOT NULL,
  blob_data     BLOB         NULL,
  PRIMARY KEY (trigger_name, trigger_group),
  INDEX (trigger_name, trigger_group),
  FOREIGN KEY (trigger_name, trigger_group)
  REFERENCES QRTZ_TRIGGERS (trigger_name, trigger_group))
  ENGINE =innodb;

CREATE TABLE QRTZ_TRIGGER_LISTENERS (
  trigger_name     VARCHAR(200) NOT NULL,
  trigger_group    VARCHAR(200) NOT NULL,
  trigger_listener VARCHAR(200) NOT NULL,
  PRIMARY KEY (trigger_name, trigger_group, trigger_listener),
  INDEX (trigger_name, trigger_group),
  FOREIGN KEY (trigger_name, trigger_group)
  REFERENCES QRTZ_TRIGGERS (trigger_name, trigger_group))
  ENGINE =innodb;

CREATE TABLE QRTZ_CALENDARS (
  calendar_name VARCHAR(200) NOT NULL,
  calendar      BLOB         NOT NULL,
  PRIMARY KEY (calendar_name))
  ENGINE =innodb;

CREATE TABLE QRTZ_PAUSED_TRIGGER_GRPS (
  trigger_group VARCHAR(200) NOT NULL,
  PRIMARY KEY (trigger_group))
  ENGINE =innodb;

CREATE TABLE QRTZ_FIRED_TRIGGERS (
  entry_id          VARCHAR(95)  NOT NULL,
  trigger_name      VARCHAR(200) NOT NULL,
  trigger_group     VARCHAR(200) NOT NULL,
  is_volatile       VARCHAR(1)   NOT NULL,
  instance_name     VARCHAR(200) NOT NULL,
  fired_time        BIGINT(13)   NOT NULL,
  priority          INTEGER      NOT NULL,
  state             VARCHAR(16)  NOT NULL,
  job_name          VARCHAR(200) NULL,
  job_group         VARCHAR(200) NULL,
  is_stateful       VARCHAR(1)   NULL,
  requests_recovery VARCHAR(1)   NULL,
  PRIMARY KEY (entry_id))
  ENGINE =innodb;

CREATE TABLE QRTZ_SCHEDULER_STATE (
  instance_name     VARCHAR(200) NOT NULL,
  last_checkin_time BIGINT(13)   NOT NULL,
  checkin_interval  BIGINT(13)   NOT NULL,
  PRIMARY KEY (instance_name))
  ENGINE =innodb;

CREATE TABLE QRTZ_LOCKS (
  lock_name VARCHAR(40) NOT NULL,
  PRIMARY KEY (lock_name))
  ENGINE =innodb;

INSERT INTO QRTZ_LOCKS VALUES ('trigger_access');
INSERT INTO QRTZ_LOCKS VALUES ('job_access');
INSERT INTO QRTZ_LOCKS VALUES ('calendar_access');
INSERT INTO QRTZ_LOCKS VALUES ('state_access');
INSERT INTO QRTZ_LOCKS VALUES ('misfire_access');
COMMIT;
