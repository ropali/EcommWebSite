<?php
    //session_start();
    // $hash = password_hash("ropali", PASSWORD_DEFAULT);
    // echo "$hash";

    if(isset($_SESSION['user']) and !empty($_SESSION['user'])){
        $session_username = $_SESSION['user'];
        $session_userid = $_SESSION['user_id'];

        //seprate first name and last name of the user
        $name = explode(" ", $session_username,2);

        $fname = ucwords($name[0]);
        $lname = $name[1];

        //get the permission permission
        $permission = $_SESSION['permission'];
        $per_array = explode(',', $permission);

        $admin_per = $per_array[0];
        //echo "$admin_per";
        //$editor_per = $per_array[1];
    }

    if(!isset($_SESSION['user']) and empty($_SESSION['user'])){
        header("Location:login.php");
    }


?>


<div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.php">My Boutique - Admin</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
          <li><a href="brands.php">Brands</a>
          <li><a href="categories.php">Categories</a>


        <li class="dropdown">
          <a href="products.php" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Products<span class="caret"></span></a>
          <ul class="dropdown-menu">
              <li><a href="products.php">Products</a>
              <li><a href="archive-products.php">Archive Products</a>
          </ul>
        </li>
        <li><a href="users.php">Users</a>


      </ul>
      <ul class="nav navbar-nav navbar-right">
          <li><a href="profile.php"><span class="glyphicon glyphicon-user"></span> <?= $fname; ?></a></li>

          <li><a href="logout.php"><span class="glyphicon glyphicon-off"></span> Logout</a></li>

      </ul>


    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
