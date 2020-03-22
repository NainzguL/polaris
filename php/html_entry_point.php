<?php

require_once('config.php');

/**
 * This script is the enrty point for the dynamic web page.
 */

function error404()
{
    header("HTTP/1.1 404 Not Found");
    echo 'page not page';
    exit();
}

$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$uri = explode( '/', $uri );

$webPageToLoad = "";
//check for index of index.php
if (strcmp($_SERVER['REQUEST_URI'],"/") == 0 || $uri[1] == 'index.php' 
    || $uri[1] == 'index.html' || $uri[1] == 'index.html') {
    $webPageToLoad = "character_sheet.php";
}
else {
    /* the last element of the URI must end by ".php". This may be change in the future. */
    $last = $uri[count($uri)-1];
    $lengthPhp = strlen(".php");
    if (!substr($last, -$lengthPhp) === ".php") {
        error404();
    }
    $uri[count($uri)-1] = substr($last, 0, -$lengthPhp);
    
    /*security check, only alphanumeric and"_" char are allowed.
     * In partiular "." is not allowed in order to prevent URL like "/../lib/". */
    foreach ($uri as $part) {
        if (!empty($part)) {
            if(preg_match("/^[a-zA-Z0-9_]+$/", $part) != 1) {
                error404();
            }
            $webPageToLoad = $webPageToLoad . "/" .$part;
        }
    }
    $webPageToLoad =  $webPageToLoad . ".php";
}

$webPageToLoad = "web_page/" . $webPageToLoad;
if (!file_exists($webPageToLoad)) {
    error404();
}

//session
require_once('user_session.php');
session_start();

include $webPageToLoad;


?>

