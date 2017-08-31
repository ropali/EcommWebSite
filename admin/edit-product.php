<?php
    require_once('../inc/db.php');
    require_once('inc/head.php');
    require_once('inc/navbar.php');

    //since this page is completed ...supress all the notice and warning in php due to image upload index problme
    //error_reporting(0);

?>
<?php
    //fetch data for the brand selection dropdown
    $brand_query = "SELECT * FROM brand";
    $brand_query_run = mysql_query($brand_query);

    //fetch data for parent Category selection dropdown
    $parent_cat_query = "SELECT * FROM categories WHERE parent = 0";
    $parent_cat_query_run = mysql_query($parent_cat_query);


    //get the id of the product and display the details in the fields
    if(isset($_GET['edit']) and isset($_GET['parent_id'])){
        $edit_id = (int)$_GET['edit'];
        $parent_id = (int)$_GET['parent_id']; //this id is used to select parent category from dropdown
        //fetch data form db
        $edit_query = "SELECT * FROM products WHERE id = '$edit_id'";
        $edit_query_run = mysql_query($edit_query);
        $edit_row = mysql_fetch_array($edit_query_run);

        $title = $edit_row['title'];
        $brand = $edit_row['brand'];
        $child_cat = $edit_row['categories'];

        //$child = $edit_row[''];
        $price = $edit_row['price'];
        $list_price = $edit_row['list_price'];
        $size_qty = $edit_row['sizes'];
        $desc = $edit_row['description'];
        $edit_img = $edit_row['image'];

        //fetch the brand name with the brand id
        $get_brand_query = mysql_query("SELECT brandname FROM brand WHERE id = '$brand'");
        $brand_row = mysql_fetch_array($get_brand_query);
        $brand_name = $brand_row['brandname'];

    }
    //Get other info from the GET request
    if(isset($_GET['child_name']) and isset($_GET['parent_name']) and isset($_GET['child_id'])){
        $child_cat_name = sanitize_string($_GET['child_name']);
        $parent_cat_name = sanitize_string($_GET['parent_name']);
        $child_id = sanitize_string($_GET['child_id']);
    }
    //if 'child_name' , 'parent_name', ,'parent_id' or 'edit_id' is not set then redirect to products.php
    if(!isset($_GET['edit_id']) and !isset($_GET['parent_id']) and !isset($_GET['child_name']) and !isset($_GET['parent_name'])){
        header("Location : products.php");
    }


    //globaly define all the arrays to store errors and messages
    $errors = array();
    $msg = array();

    //globaly define all the Arrays for size string manipulation
    $sizesArray = array();
    $sArray = array();
    $qArray = array();

    //seprates the sizes and the quantity and set in the modal
    //check if the sizes and qty are set
    if(!empty($size_qty)){
        $sizeString = sanitize_string($size_qty);
        //$sizeString = rtrim(',',$sizeString);


        $sizesArray = explode(',', $sizeString);

        foreach ($sizesArray as $key) {
            $size = explode(':', $key);
            $sArray[] = $size[0];
            $qArray[] = $size[1];

        }

    }


    //process the form
    if(isset($_POST['edit-product'])){

        //form validation
        $reaquired = array('title', 'brand', 'price', 'parent', 'child', 'size_qty');
        foreach ($reaquired as $field) {
            if($_POST[$field] == ''){
                $errors[] .= " All (*) Fields Are Required!";
                break;
            }
        }
        //check image and validate it
        if(!empty($_FILES['photo']['name'])){
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
            //if user dont want to change the picture then add same picture in the database
            if(empty($_FILES['photo']['name'])){
                $imgName = $edit_img;
            }
            else{
                if (!move_uploaded_file($tmp_loc, $imgPath)) {
                    $errors[] .= "Unable To Move File.";
                }
            }


            //get the values from the fields and sanitize them
            $title = mysql_real_escape_string(sanitize_string($_POST['title']));
            $brand = mysql_real_escape_string(sanitize_string($_POST['brand']));
            $parent = mysql_real_escape_string(sanitize_string($_POST['parent']));
            $child = mysql_real_escape_string(sanitize_string($_POST['child']));
            $price = mysql_real_escape_string(sanitize_string($_POST['price']));
            $list_price = mysql_real_escape_string(sanitize_string($_POST['list_price']));
            $size_qty = mysql_real_escape_string($_POST['size_qty']);
            $size_qty = rtrim($size_qty, ',');
            $desc = mysql_real_escape_string(sanitize_string($_POST['desc']));
            $featured = $_GET['featured'];


            //update data into database
            $update_query = "UPDATE products SET title = '$title', price = '$price', list_price = '$list_price', brand = '$brand', categories = '$child', image = '$imgName', description = '$desc', sizes = '$size_qty', featured = '$featured' WHERE id = $edit_id";

            //if query is succesfull then empty all the fields
            if (mysql_query($update_query)) {
                $msg[] .= "Product is updated.";
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
    <h2 class="text-center">Edit A Product</h2><hr>
    <!-- Available brands list -->
    <div class="col-md-3">
        <div class="list-group">
          <ul>
              <li class="list-group-item active">
                Details Of The Product
            </li>
              <li class="list-group-item"><b>Tilte</b> - <? echo ucwords($title); ?></li>
              <li class="list-group-item"><b>Brand</b> - <? echo ucwords($brand_name); ?></li>
              <li class="list-group-item"><b>Price</b> - $<? echo ucwords($price); ?></li>
              <li class="list-group-item"><b>List Price</b> - $<? echo ucwords($list_price); ?></li>
              <li class="list-group-item"><b>Parent Category</b> - <? echo ucwords($parent_cat_name); ?></li>
              <li class="list-group-item"><b>Child Category</b> - <? echo ucwords($child_cat_name); ?></li>


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
              <label for="title">Edit Title<span style="color:red">*</span>:</label>
              <input type="text" class="form-control" id="title" name="title" placeholder="Add a title of product" value="<?= ((isset($title))?$title:'')?>">
            </div>
            <!-- brand selection -->
            <div class="form-group">
              <label for="brand">Edit Brand<span style="color:red">*</span>:</label>
              <select class="form-control" name="brand">
                  <option value=""></option>
                  <?php while($brand_row = mysql_fetch_array($brand_query_run)){ ?>
                  <option value="<?=$brand_row['id']; ?>" <?= (($brand_row['id'] == $brand)?'selected':''); ?>><?=ucwords($brand_row['brandname']); ?></option>
                  <?php } ?>
              </select>
            </div>
            <!-- parent category -->
            <div class="form-group">
              <label for="parent">Edit Parent Category<span style="color:red">*</span>:</label>
              <select class="form-control" name="parent" id="parent">
                  <option value=""></option>
                  <?php while($parent_cat_row = mysql_fetch_array($parent_cat_query_run)){ ?>
                  <option value="<?=$parent_cat_row['id']; ?>" <?=(($parent_cat_row['id'] == $parent_id)?'selected':''); ?>><?=ucwords($parent_cat_row['category']); ?></option>

                  <?php } ?>
              </select>
           </div>

            <!-- child category -->
              <div class="form-group">
                <label for="child">Edit Child Category<span style="color:red">*</span>:</label>
                <select class="form-control" name="child" id="child">
                    <option value=""></option>

                </select>
            </div>

            <!-- price of the product -->
            <div class="form-group">
              <label for="price">Edit Price<span style="color:red">*</span>:</label>
              <input type="text" class="form-control" id="price" name="price" placeholder="Add a price of product" value="<?= ((isset($price))?$price:''); ?>">
            </div>
            <!-- list price of the product -->
            <div class="form-group">
              <label for="list_price">Edit List Price<span style="color:red"></span>:</label>
              <input type="text" class="form-control" id="list_price" name="list_price" placeholder="Add a list price of product" value="<?= ((isset($list_price))?$list_price:''); ?>">
            </div>
            <!-- Add quantity and sizes -->
            <div class="form-group">
              <input type="button" class="form-control btn btn-default" id="addsize" name="addsize" value="Add Sizes And Quntity">
              <br><br>
              <input type="text" name="size_qty" id="size_qty" class="form-control" value="<?= ((isset($size_qty))?$size_qty:''); ?>" placeholder="Preview Of Sizes & Quantity" readonly>
            </div>

            <!-- photo of the product -->
            <div class="form-group">
              <label for="photo">Edit Product Photo<span style="color:red">*</span>:</label>
              <input type="file"  id="photo" name="photo">
            </div>

            <!-- description of the product -->
            <div class="form-group">
              <label for="desc">Edit Description Of Product<span style="color:red">*</span>:</label>
              <textarea name="desc" id="desc" rows="8" cols="80" class="form-control"><?= ((isset($desc))?$desc:'')?></textarea>
            </div>

            <!-- submit button -->
            <button type="submit" name="edit-product" class="btn btn-success">Update Product</button>
            <a href="products.php" class="btn btn-danger">Cancel</a>
        </form>



    </div>

    <!-- Display Image Of The Product -->
    <div class="col-md-3">

        <h3>Product Picture</h3>
        <?php
            if(isset($edit_img)){ ?>
                <img src='../img/products/<?=$edit_img; ?>' class='img img-thumbnail'/><br/><br>

        <? } ?>

    </div>


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
            data: {parentId : parentId},
            success: function(data){
                jQuery('#child').html(data);
            },
            error: function(){ alert("Something went wrong with child category"); },
        });
    }

    jQuery('select[name="parent"]').change(function(){
        get_child_options();
    });

    $('document').ready(function(){
        get_child_options();
    })

</script>


<?php  include('inc/footer.php'); ?>



</body>
</html>
