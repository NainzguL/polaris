#!/bin/bash

openssl rand -base64 20 > db_root_pwd.txt
openssl rand -base64 20 > php_db_pwd.txt