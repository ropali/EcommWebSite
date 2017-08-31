<?php
    require_once('../../inc/db.php');

    $mode = sanitize_string($_POST['mode']);
    $edit_product_id = sanitize_string($_POST['edit_id']);
    $edit_size = sanitize_string($_POST['edit_size']);
    $customer_id = sanitize_string($_POST['customer_id']);

    //fetch cart details
    $get_cart_query = mysql_query("SELECT * FROM cart WHERE (product_id = '$edit_product_id' AND customer_id = '$customer_id')");
    $get_cart_row = mysql_fetch_array($get_cart_query);

    $items = json_decode($get_cart_row['items'], true);


    $new_qty = $items[0]["quantity"];

    if($mode == "addone"){
        $new_qty += 1;
    }

    if($mode == "removeone"){
        $new_qty -= 1;
    }

    //set the array to update items
    $updated_item = array();
    $updated_item[] = array(
        'id'        => $items[0]["id"],
        'size'      => $items[0]["size"],
        'quantity'  => $new_qty,
    );

    //encode the array to json to store in the db
    $json_encoded_updated_items = json_encode($updated_item);

    //now update the database

    $update_query = mysql_query("UPDATE cart SET items = '$json_encoded_updated_items' WHERE (product_id = '$edit_product_id' AND customer_id = '$customer_id')");
























 ?>
