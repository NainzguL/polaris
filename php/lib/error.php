<?php
/**
 * Stop the processing an respond a html 500 Internal Server Error
 * And then call exist
 */
function reponse500InternalError($errorMsg) {
    header("HTTP/1.1 500 Internal Server Error");
    echo $errorMsg;
    exit();
}
?>