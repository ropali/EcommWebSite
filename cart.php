<?php
	require_once('inc/db.php');
	require_once('inc/head.php');
	require_once('helpers/helpers.php');
?>
<?php
	$customer_id = (int)$_GET['cust_id'];

	if(isset($_GET['history'])){
		$customer_id = (int)$_GET['history'];
	}

	if (isset($_GET['history'])) {
		//if the customer want to view the shopping history
		$get_products_query = "SELECT * FROM cart WHERE customer_id = '$customer_id' AND paid = 1 ORDER BY id DESC";
		echo "string";
	}
	else {
		//fetch all the prodcuts with customer_id
		$get_products_query = "SELECT * FROM cart WHERE customer_id = '$customer_id' AND paid = 0 ORDER BY id DESC";

	}

	$get_products_query_run = mysql_query($get_products_query);
	$item_count = mysql_num_rows($get_products_query_run);


	//define $total_cost to track total cost in the cart
	$total_cost = '';

	//Define arrays to store various errors and msgs
	$msg = array();

	//Delete items from the cart
	if (isset($_GET['delete']) and isset($_SESSION)) {
		$delete_id = mysql_real_escape_string($_GET['delete']);

		//Delete cart row with the delete_id
		$delete_cart_query = mysql_query("DELETE FROM cart WHERE id = '$delete_id'");

		$msg[] .= ucwords("1 item deleted from the cart");
		$display = display_msg($msg);
		header("refresh:1;url=cart.php?cust_id=$customer_id");

	}
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
	<div class="">
		<?= ((isset($display))?$display:''); ?>
	</div>
	<div class="row" style="margin-top:40px">

		<!--MAIN CONTENT-->
			<div class="col-md-8">
				<?php if($item_count > 0){
					while ($get_products_row = mysql_fetch_array($get_products_query_run)) {

						$product_id = $get_products_row['product_id'];
						$cart_id = $get_products_row['id'];


						//Items is in the json form.make it php array
						$items_json_encoded_array = $get_products_row['items'];
						$json_decoded_items_array = json_decode($items_json_encoded_array,true);

						//seprate the array value
						$item_id = $json_decoded_items_array[0]['id'];
						$item_size = $json_decoded_items_array[0]['size'];
						$item_quantity = $json_decoded_items_array[0]['quantity'];

						/*
							fetch the size from the producst table
							seprate sizes to get the user desired size
							check the availablability of quantity of that size
						*/
						$available_qty = "";
						$sizes_query = mysql_query("SELECT sizes FROM products WHERE id = '$product_id'");
						$sizes_row = mysql_fetch_array($sizes_query);

						if($item_quantity != ""){

							$size_array = explode(",", $sizes_row['sizes']);

							foreach ($size_array as $size) {
								$qty_array = explode(":", $size);
								$stored_size = $qty_array[0];
								$stored_qty = $qty_array[1];
								//echo "$stored_size\n";

								//echo "$item_size\n";


								if($stored_size == $item_size){
									$available_qty = $stored_qty;
								}
							}
						}

						//var_dump($item_quantity);

						//fetch the items details from products table in database with the $item_id
						$fetch_products = mysql_query("SELECT title, price,brand, image FROM products WHERE id = '$item_id' AND deleted = 0");
						$fetch_products_row = mysql_fetch_array($fetch_products);

						$product_title = $fetch_products_row['title'];
						$product_price = $fetch_products_row['price'];
						$product_image = $fetch_products_row['image'];
						$brand_id = $fetch_products_row['brand'];

						//now fetch brandname from the brand table with the brand_id
						$brand_query = mysql_query("SELECT brandname FROM brand WHERE id = '$brand_id'");
						$brand_row = mysql_fetch_array($brand_query);

						if($item_quantity > 1){
								$total_cost = $total_cost + ($item_quantity * $product_price);
						}
						else {
							$total_cost = $total_cost + $product_price;
						}

				?>
					<div class="row" style="margin-left:40px">
					    <div class="col-md-4">
                            <!-- Image of the product -->
                            <img src="img/products/<?= $product_image; ?>" alt="" class="img img-responsive" style="width:60%;height:120px"/>
					    </div>
					    <div class="col-md-8">
                            <h4><?= ucwords($product_title); ?></h4>
                            <p class="price"><b>Price</b> : $<?= $product_price; ?></p>
        					<p><b>Brand</b> : <?= ucwords($brand_row['brandname']); ?></p>
							<p><b>Size</b> : <?= ucfirst($item_size); ?></p>

							<!-- //if it is history then dont show quantity buttons -->
							<?php if(!isset($_GET['history'])){ ?>
                            <p><b>Quantity</b> : <button <?= (($item_quantity <= 0)?'disabled':''); ?> onclick="update_cart('removeone', '<?= $product_id; ?>', '<?= $customer_id; ?>', '<?= $item_size; ?>')" class="btn btn-default btn-xs"><?= (($item_quantity <= 1)?'<span class="text-danger">Min</span>':'-'); ?></button> <?= $item_quantity; ?>
								 <button class="btn btn-default btn-xs" <?= (($item_quantity >= $available_qty)?'disabled':''); ?> onclick="update_cart('addone', '<?= $product_id; ?>', '<?= $customer_id; ?>', '<?= $item_size; ?>')"><?= (($item_quantity >= $available_qty)?'<span class="text-danger">Max</span>':'+'); ?></button></p>

							<a href="cart.php?delete=<?= $cart_id; ?>&cust_id=<?= $customer_id; ?>" class="btn btn-danger btn-xs">Remove Form Cart</a>
							<? }
								else{
							 ?>

							 <p><b>Quantity</b> : <?= $item_quantity; ?> </p>


							 <? } ?>


					    </div>
					</div><hr>


				<?php
					}//End of while loop
				}//End of if loop
				else if ($item_count == 0) {
					$info = ((isset($_GET['history']))?'You Haven\'t Purchased Anything Yet!':'Your Cart Is Empty');
					echo "<h2 class='text-center'>". $info. "</h2>";
				}

				if(!isset($_GET['history'])){


				 ?>

				 <a href="#" class="btn btn-success pull-right" data-toggle="modal" data-target="#checkoutModal" <?= ((isset($_SESSION['customer_id']))?'':'disabled'); ?> <?= (($item_count != 0)?'':'disabled'); ?>><span class="glyphicon glyphicon-shopping-cart"></span> Check Out</a>

				 <? } ?>
			</div>

			<!--LEFT SIDE BAR-->
			<div class="col-md-4" style="margin-left:-20px">
				<div class="list-group">
				  <li class="list-group-item active">
				    <span class="glyphicon glyphicon-shopping-cart"></span> Cart Details
				</li>
				  <li class="list-group-item"><b><span class="glyphicon glyphicon-list-alt"></span> Total Items</b> <span class="badge"><?= ((!empty($item_count))?$item_count:'0'); ?></span></li>
				  <li class="list-group-item"><b><span class="glyphicon glyphicon-tag"></span> Total Cost</b> <span class="badge">$<?= ((!empty($total_cost))?$total_cost:'0.0'); ?></span></li>
				  <a href="cart.php?history=<?= $customer_id; ?>" class="list-group-item"><b><span class="glyphicon glyphicon-calendar"></span> View History</b></a>
				</div>
			</div>

	</div>
