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
    $products_query = "SELECT * FROM products WHERE deleted = 0 ORDER BY id DESC";
    $products_query_run = mysql_query($products_query);


    //Change the status of featured products
    if(isset($_GET['featured']) and isset($_SESSION['user'])){
        $featured = (int)$_GET['featured'];
        $product_id = (int)$_GET['id'];
        $update_feature_query = "UPDATE products SET featured = '$featured' WHERE id = '$product_id'";
        $update_feature_query_run = mysql_query($update_feature_query);

        header('Location:products.php');

    }

    //Delete the products
    if(isset($_GET['delete']) and isset($_SESSION['user']) and $admin_per == 'admin'){
        $delete_id = $_GET['delete'];
        $delete_query = "UPDATE products SET deleted = 1 WHERE id = '$delete_id'";
        $delete_query_run = mysql_query($delete_query);
        $msg[] .= ucwords("1 product deleted from database!");
        $display = display_msg($msg);
        header("refresh:1;url=products.php");
    }

    //if other than admin tries to delete products
    if (isset($_GET['delete']) and isset($_SESSION['user']) and $admin_per != 'admin') {
        $errors[] .= ucwords("you don't have permission to delete products!");
        $display = display_errors($errors);
    }

 ?>
<body>
<nav class="navbar navbar-default navbar-fixed-top">

<?php include('inc/navbar.php'); ?>
</nav><!--END OF NAVBAR-->

<div class="container" style="height:800px">
    <h2 class="text-center">Products</h2>
    <a href="add-product.php" class="btn btn-success pull-right">Add Product</a>
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
            <th class="text-center">Sold</th>
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
                    <a href="edit-product.php?edit=<?=$products_row['id']; ?>&parent_id=<?=$parent_id; ?>&child_name=<?=$child_cat_row['category']; ?>&child_id=<?=$child_cat_row['id']; ?>&parent_name=<?=$parent_row['category']; ?>&featured=<?=$products_row['featured']; ?>" class="btn btn-sm btn-primary"><span class="glyphicon glyphicon-pencil"></span></a>
                    <a href="products.php?delete=<?=$products_row['id']; ?>" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-trash"></span></a>
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
                <td></td>
            </tr>
            <?php } ?>
        </tbody>
    </table>

</div>









<?php  include('inc/footer.php'); ?>

</body>
</html>
