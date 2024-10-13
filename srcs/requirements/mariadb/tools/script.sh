#!/bin/bash

mysql_install_db
mysqld_safe --init-file=/etc/mysql/init.sql
