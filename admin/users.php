<?php
    require_once('../inc/db.php');
    require_once('inc/head.php');
    require_once('inc/navbar.php');
?>

<body>
<nav class="navbar navbar-default navbar-fixed-top">

<?php include('inc/navbar.php'); ?>
</nav><!--END OF NAVBAR-->

<?php
    //Declare array to store msg info
    $msg = array();

    //fetch users from database
    $get_users_query = "SELECT * FROM users";
    $get_users_query_run = mysql_query($get_users_query);

    //Delete user
    if (isset($_GET['delete']) and isset($_SESSION['user']) and $admin_per == 'admin') {
        $delete_id = (int)$_GET['delete'];

        //first fetch the user details to delete the image of the usr
        $get_users = mysql_query("SELECT image FROM users WHERE id = '$delete_id'");
        $get_users_row = mysql_fetch_array($get_users);
        $user_img = $get_users_row['image'];
        $imgPath = '/opt/lampp/htdocs/ecomm/admin/img/users/'.$user_img;
        unlink($imgPath);

        //After deleting image delete user from database
        $delete_query = "DELETE FROM users WHERE id = '$delete_id'";
        $delete_query_run = mysql_query($delete_query);
        $msg[] .= ucwords("user has been deleted succesfully.");
        $display = display_msg($msg);

    }

    //If other then admin tries to delete users
    if (isset($_GET['delete']) and isset($_SESSION['user']) and $admin_per != 'admin'){
        $errors[] .= ucwords("you don't have permissions to delete users!");
        $display = display_errors($errors);
    }


?>



<div class="container">
    <br><br>


        <div class="col-md-12">
            <h2 class="text-center">Users</h2><hr>
            <div class="error">
                <?= ((isset($display)?$display:'')); ?>
            </div>
            <a href="add-user.php" class="btn btn-success pull-right">Add User</a><br><br>
            <table class="table table-bordered table-striped table-hover">
                <thead>
                    <th class="text-center">ID#</th>
                    <th class="text-center">Name</th>
                    <th class="text-center">Surname</th>
                    <th class="text-center">Email</th>
                    <th class="text-center">Joining&nbsp;Date</th>
                    <th class="text-center">Last&nbsp;Login</th>
                    <th class="text-center">Permissions</th>
                    <th class="text-center">Image</th>
                    <th class="text-center">Actions&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                </thead>
                <tbody>
                    <?php while($users_row = mysql_fetch_array($get_users_query_run)){
                            $user_fullname = explode(" ", $users_row['full_name']);
                            $fname = $user_fullname[0];
                            $lname = $user_fullname[1];

                            $date = getdate($users_row['last_login']);
                            $day = $date['mday'];
                            $month = $date['mon'];
                            $year = $date['year'];
                            $time = date("H:i:s", $users_row['last_login']);

                    ?>
                    <tr>
                        <td class="text-center" ><?php echo $users_row['id']; ?></td>
                        <td class="text-center" ><?= ucwords($fname); ?></td>
                        <td class="text-center" ><?= ucwords($lname); ?></td>
                        <td class="text-center" ><?php echo $users_row['email']; ?></td>
                        <td class="text-center" ><?php echo $users_row['join_date']; ?></td>
                        <td class="text-center" ><?php echo "$year-$month-$day $time";?></td>
                        <td class="text-center" ><?php echo ucwords($users_row['permissions']); ?></td>
                        <td class="text-center" ><img src="img/users/<?php echo $users_row['image']; ?>" alt="" width="20%"></td>
                        <td>
                            <a href="edit-user.php?edit=<?php echo $users_row['id']; ?>" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-pencil"></span></a>
                            <a href="users.php?delete=<?php echo $users_row['id']; ?>" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></a>
                        </td>
                    </tr>
                    <?php } ?>

                </tbody>
            </table>
        </div>



</div>











<?php  include('inc/footer.php'); ?>

</body>
</html>
