<?php
	include('inc/db.php');
	include('inc/head.php');

?>
  <body>

 <nav class="navbar navbar-default navbar-fixed-top" id="navbar">

  <?php include('inc/navbar.php'); ?>

</nav><!--END OF NAVBAR-->

<!--HEADER AND BACKGROUNG IMAGE-->
<div id="headerWrapper" style="height:250px;">
	<div id="back-flower">
		<div id="logotext" style="margin-top:40px;padding:30px"><p>My Boutique</p></div>
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
            //Get the category id to diplay selected child category
            if(isset($_GET['cat'])){
                $cat_id = sanitize_string($_GET['cat']);

            }
            else{
                $cat_id = "";
            }


			//fetch the products of selected category
			$cat_prod_query = "SELECT * FROM products WHERE categories = '$cat_id' AND deleted = 0";
			$cat_prod_query_run = mysql_query($cat_prod_query);

            //Get categories
            $category = get_category($cat_id);//var_dump($category);

			if(mysql_num_rows($cat_prod_query_run) > 0){
		?>

			<div class="col-md-8">
				<h2 class="text-center"><?php echo ucwords($category['parent'] .' ' . $category['child']); ?></h2>
				<?php while($cat_prod_row = mysql_fetch_array($cat_prod_query_run)) {
					$product_id = $cat_prod_row['id'];
					$product_title = $cat_prod_row['title'];
					$product_price = $cat_prod_row['price'];
					$product_list_price = $cat_prod_row['list_price'];
					$product_brand = $cat_prod_row['brand'];
					$product_category = $cat_prod_row['categories'];
					$product_image = $cat_prod_row['image'];
					$product_descp = $cat_prod_row['description'];
					$product_sizes = $cat_prod_row['sizes'];

				?>
				<div class="col-md-4">
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
						echo "<h4 class='text-center'>No Products Available For This Category</h4>";
					}
				?>
			</div>

		<!--RIGHT SIDEBAR-->
		<?php include('inc/rightsidebar.php'); ?>


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

		$('document').ready(function(){
			get_cart_details();
		});

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
			else{
				//if no error occurs then add the product to the cart
				$.ajax({
					url : '/ecomm/admin/parsers/add_cart.php',
					method : 'post',
					data : data,
					success : function(){},
					error : function(){alert("Ooops...something went wrong!!")}
				});
			}

			//call get_cart_details to update the cart
			get_cart_details();
		}
    </script>
  </body>
</html>
