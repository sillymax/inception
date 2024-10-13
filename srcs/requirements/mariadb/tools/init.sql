CREATE DATABASE wordpress;
CREATE USER 'db_superuser'@'%' IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON wordpress . * TO 'db_superuser'@'%';
FLUSH PRIVILEGES;
