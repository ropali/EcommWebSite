<?php
	require_once('inc/db.php');
	require_once('inc/head.php');
	require_once('helpers/helpers.php');
?>


<?php


    //customer address
    $full_name = mysql_real_escape_string(sanitize_string($_POST['full_name']));
    $contactno = mysql_real_escape_string(sanitize_string($_POST['contactno']));
    $email = mysql_real_escape_string(sanitize_string($_POST['email']));
    $street_addr = mysql_real_escape_string(sanitize_string($_POST['street_addr']));
    $city = mysql_real_escape_string(sanitize_string($_POST['city']));
    $state = mysql_real_escape_string(sanitize_string($_POST['state']));
    $zip_code = mysql_real_escape_string(sanitize_string($_POST['zip_code']));

    //customer credit card details
    $card_name = mysql_real_escape_string(sanitize_string($_POST['card_name']));
    $card_number = mysql_real_escape_string(sanitize_string($_POST['card_number']));
    $cvc = mysql_real_escape_string(sanitize_string($_POST['cvc']));
    $expire_month = mysql_real_escape_string(sanitize_string($_POST['expire_month']));
    $expire_year = mysql_real_escape_string(sanitize_string($_POST['expire_year']));

    //get customer_id to fetch the cart details
    $customer_id = (int)mysql_real_escape_string(sanitize_string($_POST['customer_id']));

    //fetch all the cart details for the customer with customer_id
    $get_cart = "SELECT * FROM cart WHERE customer_id = '$customer_id' AND paid = 0";
    $get_cart_query_run = mysql_query($get_cart);

	//transactions details
	$date_of_purchase = date("d/m/Y");




?>




 <body>

 <nav class="navbar navbar-default navbar-fixed-top" id="navbar">

  <?php include('inc/navbar.php'); ?>

</nav><!--END OF NAVBAR-->

<!--HEADER AND BACKGROUNG IMAGE-->
<div id="headerWrapper" style="height:250px;">
	<div id="back-flower">
		<div id="logotext" style="margin-top:40px;padding:30px"><p>My Boutique - Cart</p></div>
		<div id="for-flower"></div>
	</div>
</div>

<br>

