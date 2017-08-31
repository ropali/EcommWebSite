<?php
    include('../inc/db.php');
    include('inc/head.php');

?>
<?php
    $brand_query = "SELECT * FROM brand ORDER BY id DESC";
    $brand_query_run = mysql_query($brand_query);

?>
<body>

<nav class="navbar navbar-default navbar-fixed-top">

<?php include('inc/navbar.php'); ?>
</nav><!--END OF NAVBAR-->

<?php
    $msg_array = array();
    $errors = array();

    //Edit brand
    if(isset($_GET['edit']) and !empty($_GET['edit']) and isset($_SESSION['user'])){
        $edit_id = mysql_real_escape_string($_GET['edit']);
        $fetch_brand_query = "SELECT * FROM brand WHERE id = '$edit_id'";
        $fetch_brand_query_run = mysql_query($fetch_brand_query);
        $brand_row = mysql_fetch_array($fetch_brand_query_run);

        $edit_name = $brand_row['brandname'];
    }


    //DELETE brand
    if(isset($_GET['delete']) and !empty($_GET['delete']) and isset($_SESSION['user']) and $admin_per == 'admin'){
        $delete_id = mysql_real_escape_string($_GET['delete']);
        $delete_id = (int)$delete_id;

        //check if the id exists
        $check_id_query = "SELECT id FROM brand WHERE id = '$delete_id'";
        //$check_id_query_run = mysql_query($check_id_query);
        if(mysql_query($check_id_query)){
            //delete the brand
            $delete_query = "DELETE FROM brand WHERE id = '$delete_id'";
            mysql_query($delete_query);
            //$msg_array[] .= "Deleted the brand from the list";
            header("Location:brands.php");
        }
        else{
            header("Location :brands.php");
        }

    }

    //if other then admin tries to delete brand
    if (isset($_GET['delete']) and !empty($_GET['delete']) and isset($_SESSION['user']) and $admin_per != 'admin') {
        $errors[] .= ucwords("you don't have permission to delete brands!");
        $display = display_errors($errors);
    }


    //IF add-brand is submitted
    if(isset($_POST['add-brand'])){
        //if string contains HTML tags the santize it
        $brand = sanitize_string($_POST['brand']);
        //check if brand is blank
        if($brand == ""){
            $errors[] .= "You must enter a brand!";

        }
        //check if brand already exists in datdbase
        $get_brand_query = "SELECT * FROM brand WHERE brandname LIKE '$brand'";



        $get_brand_query_run = mysql_query($get_brand_query);

        if(mysql_num_rows($get_brand_query_run) > 0){
            $errors[] .= "This brand already exist!.Please choose another.";
        }else{
            //add brand to the database
            $brand = strtolower($brand);
            if(!empty($brand)){
                $insert_brand_query = "INSERT INTO brand (brandname) VALUES('$brand')";

                if(!mysql_query($insert_brand_query)){
                    $errors[] .= "Unable to add the brand to database!";
                }
                else{
                    $msg_array[] .= "Brand added to the list successfully...";
                    header("Location:brands.php");
                }
            }

        }

    }

    //update brand
    if(isset($_POST['edit-brand'])){
        $edit_id = mysql_real_escape_string($_GET['edit']);

        //if string contains HTML tags the santize it
        $brand = sanitize_string($_POST['brand']);
        //check if brand is blank
        if($brand == ""){
            $errors[] .= "You must enter a brand!";

        }
        else{
            //update brand to the database
            $brand = strtolower($brand);
            if(!empty($brand)){
                $update_brand_query = "UPDATE brand SET brandname = '$brand' WHERE id = '$edit_id'";

                if(!mysql_query($update_brand_query)){
                    $errors[] .= "Unable to add the brand to database!";
                }
                else{
                    $msg_array[] .= "Brand added to the list successfully...";
                    header("Location:brands.php");
                }
            }

        }


    }

?>



<div class="container">
	<div class="row">
        <br>
        <h2 class="text-center" id="brand-text">Brands</h2><hr>
        <?php
        //display errors
        if(!empty($errors)){
            echo display_errors($errors);
        }
        else if(!empty($msg_array)){
            echo display_msg($msg_array);

        }
        ?>
        <!--Add Brand Form-->
        <div class="text-center">
            <form action="" method="POST" class="form-inline">
                <div class="form-group">
                    <label for="brand"><?php echo ((isset($_GET['edit']))?'Edit ':'Add a'); ?> brand</label>
                    <input type="text" name="brand" id="brand" value="<?php echo (isset($_GET['edit']))?ucwords($edit_name) : ''; ?>" class="form-control">
                    <input type="submit" name="<?php echo ((isset($_GET['edit']))?'edit-brand':'add-brand'); ?>" value="<?php echo ((isset($_GET['edit']))?'Update ':'Add a'); ?> Brand" class="btn  btn-success">
                    <?php
                        if(isset($_GET['edit'])){
                                echo '<a href="brands.php" class="btn btn-danger">Cancel</a>';
                        }

                    ?>
                </div>
            </form>
        </div><hr>

        <!--Brands Table-->
        <table class="table table-hover table-bordered table-striped table-condensed" id="table">
            <thead>
                <th></th>
                <th>Brands</th>
                <th></th>
            </thead>
            <tbody>
                <?php
                //fetch brands from database..
                while ($brand_row = mysql_fetch_array($brand_query_run)) {
                    if(mysql_num_rows($brand_query_run) > 0){
                ?>
                <tr>

                    <td><a href="brands.php?edit=<?php echo $brand_row['id']; ?>" class="btn btn-xs btn-primary"><span class="glyphicon glyphicon-pencil"></span></a></td>

                    <td><?php echo ucwords($brand_row['brandname']); ?></td>

                    <td><a href="brands.php?delete=<?php echo $brand_row['id']; ?>" class="btn btn-xs btn-danger"><span class="glyphicon glyphicon-trash"></span></a></td>
                </tr>
                <?php
                      }//END OF WHILE LOOP
                    }//END OF IF LOOP
                ?>
            </tbody>
        </table>


	</div>
</div>




<?php include('inc/footer.php'); ?>

</body>
</html>
