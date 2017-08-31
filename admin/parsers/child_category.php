<?php
    require_once('../../inc/db.php');
    $parentId = (int)$_POST['parentId'];
    //$selected = ()$_POST['selected'];
    $child_query = mysql_query("SELECT * FROM categories WHERE parent = '$parentId'");
    ob_start();
     ?>

    <option value=""></option>
    <?php while($child_row = mysql_fetch_array($child_query)){ ?>

        <option value="<?=$child_row['id']; ?>"><?=ucwords($child_row['category']); ?></option>

    <?php } ?>

<?php echo ob_get_clean(); ?>