</div>


<!-- Checkout modal -->

<div class="modal fade" id="checkoutModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Shipping Address</h4>
      </div>
      <div class="modal-body">
        <div class="row">
			<form class="" action="thankYou.php" method="post" id="payment-form">
				<div id="error">

				</div>
				<div id="step1" style="display:block">
					<input type="hidden" name="customer_id" value="<?= $customer_id; ?>">
					<div class="col-md-6 form-group">
						<label for="full_name">Full Name:<span style="color:red">*</span></label>
						<input type="text" name="full_name" id="full_name" class="form-control" value="<?= ((isset($_POST['full_name'])?$_POST['full_name']:'')); ?>">
					</div>
					<div class="col-md-6 form-group">
						<label for="contactno">Contact No:<span style="color:red">*</span></label>
						<input type="text" name="contactno" maxlength="10" id="contactno" class="form-control" value="<?= ((isset($_POST['contactno'])?$_POST['contactno']:'')); ?>">
					</div>
					<div class="col-md-6 form-group">
						<label for="email ">Email:<span style="color:red">*</span></label>
						<input type="email" name="email" id="email" class="form-control" value="<?= ((isset($_POST['email'])?$_POST['email']:'')); ?>">
					</div>

					<div class="col-md-6 form-group">
						<label for="street_addr">Street Address:<span style="color:red">*</span></label>
						<input type="text" name="street_addr" id="street_addr" class="form-control" value="<?= ((isset($_POST['street_addr'])?$_POST['street_addr']:'')); ?>">
					</div>
					<div class="col-md-6 form-group">
						<label for="city">City:<span style="color:red">*</span></label>
						<input type="text" name="city" id="city" class="form-control" value="<?= ((isset($_POST['city'])?$_POST['city']:'')); ?>">
					</div>
					<div class="col-md-6 form-group">
						<label for="state">State:<span style="color:red">*</span></label>
						<input type="text" name="state" id="state" class="form-control" value="<?= ((isset($_POST['state'])?$_POST['state']:'')); ?>">
					</div>
					<div class="col-md-6 form-group">
						<label for="zip_code">Zip Code:<span style="color:red">*</span></label>
						<input type="text" name="zip_code" id="zip_code" class="form-control" value="<?= ((isset($_POST['zip_code'])?$_POST['zip_code']:'')); ?>">
					</div>

				</div>
				<div id="step2" style="display:none">
					<div class="form-group col-md-3">
					  <label for="name">Name On Card:<span style="color:red">*</span></label>
					  <input type="text" name="card_name" class="form-control" id="card_name" placeholder="" required>
					</div>
					<div class="form-group col-md-3">
					  <label for="card_number">Card Number:<span style="color:red">*</span></label>
					  <input type="text" name="card_number" class="form-control" id="card_number" required>
					</div>
					<div class="form-group col-md-2">
					  <label for="cvc">CVC:</label>
					  <input type="text" name="cvc" class="form-control" id="cvc" required>
					</div>

					<div class="form-group col-md-2">
					  <label for="expire_month">Expire Month:<span style="color:red">*</span></label>
					  <select class="" id="expire_month" name="expire_month" required>
						  <option value="">--select--</option>
						  <?php  for($i = 1;$i <= 12;$i++){ ?>
							  <option value="<?= $i; ?>"><?= $i; ?></option>
						  <?php } ?>
					  </select>
					</div>

					<div class="form-group col-md-2">
					  <label for="expire_year">Expire Year:<span style="color:red">*</span></label>
					  <select class="" id="expire_year" name="expire_year" required>
						  <option value="">--select--</option>
						  <?php
						  		$year = date('Y');
						  		for($i = 0;$i <= 11;$i++){
							?>
							  <option value="<?= $year + $i; ?>"><?= $year + $i; ?></option>
						  <?php } ?>
					  </select>
					</div>

				</div>

        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="close_button">Close</button>
        <button type="button" class="btn btn-primary" onclick="check_address()" id="next_button">Next</button>
		<button type="button" class="btn btn-default" onclick="back_address()" id="back_button" style="display:none">Back</button>
		<button type="submit" class="btn btn-primary" onchange="check_card_details()" id="check_out_button" style="display:none">Check Out</button>
      </div>
	   </form>
    </div>
  </div>
