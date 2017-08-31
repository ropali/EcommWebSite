<?php
function display_errors($errors){
    $display = '<ul class="bg-danger" style="list-style-type:none;margin:10px auto;width:80%;padding:20px">';
    foreach ($errors as $error) {
        $display .= '<li class="text-danger text-center "><span class="glyphicon glyphicon-warning-sign"></span> '.$error.'<li>';
    }
    $display .= '</ul>';
    return $display;
}

function display_msg($msg_array){
    $display_msg = '<ul class="bg-info" style="list-style-type:none;margin:10px auto;width:80%;padding:20px">';
    foreach ($msg_array as $msg) {

        $display_msg .= '<li class="text-info text-center"><span class="glyphicon glyphicon-ok"></span>  &nbsp;'.$msg.'<li>';
    }
    $display_msg .= '</ul>';
    return $display_msg;
}

function sanitize_string($dirty_string){
    return htmlentities($dirty_string, ENT_QUOTES, "UTF-8");
}


function money($price){
    return '$'.number_format($price, 2);
}


function get_category($child_id){
    $id = sanitize_string($child_id);

    $sql = "SELECT p.id AS 'pid', p.category AS 'parent', c.id AS 'cid', c.category AS 'child' FROM categories c
            INNER JOIN categories p
            ON c.parent = p.id
            WHERE c.id = '$child_id'";

    $sql_run = mysql_query($sql);
    $category = mysql_fetch_array($sql_run);
    return $category;

}


 ?>
