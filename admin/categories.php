<?php
    //require_once($_SERVER['DOCUMENT_ROOT'] . 'ecomm/inc/db.php');
    require_once('../inc/db.php');
    include('inc/head.php');

?>

<body>
<nav class="navbar navbar-default navbar-fixed-top">

<?php include('inc/navbar.php'); ?>

</nav><!--END OF NAVBAR-->

<?php
    //Declaring this variable to solve the undefined variable problem at line 147.This arises bcoz
    //we want to check that if the parent is selected or not if we click edit Category button
    $edit_parent = "";
    $errors = array();
    $msg = array();
    //fetch categories
    $get_cat_query = "SELECT * FROM categories WHERE parent = 0";
    $get_cat_query_run = mysql_query($get_cat_query);

    //Edit categories
    if(isset($_GET['edit']) and !empty($_GET['edit'])){
        $edit_id = (int)$_GET['edit'];
        $edit_query = "SELECT * FROM categories WHERE id = '$edit_id'";
        $edit_query_run = mysql_query($edit_query);
        $edit_row = mysql_fetch_array($edit_query_run);
        $edit_parent = $edit_row['parent'];

    }



    //Delete categories
    if(isset($_GET['delete']) and !empty($_GET['delete']) and isset($_SESSION['user']) and $admin_per == 'admin'){
        $delete_id = (int)$_GET['delete'];

        //Check if the category is the parent category
        $check_parent_query = "SELECT parent FROM categories WHERE id = '$delete_id'";
        $check_parent_query_run = mysql_query($check_parent_query);
        $parent_row = mysql_fetch_array($check_parent_query_run);
        if($parent_row['parent'] == 0){
            //If category is parent the delete all the child category from the database
            $delete_child_query = "DELETE FROM categories WHERE parent = '$delete_id'";
            mysql_query($delete_child_query);
        }

        $delete_query = "DELETE FROM categories WHERE id = '$delete_id'";
        $delete_query_run = mysql_query($delete_query);
        $msg[] .= "Deleted category successfully";
        $display = display_msg($msg);
    }

    //if other then admin tries to delete categories
    if (isset($_GET['delete']) and !empty($_GET['delete']) and isset($_SESSION['user']) and $admin_per != 'admin') {
        $errors[] .= ucwords("you don't have permission to delete brands!");
        $display = display_errors($errors);
    }



    //add categories (process the form)
    if(isset($_POST) and !empty($_POST)){
        $parent = sanitize_string($_POST['parent']);
        $category = sanitize_string($_POST['category']);
        $category = strtolower($category);


        if(!isset($_GET['edit'])){
            $check_cat_query = "SELECT * FROM categories WHERE category = '$category' AND parent = '$parent'";
            $check_cat_query_run = mysql_query($check_cat_query);
            //if category already exist in database
            if(mysql_num_rows($check_cat_query_run) > 0){
                $errors[] .= $category . " already exist in the database!";
            }
        }

        //if category is blank
        if($category == ''){
            $errors[] .= "Category cannot be empty!";
        }

        //Display errors or update database
        if(!empty($errors)){
            $display = display_errors($errors); ?>
            <script type="text/javascript">
                jQuery('document').ready(function(){
                    jQuery('#error').html('<?= $display; ?>');
                });
            </script>
    <?php  }
        else{
            //update database
            $category = $_POST['category'];
            $update_query = "INSERT INTO categories (category, parent) VALUES ('$category', '$parent')";
            if(isset($_GET['edit'])){
                $update_query = "UPDATE categories SET category = '$category', parent = '$parent' WHERE id = '$edit_id'";
                $msg[] .= "Category updated successfully";

            }
            else{
                    $msg[] .= $category . " added to the database";
            }
            $update_query_run = mysql_query($update_query);
            $display = display_msg($msg);
            header("Refresh:1");




            //header("Location : categories.php");
            ?>
            <script type="text/javascript">
                jQuery('document').ready(function(){
                    jQuery('#error').html('<?= $display; ?>');
                });
            </script>
    <?php
        }
    }

    $edit_category = "";
    if(isset($_GET['edit'])){
        $edit_category = $edit_row['category'];
    }


 ?>

