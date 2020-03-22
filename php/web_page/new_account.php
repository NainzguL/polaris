<?php

require_once('render/login_render.php');
require_once('db.php');
require_once('error.php');
require_once('user.php');


$t = new LoginRender();
$t->setStatus(Status_NewAcount);

if($_SERVER["REQUEST_METHOD"] == "POST"){
    
    $conn = createNewDbconnect();
    
    // Validate mail
    $mailValide = false;
    $mail = trim($_POST["email"]);
    if (empty($mail)) {
        $t->addErrorDecription("Le champs E-Mail ne doit pas être vide.");
    } else if(!filter_var($mail, FILTER_VALIDATE_EMAIL)){
        $t->addErrorDecription("L'e-mail n'est pas valide.");
    } else {
        $sql = "SELECT id FROM User WHERE mail = ?";
        
        $stmt = $conn->prepare($sql);
        if ($stmt) {
            $stmt->bind_param("s", $param_mail);
            $param_mail = $mail;
            
            if($stmt->execute()){
                $stmt->store_result();
                if($stmt->num_rows == 1){
                    $t->addErrorDecription("Il exist déjà un utilisateur pour l'e-mail ".$mail.".");
                } else{
                    $mailValide = true;
                }
            } else{
                reponse500InternalError("stmt->execute() fail; sql:" . $sql);
                exit();
            }
            $stmt->close();
        }
        else {
            reponse500InternalError("mysqli_prepare fail; sql: " . $sql." error: ". htmlspecialchars($conn->error));
            exit();
        }
    }
    
    // Validate pseudo
    $pseudoValide = false;
    $pseudo = trim($_POST["pseudo"]);
    if (empty($pseudo)){
        $t->addErrorDecription("Le champs pseudonyme ne doit pas être vide.");
    }
    else if(preg_match("/^[a-zA-Z0-9_]+$/", $pseudo) != 1) {
        $t->addErrorDecription("Le champs pseudonyme doit contnir que des caracter alphanumeric ou _.");
    }
    else {
        $pseudoValide = true;
    }
    
    // Validate password
    $passwordValide = false;
    $password = $_POST["password"];
    if (empty($password)){
        $t->addErrorDecription("Le champs mot de passe ne doit pas être vide.");
    } elseif(strlen(trim($_POST["password"])) < 6){
        $t->addErrorDecription("Le mot de passe doit avoir au moins 6 caractères.");
    } else{
        $passwordConfirm = $_POST["password-confimation"];
        if($password != $passwordConfirm) {
            $t->addErrorDecription("Les mot de passe ne correspond pas.");
        }
        else {
            $passwordValide = true;
        }
    }
    
    //Check ok condition
    $conditonOk = false;
    if(isset($_POST['conditon-ok']) && $_POST['conditon-ok'] == 'yes') {
        $conditonOk = true;
    }
    else {
        $t->addErrorDecription("Vous devez accepter les condition d'utilisation du site.");
    }
    
    // Check input errors before inserting in database
    if($mailValide && $pseudoValide && $passwordValide && $conditonOk){
        if (addUser($conn, $mail, $pseudo, $password)) {
            $t->setStatus(Status_SucessfullyCreated);
        }
        else {
            $t->addErrorDecription("Une erreur est survenue lors de la création du compte. Veuilliez contacter l'administrateur du site.");
        }
    }
    
    $conn->close();
}

if ($t->hasError()) {
    $t->setStatus(Status_FormInvalid);
}

$t->renderHtmlTop();
$t->renderPage();
$t->renderHtmlBottom();
?>


