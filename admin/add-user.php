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

    //Delare variables
    $first_name = (isset($_POST['first_name'])?$_POST['first_name']:'');
    $last_name = (isset($_POST['last_name'])?$_POST['last_name']:'');
    $email = (isset($_POST['email'])?$_POST['email']:'');

    $user_per = (isset($_POST['user_per'])?$_POST['user_per']:'');



    //process the form
    if(isset($_POST['add-user']) and isset($_SESSION['user']) and $admin_per == 'admin'){

        //form validation
        $reaquired = array('first_name', 'last_name', 'email', 'join-date', 'user_per', 'pass', 'c_pass');

        foreach ($reaquired as $field) {
            if($_POST[$field] == ''){
                $errors[] .= " All (*) Fields Are Required!";
                break;
            }
        }
        //check image and validate it
        if(!empty($_FILES['photo'])){
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
            $imgName = $fileName . md5(microtime()) .'.'. $fileExt;
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
        }

        //validate email
        // if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
        //     $errors[] .= "It's not valid a email!";
        // }

        //check the password
        if($_POST['pass'] != $_POST['c_pass']){
            $errors[] .= "Password Didn't Match!";

        }

        //if password matches
        if($_POST['pass'] == $_POST['c_pass']){
            $pass = $_POST['pass'];
            $hashed_pass = password_hash($pass, PASSWORD_DEFAULT);
        }

        //if error occured display it
        if(!empty($errors)){
            $display = display_errors($errors);
        }
        else{
            //upload image and insert into database
            if (!move_uploaded_file($tmp_loc, $imgPath)) {
                $errors[] .= "Unable To Move File.";
            }

            //get the values from the fields and sanitize them
            $first_name = mysql_real_escape_string(sanitize_string(strtolower($_POST['first_name'])));
            $last_name = mysql_real_escape_string(sanitize_string(strtolower($_POST['last_name'])));
            $fullname = "$first_name"." "."$last_name";
            $email = mysql_real_escape_string(sanitize_string($_POST['email']));
            $join_date = mysql_real_escape_string(sanitize_string($_POST['join-date']));
            $user_per = mysql_real_escape_string(sanitize_string(strtolower($_POST['user_per'])));
            $last_login = time();

            //insert data into database
            $insert_query = "INSERT INTO users (full_name, email, password, join_date, last_login, permissions, image) VALUES ('$fullname', '$email', '$hashed_pass', '$join_date', '$last_login', '$user_per', '$imgName')";

            //if query is succesfull then empty all the fields
            if (mysql_query($insert_query)) {
                $msg[] .= "A new user added to the database.";
                $display = display_msg($msg);

                //empty all the fields
                $first_name = "";
                $last_name = "";
                $email = "";
                $join_date = "";
                $user_per = "";
            }
        }
    }
 ?>


<body>
<nav class="navbar navbar-default navbar-fixed-top">

<?php include('inc/navbar.php'); ?>
</nav><!--END OF NAVBAR-->

<div class="container" style="height:600;">
    <h2 class="text-center">Add A User</h2><hr>
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
            <div class="form-group">
              <label for="email">Email<span style="color:red"></span>:</label>
              <input type="text" class="form-control" id="email" name="email" placeholder="Add Email Of The User" value="<?= ((isset($email))?$email:''); ?>">
            </div>
            <!-- Add joining date of the user -->
            <div class="form-group">
              <label for="join-date">Joining Date<span style="color:red"></span>:</label>
              <input type="text" class="form-control" id="join-date" name="join-date" placeholder="Add Joining Date Of The User" value="<?= date("Y-m-d H:i:s"); ?>">
            </div>

            <!-- photo of the user -->
            <div class="form-group">
              <label for="photo">User Profile<span style="color:red">*</span>:</label>
              <input type="file"  id="photo" name="photo">
            </div>

            <!-- permissions for the user -->
            <div class="form-group">
              <label for="user_per">Permissions<span style="color:red">*</span>:</label>
              <input type="text" class="form-control" id="user_per" name="user_per" placeholder="Add Permissions For The User e.g admin,editor or editor" value="<?= ((isset($user_per))?$user_per:''); ?>">
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
            <button type="submit" name="add-user" class="btn btn-success">Add User</button>
            <a href="users.php" class="btn btn-danger">Cancel</a>
        </form>



    </div>

    <div class="col-md-3"></div>


</div>

<!-- Modal -->
<!-- <div class="modal fade" id="sizesModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Sizes & Quantity</h4>
      </div>
      <div class="modal-body">
          <div class="container-fluid">

          <?php for($i = 1;$i <= 12;$i++){ ?>

              <div class="form-group col-md-4">
                <label for="size<?=$i; ?>">Size<span style="color:red;">*</span></label>
                <input type="text" class="form-control" id="size<?=$i; ?>" value="<?= ((!empty($sArray[$i -1 ]))?$sArray[$i - 1]:''); ?>">
              </div>

              <div class="form-group col-md-2">
                <label for="qty<?=$i; ?>">Quantity<span style="color:red;">*</span></label>
                <input type="number" class="form-control" id="qty<?=$i; ?>" value="<?= ((!empty($qArray[$i -1 ]))?$qArray[$i - 1]:''); ?>" min="0">
              </div>


          <?php } ?>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="save">Save changes</button>
      </div>
    </div>
  </div>
</div> -->




<?php  include('inc/footer.php'); ?>



</body>
</html>
