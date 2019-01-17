<?php include('header.php'); ?>
  <body class="bg-light">
  
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12 pt-5">
        	<a href="menu.php"><button type="text" class="btn btn-block btn-warning mb-4">Back</button></a>
          <h5 class="text-center font-weight-bold">QR CODE DATA</h5>
        </div>
       </div>

      <div class="row pt-3">
        <div class="col-md-4"></div>
        <div class="col-md-4">

    <?php 

 		$mylocation =  $_GET['mylocation'];

       	$mylocation = explode(",", $mylocation);
  
       	$latitude = $mylocation[0];

       	$longitude = $mylocation[1];

      
   	
       	if (substr($_GET['data'], 0, 26) == 'http://halalraisedgoats.tk') {
       		$qrcodeid = explode("qrcodeid=",$_GET['data']);

        	$qrcodeid = $qrcodeid[1];
       	}
       	else
       	{
       		$qrcodeid = "INVALID";
       	}
    
       	

     

 

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



   			

          <?php if ($status == 1): ?>
          	<p class="text-center">You scanned an invalid QR Code. Please use the one provided by the Administrator. Make sure that QR CODE is unused. </p>
          <?php endif ?>

          <?php if ($status == 2): ?>
          	<p class="text-center">You scanned an already registered QR Code. Here are the data.</p>
          	<?php $qry = mysqli_query($connection, "select * from livestock_view where liveStockQRId = '" . $qrcodeid . "'"); $res = mysqli_fetch_assoc($qry); ?>

      

          	<div class="form-group">
	          	<label>QR Code ID</label>
	          	<textarea class="form-control" rows = "2" disabled=""><?php echo $res['liveStockQRId']; ?></textarea> 
       		</div>

       		<div class="form-group">
	            <label>Weight (KG)</label>
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


          <?php if ($status == 3): ?>
          	<p class="text-center">This QR Code is available for livestock registration.</p>
          	 <a href="add-livestocks.php?mylocation=<?php echo $_GET['mylocation'] ?>&qrcodeid=<?php echo $qrcodeid ?>&data=<?php echo $_GET['data'] ?>"><button type="text" class="btn btn-block btn-info mt-3">Register livestock</button></a>
          <?php endif ?>
             

          <a href="open-qrcode-scanner.php"><button type="text" class="btn btn-block btn-secondary mt-3 mb-3">Scan again</button></a>
 
      
        </div>
        <div class="col-md-4"></div>

      </div>

        
     
    </div>


    <?php include('footer.php'); ?>

 