</div>


<!--FOOTER-->
<?php include('inc/footer.php'); ?>

<!--MODAL DETAILS-1-->
<?php //include('inc/detailsmodal.php'); ?>


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>


    <script>
		//defaultPrevented();



		function back_address(){
			$('#error').html("");
			$('#step1').css("display", "block");
			$('#step2').css("display", "none");
			$('#next_button').css("display", "inline-block");
			$('#close_button').css("display", "inline-block");
			$('#back_button').css("display", "none");
			$('#check_out_button').css("display", "none");
			$('#myModalLabel').html("Shiping Address");
		}

		//check all fields for shipping Address
		function check_address(){
			var data = { 'full_name' : $('#full_name').val(),
						 'contactno' : $('#contactno').val(),
						 'email' : $('#email').val(),
						 'street_addr' : $('#street_addr').val(),
						 'city' : $('#city').val(),
						 'state' : $('#state').val(),
						 'zip_code' : $('#zip_code').val(),
						};

			$.ajax({
				url : '/ecomm/admin/parsers/check_address.php',
				method : 'post',
				data : data,
				success : function(data){
					if(data != 'passed'){
						$('#error').html(data);
					}
					if(data == 'passed'){
						$('#error').html("");
						$('#step1').css("display", "none");
						$('#step2').css("display", "block");
						$('#next_button').css("display", "none");
						$('#close_button').css("display", "none");
						$('#back_button').css("display", "inline-block");
						$('#check_out_button').css("display", "inline-block");

						//change the header
						$('#myModalLabel').html("Enter Your Card Details");
					}
				},
				error : function(){
					alert('Oops..Someting went wrong!!');
				}
			});
		}

		//update cart if the quantity is increased or decreased
		function update_cart(mode, edit_id, customer_id, edit_size) {
			var data = {"mode" : mode, "edit_id" : edit_id, "customer_id" : customer_id, "edit_size" : edit_size};

			$.ajax({
				url : '/ecomm/admin/parsers/update-cart.php',
				method : 'post',
				data : data,
				success : function () {

					location.reload();
				},
				error : function (){alert("Can't update quantity...Someting went wrong");}
			});

		}

		function check_card_details(){
			var card_name = document.getElementById("card_name").value;
			var card_number = document.getElementById("card_number").value;
			var cvc = document.getElementById("cvc").value;
			var expire_month = document.getElementById("expire_month").value;
			var expire_year = document.getElementById("expire_year").value;

			if(card_name == "" || card_number == "" || cvc == "" || expire_month == "" || expire_month == ""){
				alert("All The Fields Are Required!!!");
				return false;
			}

			if(isNaN(card_number)){
				alert("Card Number Must Be In Numbers!!");
				return false;
			}

			return true;





		}
    </script>
  </body>
</html>
