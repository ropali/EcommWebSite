<?php
    require_once('inc/db.php');
    // $password = "ropali";
    // $hashed = password_hash($password, PASSWORD_DEFAULT);
    // echo "$hashed";
    $email = ((isset($_POST['email']))?mysql_real_escape_string($_POST['email']):'');
    $email = trim($email);
    $password = ((isset($_POST['password']))?mysql_real_escape_string($_POST['password']):'');
    $password = trim($password);

    //to store errors
    $errors = array();

    //form validation
    if(isset($_POST['submit'])){
        if(empty($_POST['email']) or empty($_POST['password'])){
            $errors[] .= "You Must Provide Email And Password";
        }

        //validate email
        if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
            $errors[] .= "It's not valid a email!";
        }

        //check if the passwd length is less than 6
        // if(strlen($password) < 6){
        //     $errors[] .= ucwords("password must be atleast 6 character long!");
        // }

        //check if the user exist
        $check_user_query = "SELECT * FROM customer WHERE email = '$email'";
        $check_user_query_run = mysql_query($check_user_query);
        $check_user_row = mysql_fetch_array($check_user_query_run);
        if(mysql_num_rows($check_user_query_run) < 1){
            $errors[] .= ucwords("this email does not exist in our database!");
        }

        //verify the password
        if(!password_verify($password, $check_user_row['password'])){
            $errors[] .= ucwords("password does not match!");
        }
        else{
            //if all creadiantials matches then set the session and redirect user ti homepage
            $_SESSION['customer_name'] = $check_user_row['full_name'];
            $_SESSION['customer_id'] = $check_user_row['id'];
            //echo $check_user_row['id'];

            header("Location: index.php");
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

    <title>Signin - My Boutique</title>

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
        <h2 class="form-signin-heading text-center" id="login">Login Please</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email address" value="<?= $email; ?>" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit" name="submit">Sign in</button>
      </form>

    </div> <!-- /container -->



  </body>
</html>
