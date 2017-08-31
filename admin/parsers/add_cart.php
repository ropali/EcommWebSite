<?php
    require_once $_SERVER['DOCUMENT_ROOT'] . '/ecomm/inc/db.php';

    //Grab the info from ajax call
    $product_id = mysql_real_escape_string($_POST['product_id']);
    $available = mysql_real_escape_string($_POST['available']);
    $quantity = mysql_real_escape_string($_POST['quantity']);
    $size = mysql_real_escape_string($_POST['size']);

    //get the session customer name &
    $customer_name = $_SESSION['customer_name'];
    $customer_id = $_SESSION['customer_id'];

    $item = array();
    $item[] = array(
        'id'        => $product_id,
        'size'      => $size,
        'quantity'  => $quantity,
    );

    //json_encode the array to store in the database
    $json_encoded_items = json_encode($item);

    //store all the items as json and give them customer_id so that we can fetch all the products which customer has put in the cart with unique customer_id
    if(!empty($customer_id) and !empty($product_id)){
        $insert_cart_query = "INSERT INTO cart (items, product_id, customer_id) VALUES ('$json_encoded_items', '$product_id', '$customer_id')";

        $insert_cart_query_run = mysql_query($insert_cart_query);

    }





?>
