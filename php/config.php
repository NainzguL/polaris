<?php

/**
 * @var array $config the configuraion of the database
 */
$config = array(
    "db" => array(
        "dbname" => "polaris",
        "user" => "php_user",
        "pwd_file" => "/run/secrets/php_db_pwd",
        "host" => "db"
    )
);

set_include_path(get_include_path() . PATH_SEPARATOR . realpath(dirname(__FILE__) . '/lib'));

/*
 Error reporting.
 */
ini_set("error_reporting", "true");
error_reporting(E_ALL|E_STRCT);

?>