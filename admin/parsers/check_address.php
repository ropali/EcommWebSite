<?php

    require_once('../../inc/db.php');

    //Grab all the vlues from ajax call
    $full_name = sanitize_string($_POST['full_name']);
    $contactno = sanitize_string($_POST['contactno']);
    $email = sanitize_string($_POST['email']);
    $street_addr = sanitize_string($_POST['street_addr']);
    $city = sanitize_string($_POST['city']);
    $state = sanitize_string($_POST['state']);
    $zip_code = sanitize_string($_POST['zip_code']);

    $errors = array();

    $required = array(
        'full_name' => 'Full Name',
        'contactno' => 'Contact No',
        'email'     => 'Email',
        'street_addr'    => 'Street Address',
        'city'      => 'City',
        'state'     => 'State',
        'zip_code'  => 'Zip Code'
    );

    //Check if all the required fields are filled
    foreach ($required as $field => $value) {
        if(empty($_POST[$field]) || $_POST[$field] == ''){
            $errors[] .= $value . " is required";
        }
    }

    //check if email is valid
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] .= "Please enter a valid email address.";
    }

    if(!empty($errors)){
        echo display_errors($errors);
    }
    else{
        echo "passed";
    }


 ?>
