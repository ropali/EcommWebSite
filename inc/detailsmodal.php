<?php
	require_once('db.php');

	$id = $_POST['id'];
	$id = (int)$id;
	//fetching details of the products for modal view
	$modal_query = "SELECT * FROM products WHERE id = '$id'";
	$modal_query_run = mysql_query($modal_query);
	$modal_product_row = mysql_fetch_array($modal_query_run);
	$brand_id = $modal_product_row['brand'];
	$size_string = $modal_product_row['sizes'];

	$size_array = explode(',', $size_string);
	//fetching brand name from brand table using brand id
	$brand_query = "SELECT brandname FROM brand WHERE id = '$brand_id'";
	$brand_query_run = mysql_query($brand_query);
	$brand_row = mysql_fetch_array($brand_query_run);

?>

<?php ob_start(); ?>

<div class="modal fade details-1" id="details-modal" tabindex="-1" role="dialog" aria-labelledby="details-1">
	<div class="modal-dialog moadal-lg">
		<div class="modal-content">
			<div class="modal-header">
			<button class="close" type="button" onclick="closeModal()" aria-label="close">
				<span aria-hidden="true">&times;</span>
			</button>


			<h4 class="modal-title text-center"><?php echo ucwords($modal_product_row['title']); ?></h4>
			</div>

			<div class="modal-body">
				<div class="container-fliud">
					<div class="row">
						<span id="modal_error"></span>
						<div class="col-sm-6">
							<div class="center-block">
								<img src="img/products/<?php echo $modal_product_row['image']?>" alt="" class="details img-responsive" style="width:90%;">
							</div>
						</div>
						<div class="col-sm-6">
							<h4>Details</h4>
							<p><?php echo ucfirst($modal_product_row['description']); ?></p>
							<p>Price : <b>$<?php echo $modal_product_row['price']?></b></p>
							<p>Brand : <b><?php echo ucwords($brand_row['brandname']); ?></b></p>
							<br>
							<form action="" method="post" id="add_product_form">
								<input type="hidden" name="product_id" id="product_id" value="<?= $id;?>">
								<input type="hidden" name="available" id="available" value="">
								<div class="form-group">
									<label for="quantity">Quantity</label>
									<input type="number" min="0" class="form-control" id="quantity" name="quantity">


								</div>
								<div class="form-group">
									<label for="size" class="text-left">Size</label>
									<select name="size" id="size" class="form-control
									">
										<?php foreach ($size_array as $size) {
											 $sizearray = explode(':', $size);
											 $size = $sizearray[0];
											 $qty = $sizearray[1];

											 echo "<option value=".$size." data-available=".$qty.">".$size."  (Available : ".$qty.")"."</option>";
										} ?>


									</select>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button class="
				btn btn-default" onclick="closeModal()">Close</button>
				<button class="btn btn-warning" onclick="add_to_cart();return false;"><span class="glyphicon glyphicon-shopping-cart"> Add To Cart</span></button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">

	$('#size').ready(function() {
		var available = $('#size option:selected').data('available');
		$('#available').val(available);
		//alert(available+"dssda00");
	});

	$('#size').change(function() {
		var available = $('#size option:selected').data('available');
		$('#available').val(available);
		//alert(available+"dssda00");
	});

	function closeModal(){
		$('#details-modal').modal('hide');
		setTimeout(function(){
			$('#details-modal').remove();
			$('.details-modal').remove();
		}, 500);
	}
</script>
<?php echo ob_get_clean(); ?>
