#!/bin/bash

mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS polaris;"
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "CREATE USER IF NOT EXISTS 'php_user'@'%' IDENTIFIED BY '$(< $PHP_DB_PASSWORD_FILE)';"
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "GRANT SELECT, INSERT, UPDATE, DELETE ON polaris.* TO 'php_user'@'%';"
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"