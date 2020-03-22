<?php

require_once('config.php');

/**
 * This script is the enrty point for the crud. All url that start by /crud/ must be routted to this script.
 * This script will perform some security check and it will then include the queried crud php file form the folder crud.
 */

header("Content-Type: application/json; charset=UTF-8");
/*
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: OPTIONS,GET,POST,PUT,DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
*/

$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$uri = explode( '/', $uri );

// all of our endpoints start with /crud
// everything else results in a 404 Not Found
if (!isset($uri[1]) || $uri[1] !== 'crud') {
    header("HTTP/1.1 404 Not Found");
    echo '{"error": "url must strat with /crud/"}';
    exit();
}

if (!isset($uri[2])) {
    header("HTTP/1.1 404 Not Found");
    echo '{"error": "no crud specify"}';
    exit();
}

/*security check, for now only alphanumeric char are allowed. 
 * In partiular "." is not allowed in order to prevent rurl like "/crud/..". 
 * For now no search in subdirectory are done, this may be change in the future*/
if(preg_match("/^[a-zA-Z0-9]+$/", $uri[2]) != 1) {
    header("HTTP/1.1 404 Not Found");
    echo '{"error": "crud not found"}';
    exit();
}

$fileToLoad = realpath(dirname(__FILE__)) . "/crud/" . $uri[2] . ".php";
if (!file_exists($fileToLoad)) {
    header("HTTP/1.1 404 Not Found");
    echo '{"error": "crud not found"}';
    exit();
}

include $fileToLoad;

?>