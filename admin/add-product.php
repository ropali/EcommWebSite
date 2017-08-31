<?php
    require_once('../inc/db.php');
    require_once('inc/head.php');
    require_once('inc/navbar.php');

    //since this page is completed ...supress all the notice and warning in php due to image upload index problme
    error_reporting(0);

?>
<?php
    //fetch data for the brand
    $brand_query = "SELECT * FROM brand";
    $brand_query_run = mysql_query($brand_query);

    //fetch data for parent Category
    $parent_cat_query = "SELECT * FROM categories WHERE parent = 0";
    $parent_cat_query_run = mysql_query($parent_cat_query);

    //fetch the available products
    $available_prod_query = mysql_query("SELECT brandname FROM brand");

    //fetch the available categories
    $available_cat_query = mysql_query("SELECT category FROM categories");



    //process the form
    if(isset($_POST['add-product']) and isset($_SESSION['user'])){
        //array to store the errors
        $errors = array();
        $msg = array();

        //check if the sizes and qty are set
        if(!empty($_POST['size_qty'])){
            $sizeString = sanitize_string($_POST['size_qty']);
            //remove the last comma from the string
            $sizeString = rtrim($sizeString, ',');

            $sizesArray = explode(',', $sizeString);
            $sArray = array();
            $qArray = array();

            foreach ($sizesArray as $key) {
                $size = explode(':', $key);
                $sArray[] = $size[0];
                $qArray[] = $size[1];

            }
        }
        else{
            $sizesArray = array();
        }

        //form validation
        $reaquired = array('title', 'brand', 'price', 'parent', 'child', 'size_qty');
        foreach ($reaquired as $field) {
            if($_POST[$field] == ''){
                $errors[] .= " All (*) Fields Are Required!";
                break;
            }
        }
        //check image and validate it
        if(!empty($_FILES)){
            //var_dump($_FILES);
            $photo = $_FILES['photo'];
            $name = $photo['name'];
            $nameArray = explode('.', $name);
            $fileName = $nameArray[0];
            $fileExt = $nameArray[1];
            $tmp_loc = $photo['tmp_name'];
            $fileSize = $photo['size'];
            $mime = explode('/', $photo['type']);
            $mimeType = $mime[0];
            $mimeExt = $mime[1];
            $allowed_img_type = array('png' ,'jpg', 'jpeg', 'gif');
            $imgName = $fileName . md5(microtime()) .'.'. $fileExt;
            $imgPath = '/opt/lampp/htdocs/ecomm/img/products/' . $imgName;
            //check if it is other than image
            if($mimeType != 'image'){
                $errors[] .= "The File Must Be An Image!";
            }
            //check if the file ext is in the allowes array
            if(!in_array($fileExt, $allowed_img_type)){
                $errors[] .= 'The File Extension Must Be png, jpg, jpeg or gif!';
            }
            //check the file size.it must be less than 1MB
            if ($fileSize > 1000000) {
                $errors[] .= "Image Must Be Less Then 1MB.";
            }
            //check if the mime ext is same as file ext
            if ($fileExt != $mimeExt && ($mimeExt == 'jpeg' and $fileExt != 'jpg')) {
                $errors[] .= "File Extension Does Not Match With The File!";
            }
        }
        //if error occured display it
        if(!empty($errors)){
            $display = display_errors($errors);
        }
        else{
            //upload image and inseert into database
            if (move_uploaded_file($tmp_loc, $imgPath)) {
                $errors[] .= "Unable To Move File.";
            }

            //get the values from the fields and sanitize them
            $title = mysql_real_escape_string(sanitize_string($_POST['title']));
            $brand = mysql_real_escape_string(sanitize_string($_POST['brand']));
            $parent = mysql_real_escape_string(sanitize_string($_POST['parent']));
            $child = mysql_real_escape_string(sanitize_string($_POST['child']));
            $price = mysql_real_escape_string(sanitize_string($_POST['price']));
            $list_price = mysql_real_escape_string(sanitize_string($_POST['list_price']));
            $size_qty = mysql_real_escape_string(sanitize_string($_POST['size_qty']));
            $size_qty = rtrim($size_qty, ",");
            $desc = mysql_real_escape_string(sanitize_string($_POST['desc']));
            $featured = $_POST['featured'];

            if ($featured != 1) {
                $featured = 0;
            }

            //insert data into database
            $insert_query = "INSERT INTO products (title, price, list_price, brand, categories, image, description, sizes, featured) VALUES ('$title', '$price', '$list_price', '$brand', '$child', '$imgName', '$desc', '$size_qty', '$featured')";

            //if query is succesfull then empty all the fields
            if (mysql_query($insert_query)) {
                $msg[] .= "A new product added to the database.";
                $display = display_msg($msg);

                //empty all the fields
                $title = "";
                $brand = "";
                $parent = "";
                $child = "";
                $price = "";
                $list_price = "";
                $size_qty = "";
                $desc = "";
                $featured = 0;
            }
        }
    }
 ?>


<body>
<nav class="navbar navbar-default navbar-fixed-top">

<?php include('inc/navbar.php'); ?>
</nav><!--END OF NAVBAR-->

