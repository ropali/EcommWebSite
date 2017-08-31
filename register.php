<?php
    require_once('inc/db.php');
    // $password = "ropali";
    // $hashed = password_hash($password, PASSWORD_DEFAULT);
    // echo "$hashed";
    $user_name = ((isset($_POST['user-name']))?mysql_real_escape_string($_POST['user-name']):'');
    $email = ((isset($_POST['email']))?mysql_real_escape_string($_POST['email']):'');
    $email = trim($email);
    $password = ((isset($_POST['password']))?mysql_real_escape_string($_POST['password']):'');
    $password = trim($password);

    $c_password = ((isset($_POST['c_password']))?mysql_real_escape_string($_POST['c_password']):'');
    $c_password = trim($c_password);

    $contactno = ((isset($_POST['contactno']))?mysql_real_escape_string($_POST['contactno']):'');



    //to store errors
    $errors = array();
    $msg = array();


    //form validation
    if(isset($_POST['submit'])){
        if(empty($_POST['email']) or empty($_POST['password'])){
            $errors[] .= "You Must Provide Email And Password";
        }

        //validate email
        if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
            $errors[] .= "It's not valid a email!";
        }

        //check if the contactno length is less than 10 or greater than 10
        if(strlen($contactno) < 10 or strlen($contactno) > 10){
            $errors[] .= ucwords("please give proper contact no!");
        }

        //check if the user exist
        $check_user_query = "SELECT * FROM customer WHERE email = '$email'";
        $check_user_query_run = mysql_query($check_user_query);
        $check_user_row = mysql_fetch_array($check_user_query_run);
        if(mysql_num_rows($check_user_query_run) > 1){
            $errors[] .= ucwords("this email already exist in our database!");
        }

        //check if the password matched
        if($password != $c_password){
            $errors[] .= ucwords("password didn't match.plese try again..");
        }

        //verify the password
        if(!empty($user_name) and !empty($email) and !empty($contactno) and !empty($password) and !empty($c_password)){
            //hash the password
            if($password == $c_password){
                $hashed_pass = password_hash($password, PASSWORD_DEFAULT);
            }
            //if all creadiantials matches then update db
            $insert_query = "INSERT INTO customer (full_name, email, password, contact_no) VALUES ('$user_name', '$email', '$hashed_pass', '$contactno')";

            $insert_query_run = mysql_query($insert_query);

            $msg[] .= '<p class="text-info">Signed up successfully.please login now..</p>';
            $display = display_msg($msg);

            //empty all the variable after updating db
            $user_name = "";
            $email = "";
            $contactno = ""; 

            //header("Location:login.php");
        }



        //check for errors
        if(!empty($errors)){
            $display = display_errors($errors);
        }
    }


?>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Registration - My Boutique</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">


    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Pacifico" rel="stylesheet">
    <style type="text/css">
        body{
            background-image:url("img/background.png");
            background-size: 100vw, 100vh;
        }
        #login{
            font-family: 'Open Sans', sans-serif;

            font-family: 'Oswald', sans-serif;

            font-family: 'Pacifico', cursive;
            color:skyblue;
            font-weight: bolder;
        }
    </style>

  </head>

  <body>

    <div class="container" id="container">
        <div class="error">
            <? echo ((!empty($display))?$display:''); ?>
        </div>

      <form class="form-signin" method="post" action="">
        <h2 class="form-signin-heading text-center" id="login">Please Sign Up</h2>

        <label for="user-name" class="sr-only">Full Name</label>
        <input type="text" name="user-name" id="user-name" class="form-control" placeholder="Full Name" value="<?= $user_name; ?>" required autofocus>

        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email address" value="<?= $email; ?>" required autofocus="">

        <label for="contactno" class="sr-only">Contact No.</label>
        <input type="text" name="contactno" maxlength="10" id="contactno" class="form-control" placeholder="Contact Number" value="<?= $contactno; ?>" required >

        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required autofocus="">
        <label for="confirmPassword" class="sr-only">Confirm Password</label>
        <input type="password" name="c_password" id="confirmPassword" class="form-control" placeholder="Confirm Password" required autofocus="">
        <div class="clearfix">

        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit" name="submit">Sign up</button>
      </form>
    <a href="login.php" class="pull-right"><i>login here</i></a>

    </div> <!-- /container -->



  </body>
</html>
