#!/bin/bash

mysql -uroot -p"$(< /run/secrets/db_root_pwd)" -e "CREATE DATABASE IF NOT EXISTS polaris;"
mysql -uroot -p"$(< /run/secrets/db_root_pwd)" -e "CREATE USER IF NOT EXISTS 'php_user'@'%' IDENTIFIED BY '$(< /run/secrets/php_db_pwd)';"
mysql -uroot -p"$(< /run/secrets/db_root_pwd)" -e "GRANT SELECT, INSERT, UPDATE, DELETE ON polaris.* TO 'php_user'@'%';"
mysql -uroot -p"$(< /run/secrets/db_root_pwd)" -e "FLUSH PRIVILEGES;"