<div class="container" style="height:600;">
    <h2 class="text-center">Add A Product</h2><hr>
    <!-- Available brands list -->
    <div class="col-md-3">
        <div class="list-group">
          <ul>
              <li class="list-group-item active">
                Available Brands
            </li>
            <?php while($available_prod_row = mysql_fetch_array($available_prod_query)){ ?>
              <li class="list-group-item"><? echo ucwords($available_prod_row['brandname']); ?></li>

              <?php } ?>
              </ul>
        </div>



    </div>

    <!-- form to add a new product -->
    <div class="col-md-6">
        <div class="error"><!--Display errors here..-->
            <?= ((isset($display))?$display:''); ?>
        </div>

        <form action="" class="form" method="post" enctype="multipart/form-data">
            <div class="form-group">
              <label for="title">Title<span style="color:red">*</span>:</label>
              <input type="text" class="form-control" id="title" name="title" placeholder="Add a title of product" value="<?= ((isset($title))?$title:'')?>">
            </div>
            <!-- brand selection -->
            <div class="form-group">
              <label for="brand">Brand<span style="color:red">*</span>:</label>
              <select class="form-control" name="brand">
                  <option value=""></option>
                  <?php while($brand_row = mysql_fetch_array($brand_query_run)){ ?>
                  <option value="<?=$brand_row['id']; ?>"><?=ucwords($brand_row['brandname']); ?></option>
                  <?php } ?>
              </select>
            </div>
            <!-- parent category -->
            <div class="form-group">
              <label for="parent">Parent Category<span style="color:red">*</span>:</label>
              <select class="form-control" name="parent" id="parent">
                  <option value=""></option>
                  <?php while($parent_cat_row = mysql_fetch_array($parent_cat_query_run)){ ?>
                  <option value="<?=$parent_cat_row['id']; ?>"><?=ucwords($parent_cat_row['category']); ?></option>

                  <?php } ?>
              </select>
           </div>

            <!-- child category -->
              <div class="form-group">
                <label for="child">Child Category<span style="color:red">*</span>:</label>
                <select class="form-control" name="child" id="child">
                    <option value=""></option>

                </select>
            </div>

            <!-- price of the product -->
            <div class="form-group">
              <label for="price">Price<span style="color:red">*</span>:</label>
              <input type="text" class="form-control" id="price" name="price" placeholder="Add a price of product" value="<?= ((isset($price))?$price:''); ?>">
            </div>
            <!-- list price of the product -->
            <div class="form-group">
              <label for="list_price">List Price<span style="color:red"></span>:</label>
              <input type="text" class="form-control" id="list_price" name="list_price" placeholder="Add a list price of product" value="<?= ((isset($price_list))?$price_list:''); ?>">
            </div>
            <!-- Add quantity and sizes -->
            <div class="form-group">
              <input type="button" class="form-control btn btn-default" id="addsize" name="addsize" value="Add Sizes And Quntity">
              <br><br>
              <input type="text" name="size_qty" id="size_qty" class="form-control" value="<?= ((isset($size_qty))?$size_qty:''); ?>" placeholder="Preview Of Sizes & Quantity" readonly>
            </div>

            <!-- photo of the product -->
            <div class="form-group">
              <label for="photo">Product Photo<span style="color:red">*</span>:</label>
              <input type="file"  id="photo" name="photo">
            </div>

            <!-- description of the product -->
            <div class="form-group">
              <label for="desc">Description Of Product<span style="color:red">*</span>:</label>
              <textarea name="desc" id="desc" rows="8" cols="80" class="form-control"><?= ((isset($desc))?$desc:'')?></textarea>
            </div>

            <!-- make it feature productt or not -->
            <div class="form-group">
              <label for="featured">Do wish to make it featured<span style="color:red">*</span>:</label>
              <input type="radio" name="featured" value="1">Yes
              <input type="radio" name="featured" value="0">No
            </div>

            <!-- submit button -->
            <button type="submit" name="add-product" class="btn btn-success">Add Product</button>
            <a href="products.php" class="btn btn-danger">Cancel</a>
        </form>



    </div>

    <div class="col-md-3"></div>


</div>

<!-- Modal -->
<div class="modal fade" id="sizesModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Sizes & Quantity</h4>
      </div>
      <div class="modal-body">
          <div class="container-fluid">

          <?php for($i = 1;$i <= 12;$i++){ ?>

              <div class="form-group col-md-4">
                <label for="size<?=$i; ?>">Size<span style="color:red;">*</span></label>
                <input type="text" class="form-control" id="size<?=$i; ?>" value="<?= ((!empty($sArray[$i -1 ]))?$sArray[$i - 1]:''); ?>">
              </div>

              <div class="form-group col-md-2">
                <label for="qty<?=$i; ?>">Quantity<span style="color:red;">*</span></label>
                <input type="number" class="form-control" id="qty<?=$i; ?>" value="<?= ((!empty($qArray[$i -1 ]))?$qArray[$i - 1]:''); ?>" min="0">
              </div>


          <?php } ?>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="save">Save changes</button>
      </div>
    </div>
  </div>
</div>



<script type="text/javascript">
    $('document').ready(function () {
       $('#addsize').click(function () {
               $('#sizesModal').modal('toggle');
       });
     });

     $('document').ready(function () {
        $('#save').click(function () {
                $('#sizesModal').modal('toggle');
                updateSizes();
        });
      });

      function updateSizes(){
          var sizeString = '';

          for(var i = 1;i <= 12;i++){
              if($('#size' + i).val() != '' && $('#qty' + i).val() != ''){
                  sizeString += $('#size'+i).val() + ':' + $('#qty'+i).val() + ',';
              }
          }
          $('#size_qty').val(sizeString);
      }


    function get_child_options(){
        var parentId = jQuery('#parent').val();
        jQuery.ajax({
            url:'/ecomm/admin/parsers/child_category.php',
            type:'POST',
            data: {parentId : parentId },
            success: function(data){
                jQuery('#child').html(data);
            },
            error: function(){ alert("Something went wrong with child category"); },
        });
    }

    jQuery('select[name="parent"]').change(get_child_options);
</script>


<?php  include('inc/footer.php'); ?>



</body>
</html>
