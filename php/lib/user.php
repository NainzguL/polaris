<?php

require_once('user_session.php');

function hashPwd($pwd) {
    return password_hash($pwd, PASSWORD_BCRYPT);
}

/**
 * Add an user
 * @return true if succes full, false else
 */
function addUser($dbConn, $mail, $pseudo, $pwd) {
    $sql = "INSERT INTO User (mail, pseudo, mdp_hash) VALUES (?, ?, ?)";
    $stmt =  $dbConn->prepare($sql);
    if ($stmt) {
        $mdp_hash = hashPwd($pwd);
        
        $stmt->bind_param("sss", $param_mail, $param_pseudo, $param_mdp_hash);
        $param_mail = $mail;
        $param_pseudo = $pseudo;
        $param_mdp_hash = $mdp_hash;
        
        // Attempt to execute the prepared statement
        if($stmt->execute()){
            $stmt->close();
            return true;
        }
        $stmt->close();
    }
    return false;
}

/**
 * Validate the given credential and set up the seesion if the credential match
 * 
 * @return true user was suceffuly login
 */
function validateCredentialsAndLogin($dbConn, $mail, $pwd) {
    $sql = "SELECT mail, pseudo, mdp_hash FROM User WHERE mail = ?";
    $stmt =  $dbConn->prepare($sql);
    if ($stmt) {
        $stmt->bind_param("s", $param_mail);
        $param_mail = $mail;
                
        if($stmt->execute()){
            $stmt->store_result();
            if($stmt->num_rows == 1){
                $stmt->bind_result($mailFromDb, $pseudo, $hashed_password);
                if($stmt->fetch()){
                    if(password_verify($pwd, $hashed_password)){
                        // Store data in session variables
                        setUpSession($mailFromDb, $pseudo);
                        $stmt->close();
                        return true;
                    } else{
                        //echo "Debug: The password you entered was not valid.";
                    }
                }
            } else{
                //echo "Debug: No account found with that username.";
            }
        } else{
            //echo "Debug: sql fail ".$sql;
        }
        $stmt->close();
    }
    return false;
}

?>