<?php
    require_once('../inc/db.php');
    require_once('inc/head.php');
    require_once('inc/navbar.php');

    //since this page is completed ...supress all the notice and warning in php due to image upload index problme
    error_reporting(0);

?>
<?php
    //array to store the errors
    $errors = array();
    $msg = array();

    //fetch the user info for edit
    if(isset($_GET['edit']) and isset($_SESSION['user'])){
        $edit_id = (int)$_GET['edit'];

        $get_users_query = "SELECT * FROM users WHERE id = '$edit_id'";
        $get_users_query_run = mysql_query($get_users_query);
        $get_users_row = mysql_fetch_array($get_users_query_run);

        $full_name = explode(" ", $get_users_row['full_name']);

        $first_name = $full_name[0];
        $last_name = $full_name[1];
        $email = $get_users_row['email'];
        $edit_password = $get_users_row['password'];
        $img = $get_users_row['image'];

    }



    //process the form
    if(isset($_POST['update-user']) and isset($_SESSION['user']) and $admin_per == 'admin'){
        //form validation
        $reaquired = array('first_name', 'last_name', 'email');

        foreach ($reaquired as $field) {
            if($_POST[$field] == ''){
                $errors[] .= " All (*) Fields Are Required!";
                break;
            }
        }



        //check image and validate it
        if(!empty($_FILES['photo']['name'])){
            //var_dump($_FILES);
            $photo = $_FILES['photo'];
            $name = $photo['name'];
            $nameArray = explode('.', $name);
            $fileName = $nameArray[0];
            $fileExt = $nameArray[1];
            $tmp_loc = $photo['tmp_name'];
            $fileSize = $photo['size'];
            $mime = explode('/', $photo['type']);
            $mimeType = $mime[0];
            $mimeExt = $mime[1];
            $allowed_img_type = array('png' ,'jpg', 'jpeg', 'gif');
            $imgName = $fileName."-". md5(microtime()) .'.'. $fileExt;
            $imgPath = '/opt/lampp/htdocs/ecomm/admin/img/users/'.$imgName;
            //var_dump($imgPath);
            //check if it is other than image
            if($mimeType != 'image'){
                $errors[] .= "The File Must Be An Image!";
            }
            //check if the file ext is in the allowes array
            if(!in_array($fileExt, $allowed_img_type)){
                $errors[] .= 'The File Extension Must Be png, jpg, jpeg or gif!';
            }
            //check the file size.it must be less than 1MB
            if ($fileSize > 1000000) {
                $errors[] .= "Image Must Be Less Then 1MB.";
            }
            //check if the mime ext is same as file ext
            if ($fileExt != $mimeExt && ($mimeExt == 'jpeg' and $fileExt != 'jpg')) {
                $errors[] .= "File Extension Does Not Match With The File!";
            }

            //upload image and update into database
            if (!move_uploaded_file($tmp_loc, $imgPath)) {
                $errors[] .= "Unable To Move File.";
            }
        }




        //validate email
        // if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
        //     $errors[] .= "It's not valid a email!";
        // }

        //check if the user want to chage the password
        if(!empty($_POST['pass'])){
            //check the password
            if($_POST['pass'] == $_POST['c_pass']){

                $pass = $_POST['pass'];
                $hashed_pass = password_hash($pass, PASSWORD_DEFAULT);
            }
            else{
                $errors[] .= "Password Didn't Match!";
            }
        }

        //if user dont want to change password
        if(empty($_POST['pass'])){

            $hashed_pass = $edit_password;
        }

        //if error occured display it
        if(!empty($errors)){
            $display = display_errors($errors);
        }
        else{


            //get the values from the fields and sanitize them
            $first_name = mysql_real_escape_string(sanitize_string(strtolower($_POST['first_name'])));
            $last_name = mysql_real_escape_string(sanitize_string(strtolower($_POST['last_name'])));
            $fullname = "$first_name"." "."$last_name";
            $email = mysql_real_escape_string(sanitize_string($_POST['email']));

            if(empty($_FILES['photo']['name'])){
                $imgName = $img;

            }

            //insert data into database
            $update_query = "UPDATE users SET full_name = '$fullname', email = '$email', password = '$hashed_pass', image = '$imgName' WHERE id = '$edit_id'";
            $update_query_run = mysql_query($update_query);

            //if query is succesfull then empty all the fields
            if ($update_query_run != false) {

                $msg[] .= ucwords("user has been updated to the database.");
                $display = display_msg($msg);

                //empty all the fields
                $first_name = "";
                $last_name = "";
                $email = "";
                //header("Location:edit-user.php");
            }
            else{
                echo " else part" . mysql_error("did not update");
            }
        }
    }
 ?>


<body>
<nav class="navbar navbar-default navbar-fixed-top">

<?php include('inc/navbar.php'); ?>
</nav><!--END OF NAVBAR-->

<div class="container" style="height:600;">
    <h2 class="text-center">Update A User</h2><hr>
    <!-- Nothing to do with  it -->
    <div class="col-md-3">

    </div>

    <!-- form to add a new product -->
    <div class="col-md-6">
        <div class="error"><!--Display errors here..-->
            <?= ((isset($display))?$display:''); ?>
        </div>

        <form action="" class="form" method="post" enctype="multipart/form-data">
            <div class="form-group">
              <label for="first_name">First Name<span style="color:red">*</span>:</label>
              <input type="text" class="form-control" id="first_name" name="first_name" placeholder="First Name Of The User" value="<?= ((isset($first_name))?$first_name:'')?>">
            </div>

            <!-- last name of the user -->
            <div class="form-group">
              <label for="last_name">Last Name<span style="color:red">*</span>:</label>
              <input type="text" class="form-control" id="last_name" name="last_name" placeholder="Last Name Of The User" value="<?= ((isset($last_name))?$last_name:''); ?>">
            </div>
            <!-- email of the user -->

              <label for="email">Email<span style="color:red">*</span>:</label>
              <input type="text" class="form-control" id="email" name="email" placeholder="Add Email Of The User" value="<?= ((isset($email))?$email:''); ?>">
              <!-- photo of the user -->
            <div class="form-group">
              <label for="photo">User Profile<span style="color:red">*</span>:</label>
              <input type="file"  id="photo" name="photo">
            </div>


            <!-- password for the user -->
            <div class="form-group">
              <label for="pass">Password<span style="color:red">*</span>:</label>
              <input type="password" class="form-control" id="pass" name="pass" placeholder="Password For The User">
            </div>

            <!-- confirm password for the user -->
            <div class="form-group">
              <label for="c_pass">Confirm Password<span style="color:red">*</span>:</label>
              <input type="password" class="form-control" id="c_pass" name="c_pass" placeholder="Confirm Password">
            </div>


            <!-- submit button -->
            <button type="submit" name="update-user" class="btn btn-success">Update User</button>
            <a href="users.php" class="btn btn-danger">Cancel</a>
        </form>



    </div>

    <div class="col-md-3">
        <?php
            if(isset($img)){ ?>
                <img src='img/users/<?=$img; ?>' class='img img-thumbnail'/><br/><br>

        <? } ?>
    </div>


</div>



<?php  include('inc/footer.php'); ?>



</body>
</html>
