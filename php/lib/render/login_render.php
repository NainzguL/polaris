<?php

require_once('render/render_engine.php');

define ("Status_NewAcount" , 0);
define ("Status_SucessfullyCreated" , 1);
define ("Status_FormInvalid" , 2);
define ("Status_NewConnexion" , 3);
define ("Status_ConnexionFail" , 4);

class LoginRender extends RenderEngine {
    
    protected $errors = array();
    protected $creationStatus = Status_NewAcount;
    protected $additionalInfoHtml = "";
    
    public function addErrorDecription($err) {
        array_push($this->errors, $err);
    }
    
    public function setStatus($status) {
        $this->creationStatus = $status;
        switch ($this->creationStatus) {
            case Status_NewAcount:
            case Status_FormInvalid:
                $this->setTitle("Nouveau compte");
                break;
            case Status_NewConnexion:
            case Status_ConnexionFail:
            case Status_SucessfullyCreated:
                $this->setTitle("Connexion");
                break;
        }
    }
    
    public function getAdditionalInfoHtml() {
        return $this->additionalInfoHtml;
    }
    
    public function hasError() {
        return !empty($this->errors);
    }
    
    public function renderPage() {
        switch ($this->creationStatus) {
            case Status_NewAcount:
                include "new_account.phtml";
                break;
            case Status_SucessfullyCreated:
                $this->additionalInfoHtml = "<p>Création réussi. Vous pouvez maitetnant vous connecter</p>";
                include "login.phtml";
                break;
            case Status_FormInvalid:
                $this->additionalInfoHtml = "";
                foreach ($this->errors as &$err) {
                    $this->additionalInfoHtml = $this->additionalInfoHtml.'<div class="alert alert-danger" role="alert">'.$err.'</div>';
                }
                include "new_account.phtml";
                break;
            case Status_NewConnexion:
                include "login.phtml";
                break;
            case Status_ConnexionFail:
                $this->additionalInfoHtml = "";
                foreach ($this->errors as &$err) {
                    $this->additionalInfoHtml = $this->additionalInfoHtml.'<div class="alert alert-danger" role="alert">'.$err.'</div>';
                }
                include "login.phtml";
                break;
        }
    }
}
?>