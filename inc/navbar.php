<?php

$sql = "SELECT * FROM categories WHERE parent = 0";
$sql_query = mysql_query($sql);

?>

<div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.php">My Boutique</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
       <?php
          if(mysql_num_rows($sql_query) > 0){
            while($row = mysql_fetch_array($sql_query)){
                $parent_id = $row['id'];
                $category = $row['category'];
                //fetching subcategories using parent id
                $subcat_query = "SELECT *  FROM categories WHERE parent = $parent_id";
                $subcat_query_run = mysql_query($subcat_query);
        ?>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><?php echo ucwords($category); ?> <span class="caret"></span></a>
          <ul class="dropdown-menu">
              <?php
                if(mysql_num_rows($subcat_query_run) > 0){
                  while($subcat_row = mysql_fetch_array($subcat_query_run)){
                        $subcat = $subcat_row['category'];
              ?>
                <li><a href="category.php?cat=<?= $subcat_row['id']; ?>"><?php echo ucwords($subcat); ?></a></li>
              <?php
                    }//End of while loop of subcat
                }//End of if loop of subcat
              ?>

          </ul>
        </li>
        <?php
            }
          }
        ?>
      </ul>
      <ul class="nav navbar-nav navbar-right">
          <?php if(isset($_SESSION['customer_name'])){
              //if customer_name is set the display name
              $cust_name_array = explode(" ", $_SESSION['customer_name']);
              $fname = $cust_name_array[0];

          }
        ?>

        <li><a href="<?= ((isset($fname))?'#':'login.php'); ?>"><?= ((isset($fname))?'Hi, '.ucwords($fname):'Login'); ?> &nbsp;|</a></li>
        <li><a href="<?= ((isset($fname))?'logout.php':'register.php'); ?>" style="margin-left:-20px"><?= ((isset($fname))?'Logout':'Register'); ?></a></li>

        <li><a href="cart.php?cust_id=<?= ((isset($fname))?$_SESSION['customer_id']:''); ?>"><span class="glyphicon glyphicon-shopping-cart" style="font-size:20px;" id="cart"></span></a></li>


      </ul>

      <!-- including this hidden input to check if the session exist with the help of javascript -->
      <input type="hidden" id="session_check" value="<?= ((isset($_SESSION['customer_name']))?'true':'false'); ?>">
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
