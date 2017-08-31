<?php
    require_once('../inc/db.php');
    require_once('inc/head.php');
    require_once('inc/navbar.php');

?>
<?php
    //define arrays to store messages
    $msg = array();
    $errors = array();

    //fetch products info
    $products_query = "SELECT * FROM products WHERE deleted = 1 ORDER BY id DESC";
    $products_query_run = mysql_query($products_query);

    //if other than admin tries to restore products
    if (isset($_GET['restore']) and isset($_SESSION['user']) and $admin_per != 'admin') {
        $errors[] .= ucwords("you don't have permission to restore products!");
        $display = display_errors($errors);
        header('refresh:2;url=archive-products.php');
    }

    //restore the products
    if(isset($_GET['restore']) and isset($_SESSION['user']) and $admin_per == 'admin'){
        $restore = (int)$_GET['restore'];

        $update_deleted_query = "UPDATE products SET deleted = 0 WHERE id = '$restore'";
        $update_deleted_query_run = mysql_query($update_deleted_query);
        $msg[] .= ucwords("1 prodcut is restored");
        $display = display_msg($msg);
        header('refresh:2;url=archive-products.php');

    }

    //Delete the products
    if(isset($_GET['delete']) and isset($_SESSION['user']) and $admin_per == 'admin'){
        $delete_id = $_GET['delete'];
        $delete_query = "DELETE FROM products WHERE WHERE id = '$delete_id'";
        $delete_query_run = mysql_query($delete_query);
        $msg[] .= ucwords("1 product deleted from database!");
        $display = display_msg($msg);
        header("refresh:1;url=archive-products.php");
    }

    //if other than admin tries to delete products
    if (isset($_GET['delete']) and isset($_SESSION['user']) and $admin_per != 'admin') {
        $errors[] .= ucwords("you don't have permission to delete products!");
        $display = display_errors($errors);
        header('refresh:1;url=archive-products.php');
    }


 ?>
<body>
<nav class="navbar navbar-default navbar-fixed-top">

<?php include('inc/navbar.php'); ?>
</nav><!--END OF NAVBAR-->

<div class="container" style="height:800px">
    <h2 class="text-center">Archive Products</h2>

    <div class="clearfix"></div>
    <div class="error">
        <?=((!empty($display))?$display:'');?>
    </div>
    <hr>

    <table class="table table-bordered table-striped table-condensed">
        <thead>
            <th class="text-center">Actions</th>
            <th class="text-center">Products</th>
            <th class="text-center">Brand</th>
            <th class="text-center">Price</th>
            <th class="text-center">List Price</th>
            <th class="text-center">Category</th>
            <th class="text-center">Featured</th>

        </thead>
        <tbody>
            <?php while ($products_row = mysql_fetch_array($products_query_run)) {
                $cat_id = $products_row['categories'];
                $brand_id = $products_row['brand'];
                //fetch category name from categories
                $child_cat_query = "SELECT * FROM categories WHERE id = '$cat_id'";
                $child_cat_query_run = mysql_query($child_cat_query);
                $child_cat_row = mysql_fetch_array($child_cat_query_run);
                $parent_id = $child_cat_row['parent'];

                $parent_query = "SELECT * FROM categories WHERE id = '$parent_id'";
                $parent_query_run = mysql_query($parent_query);
                $parent_row = mysql_fetch_array($parent_query_run);

                $category = $parent_row['category'] . ' ~ ' . $child_cat_row['category'];

                //fetch brand info
                $get_brand = mysql_query("SELECT * FROM brand WHERE id = '$brand_id'");
                $brand_row = mysql_fetch_array($get_brand);
             ?>
            <tr>
                <td class="text-center">
                    <a href="archive-products.php?restore=<?=$products_row['id']; ?>" class="btn btn-sm btn-primary" title="Restore The Product"><span class="glyphicon glyphicon-refresh"></span></a>
                    <a href="archive-products.php?delete=<?=$products_row['id']; ?>" class="btn btn-sm btn-danger" title="Delete Permanently"><span class="glyphicon glyphicon-trash"></span></a>
                </td>
                <td class="text-center"><?php echo ucwords($products_row['title']); ?></td>
                <td class="text-center"><?php echo ucwords($brand_row['brandname']); ?></td>
                <td class="text-center"><?php echo money($products_row['price']); ?></td>
                <td class="text-center"><?php echo money($products_row['list_price']); ?></td>
                <td class="text-center"><?=ucwords($category); ?></td>
                <td class="text-center">
                    <?php echo(($products_row['featured'] == 1)?'Yes':'No'); ?>&nbsp;
                    <a title="Change status" href="products.php?id=<?php echo $products_row['id']; ?>&featured=<?php echo (($products_row['featured'] == 0)?'1':'0'); ?>" class="btn btn-sm btn-<?php echo (($products_row['featured'] == 1)?'danger':'primary'); ?>">

                    <span class="glyphicon glyphicon-<?php echo (($products_row['featured'] == 1)?'remove':'ok'); ?>"></span></a></td>

            </tr>
            <?php } ?>
        </tbody>
    </table>

</div>









<?php  include('inc/footer.php'); ?>

</body>
</html>
