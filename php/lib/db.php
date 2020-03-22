<?php
/**
 * This function return a coonection to the db (mysqli). It throw an exetion if the connection fails 
 */
function createNewDbconnect() {
    
    global $config;
    
    $host = $config["db"]["host"];
    $user = $config["db"]["user"];
    $db_name = $config["db"]["dbname"];
    $pwd = file_get_contents($config["db"]["pwd_file"], true);
    if ($pwd === false) {
        throw new Exception('Fail to read password in'.$pwd_file);
    }
    
    $conn = new mysqli($host, $user, $pwd, $db_name);
    if ($conn->connect_error) {
        throw new Exception("Connection failed: " . $conn->connect_error);
    }
    
    return $conn;
}
?>