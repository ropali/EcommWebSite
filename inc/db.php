<?php
	$db_name = "myboutique";
	$db_user = "root";
	$db_server = "localhost:80800";
	$db_pass = "";

	$conn = mysql_connect($db_server, $db_user, $db_pass);

	if(!$conn){
		die(mysql_error());
	}
	else{
		mysql_select_db($db_name) or die(mysql_error());
	}
	session_start();

	require_once($_SERVER['DOCUMENT_ROOT'].'/ecomm/config.php');
	//require(BASEURL.'helpers/helpers.php');
	require(BASEURL . '/helpers/helpers.php');

	// $cart_id = '';
	// if(isset($_COOKIE[CART_COOKIE])){
	// 	$cart_id = mysql_real_escape_string($_COOKIE[CART_COOKIE]);
	// }


?>
