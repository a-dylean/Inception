-- USE mysql;
-- FLUSH PRIVILEGES;
-- DELETE FROM     mysql.user WHERE User='';
-- DROP DATABASE test;
-- DELETE FROM mysql.db WHERE Db='test';
-- DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
-- ALTER USER 'root'@'localhost' IDENTIFIED BY '123123';
-- CREATE DATABASE db CHARACTER SET utf8 COLLATE utf8_general_ci;
-- CREATE USER 'atonkopi'@'%' IDENTIFIED by '123123';
-- GRANT ALL PRIVILEGES ON db.* TO 'atonkopi'@'%';
-- FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS db;
CREATE USER IF NOT EXISTS 'atonkopi'@'%' IDENTIFIED BY '123123';
GRANT ALL PRIVILEGES ON db.* TO 'atonkopi'@'%';
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY '12312345';