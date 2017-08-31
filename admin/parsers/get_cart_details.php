<?php
    require_once('../../inc/db.php');
    $customer_id = mysql_real_escape_string($_POST['customer_id']);

    //get all the product for customer with customer_id
    $get_product_query = "SELECT * FROM cart WHERE customer_id = '$customer_id' AND paid = 0";
    $get_product_query_run = mysql_query($get_product_query);

    $num_of_rows = mysql_num_rows($get_product_query_run);

 ?>
<?php ob_start(); ?>

    <span class="badge" style="margin-top:-8px;margin-left:-15px"><?php echo $num_of_rows; ?></span>


<?php echo ob_get_clean(); ?>