<div class="container">
	<h2 class="text-center">Thank You</h2>
	<p class="text-center">We will send an email of invoice or you can keep the copy of the following.</p>
	<?php if(mysql_num_rows($get_cart_query_run) > 0) {
		while($get_cart_row = mysql_fetch_array($get_cart_query_run)){
			$product_id = $get_cart_row['product_id'];
			$items = $get_cart_row['items'];

			//seprate the items to get the detais
			//we need to decode items as it is in json form
			$json_decoded_items_array = json_decode($items,true);
			//var_dump($json_decoded_items_array);
			$product_id = $json_decoded_items_array[0]["id"];
			$product_size = $json_decoded_items_array[0]["size"];
			$product_qty = $json_decoded_items_array[0]["quantity"];

			//fetch the products details from product table
			$product_query = mysql_query("SELECT title, price, sizes FROM products WHERE id = '$product_id'");
			$product_query_row = mysql_fetch_array($product_query);

			$product_name = ucwords($product_query_row["title"]);


			//generate random numbers for invoice
			$invoice_id = rand(100000, 999999);

			//calculate the tax for products
			$product_price = $product_query_row["price"];

			$service_tax = round($product_price * 8/100, 2);
			$state_tax = round($product_price * 12/100, 2);

			$product_price = $product_price - ($service_tax + $state_tax);

			$total = $product_price + ($service_tax + $state_tax);

			//check if the quantity is more than 1
			if($product_qty > 1){
				$total = $product_qty * $total;
			}
			$total = money($total);

			//save the transaction in database

			/*
				convert address details into array
				then convert the array int json to store in the db
			*/
			$address_array = array(
				"street" 	=> $street_addr,
				"city"		=> $city,
				"state" 	=> $state,
				"zip_code"  => $zip_code
			);
			$json_encoded_adress = json_encode($address_array);

			//to store the product details store the same json object as in the cart

			$insert_query = "INSERT INTO transactions (customer_name, address, contact_no, email, product_details, total_amount, invoice_id, date_of_purchase) VALUES ('$full_name', '$json_encoded_adress', '$contactno', '$email', '$items', '$total', '$invoice_id', '$date_of_purchase')";

			$insert_query_run = mysql_query($insert_query);


			//decreament the the quantity of the product after purchase
			//after that update the product table
			// $updated_qty = "";
			// $sizes_n_qty_array = explode(",", $product_query_row['sizes']);
			// foreach ($sizes_n_qty_array as $qty) {
			// 	$qtyArray = explode(":", $qty){
			// 		$old_qty = $qtyArray[1];
			// 		if($product_size == $qtyArray[0] and $product_qty == $old_qty){
			// 			$updated_qty = $old_qty - $product_qty;
			// 		}
			// 	}
			// }



			//update the paid column in the cart table to reflect the purchase
			$update_cart_query = mysql_query("UPDATE cart SET paid = 1 WHERE customer_id = '$customer_id'");


	?>

	<div class="row" style="margin-top:40px">

        <div class="col-md-2">

        </div>


		<!--MAIN CONTENT-->

			<div class="col-md-8">

                <br>

                <div class="row">
                    <div class="col-sm-6">
                        <p style="font-size:20px;"><b>My Boutique</b></p>
                        <p><small>Mumbai - 421003</small></p>
                        <p><small>Maharashtra - 421003</small></p>
                        <p><small>ph - 123456</small></p>
                    </div>
                    <div class="col-sm-6">
                        <p><b>INVOICE</b></p>
                        <table class="table table-condensed table-bordered">
                            <tr>
                                <th>INVOICE ID#</th>
                                <th>DATE</th>
                            </tr>
                            <tr>
                                <td><?= $invoice_id; ?></td>
                                <td><?= $date_of_purchase; ?></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-sm-6">
                        <!-- Billing address -->
                        <p style="border:1px solid grey;width:180px;background:grey;padding-left:8px;">BILL TO</p>
                        <p>Name : <?= ucwords($full_name); ?></p>
                        <p>Conatact No : <?= $contactno; ?></p>
                        <p>Street Address : <?= ucwords($street_addr); ?></p>
                        <p>City : <?= ucwords($city); ?></p>
                        <p>State : <?= ucwords($state); ?></p>
                        <p>Zip code : <?= $zip_code; ?></p>

                    </div>
                    <div class="col-sm-6">
                        <!-- nothing to do -->
                    </div>
                </div>

                <br><br>

                <div class="row">
                  <div class="col-md-12">
                      <div class="row">
                        <div class="col-sm-8">
                            <p style="border:1px solid grey;width:100%;background:grey;padding-left:8px">DESCRIPTION</p>
                            <p><b>Product Name : </b></p>
                            <p><b>Product Price : </b></p>
                            <p><b>Product Quantity : </b></p>
                            <p><b>Service Tax : </b></p>
                            <p><b>State Tax : </b></p>

                            <br><br><br><br>
                            <p style="font-style:italic;">Thanks For Shpopping With Us</p>
                        </div>
                        <div class="col-sm-4">
                            <p style="border:1px solid grey;width:100%;background:grey;padding-left:8px" class="text-center">AMOUNT</p>

                            <p class="text-center"><?= $product_name; ?></p>
                            <p class="text-center">$<?= $product_price; ?></p>
                            <p class="text-center"><?= ucfirst($product_qty); ?></p>
                            <p class="text-center">$<?= $service_tax; ?></p>
                            <p class="text-center">$<?= $state_tax; ?></p>
                            <br><br><br><br>

                            <p><b>TOTAL : <?= $total; ?></b></p>
                        </div>
                      </div>
                  </div>
                </div>
			</div>



            <div class="col-md-2">

            </div>

	</div>
	<?
			}//end of while loop
		}//end of if loop
	?>
</div>






<!--FOOTER-->
<?php include('inc/footer.php'); ?>

<!--MODAL DETAILS-1-->
<?php //include('inc/detailsmodal.php'); ?>


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>



  </body>
</html>
