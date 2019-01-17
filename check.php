<?php
include('connection.php');

?>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <title>HALAL RAISED GOATS</title>
  </head>
  <body>



  <body class="bg-light">
  
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12 pt-5">
        	<h3 class="text-center font-weight-bold">HALAL RAISED GOATS</h3>
          <h5 class="text-center">QR Code Data</h5>
        </div>
       </div>

      <div class="row pt-3">
        <div class="col-md-4"></div>
        <div class="col-md-4">

    <?php 


        $qrcodeid =  $_GET['qrcodeid'];
   
    

        $status = 0;

        if (substr(base64_decode($qrcodeid), 0,10) == "HALALGOATS" ) {
        	$qry = mysqli_query($connection, "select * from livestock_table where liveStockQRId = '" . $qrcodeid  . "'");
          	if (mysqli_num_rows($qry) > 0) {
          		//if qr code is valid and already in used
             	$status = 2;
          	}
          	else
          	{
          		//if qr code is valid and not in used
            	$status = 3;
          	}
       	}

       	else
       	{
       		//code is invalid
        	$status = 1;

       	}

    ?>
      

          <?php if ($status == 1 or $status == 3): ?>
            <p class="text-center">No data found.</p>
          <?php endif ?>

          <?php if ($status == 2): ?>
          	<p class="text-center">Halal raised goat data.</p>
          	<?php $qry = mysqli_query($connection, "select * from livestock_view where liveStockQRId = '" . $qrcodeid . "'"); $res = mysqli_fetch_assoc($qry); ?>

      

          	<div class="form-group">
	          	<label>QR Code ID</label>
	          	<textarea class="form-control" rows = "2" disabled=""><?php echo $res['liveStockQRId']; ?></textarea> 
       		</div>

       		<div class="form-group">
	            <label>Weight</label>
	            <input type="text" class="form-control" value="<?php echo $res['weight']; ?>">
        	</div>

        	<div class="form-group">
	            <label>Sold Date</label>
	            <input type="text" class="form-control" value="<?php echo $res['whenToSold']; ?>">
        	</div>

        	<div class="form-group">
	          	<label>Actual Address and GPS</label>
	          	<textarea class="form-control" rows = "3" disabled=""><?php echo $res['actualAddress'] . "\n" . $res['gps']; ?></textarea> 
       		</div>

       		<div class="form-group">
	            <label>Date added</label>
	            <input type="text" class="form-control" value="<?php echo $res['dateAdded']; ?>">
        	</div>
    		
    		<div class="form-group">
	            <label>Farmer name</label>
	            <input type="text" class="form-control" value="<?php echo $res['farmerName']; ?>">
        	</div>

        	<div class="form-group">
	          	<label>Farmer address</label>
	          	<textarea class="form-control" rows = "2" disabled=""><?php echo $res['farmerAddress']; ?></textarea> 
       		</div>


          <?php endif ?>


   
             

     
      
        </div>
        <div class="col-md-4"></div>

      </div>

        
     
    </div>


    <?php include('footer.php'); ?>

 