<br><br>
<div class="container">

    <div class="row">
        <h2 class="text-center">Categories</h2><hr>
        <div class="col-md-6">
            <!--Form-->
            <form action="categories.php<?= ((isset($edit_id))?'?edit='.$edit_id:'')?>" method="POST" class="form">
                <legend><?= ((isset($edit_id))?'Edit ':'Add ')?>A Category</legend>
                <div id="error" class="form-group">
                    <? echo ((isset($display))?$display:''); ?>
                </div>

                <div class="form-group">
                    <label for="parent"><?= ((isset($edit_id))?'Edit ':'')?>Parent</label>
                    <select class="form-control" name="parent" id="parent">
                        <option value="0">Parent</option>
                        <?php while($row = mysql_fetch_array($get_cat_query_run)){ ?>
                                <option value="<?php echo $row['id']; ?>" <?php if($row['id'] == $edit_parent){ echo "selected"; } ?>><?php echo ucwords($row['category']); ?></option>
                        <?php } ?>
                    </select>
                </div>
                <div class="form-group">
                    <label for="category"><?= ((isset($edit_id))?'Edit ':'')?>Category</label>
                    <input type="text" name="category" class="form-control" value="<?= ((isset($edit_id))?ucwords($edit_category):'')?>">
                </div>
                <div class="form-group">
                    <button type="submit" name="add-category" class="btn btn-success"><?= ((isset($edit_id))?'Update':'Add')?> category</button>

                    <?php
                        if(isset($edit_id)){
                            echo '<a href="categories.php" class="btn btn-danger">Cancel</a>';
                        }
                    ?>
                </div>
            </form>
        </div>
        <div class="col-md-6">
            <!--categories table-->
            <table class="table table-bordered">
                <thead>
                    <th>Category</th>
                    <th>Parent</th>
                    <th>Actions</th>
                </thead>
                <tbody>
                    <?php
                        //fetch categories
                        $get_cat_query_run = mysql_query($get_cat_query);
                        $get_cat_query = "SELECT * FROM categories WHERE parent = 0";
                        if(mysql_num_rows($get_cat_query_run) > 0){
                            while($cat_row = mysql_fetch_array($get_cat_query_run)){
                                $parent_id = $cat_row['id'];

                                $get_child_cat = "SELECT * FROM categories WHERE parent = '$parent_id'";
                                $get_child_cat_run = mysql_query($get_child_cat);

                     ?>
                    <tr class="bg-primary">
                        <td><?= ucwords($cat_row['category']); ?></td>
                        <td>Parent</td>
                        <td>
                            <a href="categories.php?edit=<?php echo $cat_row['id']; ?>" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-pencil"></span></a>
                            <a href="categories.php?delete=<?php echo $cat_row['id']; ?>" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-remove-sign"></span></a>
                        </td>
                    </tr>
                    <?php while($cat_child_row = mysql_fetch_array($get_child_cat_run)){ ?>
                        <tr class="bg-info">
                            <td><?= ucwords($cat_child_row['category']); ?></td>
                            <td><?= ucwords($cat_row['category']); ?></td>
                            <td>
                                <a href="categories.php?edit=<?php echo $cat_child_row['id']; ?>" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-pencil"></span></a>
                                <a href="categories.php?delete=<?php echo $cat_child_row['id']; ?>" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-remove-sign"></span></a>
                            </td>
                    <?php
                                }//end of while loop for child categories
                            }//end of while loop
                        }//end of if loop
                     ?>
                </tbody>
            </table>
        </div>
    </div>
</div>











<?php  include('inc/footer.php'); ?>

</body>
</html>
