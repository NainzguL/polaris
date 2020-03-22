<?php

require_once('render/login_render.php');
require_once('error.php');
require_once('db.php');
require_once('user.php');

if (isUserLogIn())
{
    header("location: index.php");
    exit;
}

$t = new LoginRender();
$t->setStatus(Status_NewConnexion);

if($_SERVER["REQUEST_METHOD"] == "POST"){
    
    // validate mail
    $mailValide = false;
    $mail = trim($_POST["email"]);
    if (empty($mail)) {
        $t->addErrorDecription("Veuillez fournir votre email.");
    } else if(!filter_var($mail, FILTER_VALIDATE_EMAIL)){
        $t->addErrorDecription("L'e-mail n'est pas valide.");
    } else {
        $mailValide = true;
    }
    
    //check password
    $passwordValide = false;
    $password = $_POST["password"];
    if (empty($password)){
        $t->addErrorDecription("Veuillez fournir votre mot de pass.");
    } else{
        $passwordValide = true;
    }
    
    // Validate credentials
    $conn = createNewDbconnect();
    if($mailValide && $passwordValide){
        if (validateCredentialsAndLogin($conn, $mail, $password)) {
            header("location: index.php");
            exit();
        }
        else {
            $t->addErrorDecription("Le mot de passe ou l'email est invalide");
        }
    }
    
    $conn->close();
}

if ($t->hasError()) {
    $t->setStatus(Status_ConnexionFail);
}

$t->renderHtmlTop();
$t->renderPage();
$t->renderHtmlBottom();
?>


