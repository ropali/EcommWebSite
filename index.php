<?php
	include('inc/db.php');
	include('inc/head.php');


?>
  <body>

 <nav class="navbar navbar-default navbar-fixed-top" id="navbar">

  <?php include('inc/navbar.php'); ?>

</nav><!--END OF NAVBAR-->

<!--HEADER AND BACKGROUNG IMAGE-->
<div id="headerWrapper">
	<div id="back-flower">
		<div id="logotext"><p>My Boutique</p></div>
		<div id="for-flower"></div>
	</div>
</div>

<br>

<div class="container">
	<div class="row">
		<!--LEFT SIDE BAR-->
		<?php include('inc/leftsidebar.php'); ?>

		<!--MAIN CONTENT-->
		<?php
			//fetch the featrued products
			$feat_prod_query = "SELECT * FROM products WHERE featured = 1 AND deleted = 0";
			$feat_prod_query_run = mysql_query($feat_prod_query);

			if(mysql_num_rows($feat_prod_query_run) > 0){

		?>
		<div class="col-md-8">
			<div class="row">
				<h2 class="text-center">Featured Products</h2>
				<?php while($feat_prod_row = mysql_fetch_array($feat_prod_query_run)) {
					$product_id = $feat_prod_row['id'];
					$product_title = $feat_prod_row['title'];
					$product_price = $feat_prod_row['price'];
					$product_list_price = $feat_prod_row['list_price'];
					$product_brand = $feat_prod_row['brand'];
					$product_category = $feat_prod_row['categories'];
					$product_image = $feat_prod_row['image'];
					$product_descp = $feat_prod_row['description'];
					$product_sizes = $feat_prod_row['sizes'];

				?>
				<div class="col-md-3">
					<h4><?php echo ucwords($product_title); ?></h4>
					<img src="img/products/<?php echo $product_image; ?>" alt="<?php echo ucwords($product_title); ?>" class="img-thumbnail" />
					<p class="list-price text-danger">List Price : <s>$<?php echo $product_list_price; ?></s></p>
					<p class="price">Our Price : <?php echo "$".$product_price; ?></p>
					<input type="button" class="btn btn-success" value="Details" onclick="detailsmodal(<?= $product_id; ?>)">
				</div>

				<?php
						}//end of while loop

					}//end of if loop
					else{
						echo "<h3 class='text-center'>No Featured Products Available</h3>";
					}
				?>
			</div>
		</div>
		<!--RIGHT SIDEBAR-->
		<?php include('inc/rightsidebar.php'); ?>


	</div>
</div>

<!--FOOTER-->
<?php include('inc/footer.php'); ?>



    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script>
    	// $(window).scroll(function(){
    	// 	var vscroll = $(this).scrollTop();
    	// 	//console.log(vscroll);
    	// 	$('#logotext').css({
    	// 		"font-size":"translate("+vscroll/2+"px)";
    	// 	});
    	// })
    </script>

    <script>
    	//script for detaismodal on click
    	function detailsmodal(id){
    		var data = { "id" : id };
				$.ajax({
					url : "inc/detailsmodal.php",
					method : "post",
					data : data,
					success : function(data){
						$('body').append(data);
						$('#details-modal').modal('toggle');
					},
					error : function(){
						alert("Ooops someting went wrong...");

					}
				});
    	}

		//check if the user is logged in then only  add product to the cart
		function check_session(){
			var isSessionSet = $('#session_check').val();
			if(isSessionSet == 'true'){
				return true;
			}
			else {
				return false;
			}
		}

		function get_cart_details(){
			//check if session exist
			if(check_session() != false){
				//get user id of the current session
				var data = <?= ((isset($_SESSION['customer_id']))?$_SESSION['customer_id']:''); ?>

				$.ajax({
					url : '/ecomm/admin/parsers/get_cart_details.php',
					method : 'post',
					data : { customer_id : data },
					success : function(data){
						$('#cart').html(data);

					},
					error : function(){ alert("Ooops..something went wrong!!"); }
				});

		}
	}

		//fire ajax query to get the cart detaila i.e if the user has items in cart
		function add_to_cart(){
			$('#modal_error').html("");
			var size = $('#size').val();
			var qty = $('#quantity').val();
			var available = $('#available').val();
			var error = '';
			var data = $('#add_product_form').serialize();
			//alert(size + qty + available);

			if(size == '' || qty == '' || qty == 0){
				error += '<p class="text-danger text-center">You must choose size and quantity.</p>';
				$('#modal_error').html(error);
				return;
			}
			else if (qty != '' && qty > available) {
				error += '<p class="text-danger text-center">There are only '+available+' available.</p>';
				$('#modal_error').html(error);
				return;
			}
			else if (check_session() == false) {
				alert("Please log in to buy products...");
			}
			else{
				//if no error occurs then add the product to the cart
				error += '<p class="text-success text-center">Product is added to the cart.</p>';

				$('#modal_error').html(error);
				$.ajax({
					url : '/ecomm/admin/parsers/add_cart.php',
					method : 'post',
					data : data,
					success : function(){
						//location.reload();
					},
					error : function(){alert("Ooops...something went wrong!!")}
				});

				//call get_cart_details to update the cart
				get_cart_details();

			}
		}

		//also fire ajax query to get the cart details at the start of the site
		$('document').ready(function(){
				get_cart_details();


		});

    </script>

  </body>
</html>
