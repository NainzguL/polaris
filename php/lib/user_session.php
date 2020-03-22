<?php
/**
 * 
 * @return true if the user is login
 */
function isUserLogIn() {
    return isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true;
}

function setUpSession($mail, $pseudo) {
    $_SESSION["loggedin"] = true;
    $_SESSION["mail"] = $mail;
    $_SESSION["pseudo"] = $pseudo;
}

function getLoggedUseMail() {
    return isset($_SESSION["mail"]) ? $_SESSION["mail"] : "";
}

function getLoggedUsePseudo() {
    return isset($_SESSION["pseudo"]) ? $_SESSION["pseudo"] : "";
}

?>