<?php
include('../connection.php');

?>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">

    <title>GOAT QR CODE</title>

    <style type="text/css">
     
      *{
          outline: 0 !important;
      }

       a:hover, a:visited, a:link, a:active
      {
          text-decoration: none !important;
      }
          
    </style>

  </head>
  <body class="bg-light">
  
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12 pt-5">
        	<button type="text" class="btn btn-block btn-warning mb-4" onclick="location.reload();">Reload</button>
        	<a href="menu.php"><button type="text" class="btn btn-block btn-warning mb-4">Back</button></a>
          <h5 class="text-center font-weight-bold">ADD LIVESTOCK</h5>
        </div>
       </div>

      <div class="row pt-3">
        <div class="col-md-4"></div>
        <div class="col-md-4">



    
       <p><?php 



 		$mylocation =  $_GET['mylocation'];

       	$mylocation = explode(",", $mylocation);
  
       	$latitude = $mylocation[0];

       	$longitude = $mylocation[1];

   

        $qrcodeid = explode("qrcodeid=",$_GET['data']);

        $qrcodeid = $qrcodeid[1];

       ?></p>

       <?php


       if (substr(base64_decode($qrcodeid), 0,10) == "HALALGOATS" ) {
        $qry = mysqli_query($connection, "select * from livestock_table where liveStockQRId = '" . $qrcodeid  . "'");
          if (mysqli_num_rows($qry) > 0) {
             header("Location: qrcode-invalid.php?error=2");
          }
       }
       else
       {
          header("Location: qrcode-invalid.php?error=1");

       }

       ?>


      <form method="POST" action="mobile-controller.php">
        <div class="form-group">
          <label for="liveStockQRId">QR Code ID</label>
          <textarea class="form-control" name="liveStockQRId" id="liveStockQRId" rows = "2" disabled=""><?php echo $qrcodeid; ?></textarea> 
        </div>


        <div class="form-group">
            <label for="gps">Location and GPS Coordinates</label>
            <textarea class="form-control" name="gps" id="gps" required="" rows = "3" disabled=""></textarea> 
        </div>


        <div class="form-group">
            <label for="weight">Weight</label>
            <input type="number" class="form-control" name="weight" id="weight" required="">
        </div>
        
        <div class="form-group">
            <label for="whenToSold">Disposal Date</label>
            <input type="date" class="form-control" name="whenToSold" id="whenToSold" required="">
        </div>

        <button type="submit" class="btn btn-block btn-success mb-4">Add</button>
        <input type="text" name="from" value="add-livestock" hidden="">
        <input type="text" name="gps" value="<?php echo $_GET['mylocation'] ?>" hidden="">

      </form>

      
        </div>
        <div class="col-md-4"></div>

      </div>

        
     
    </div>




<?php include('footer.php'); ?>


<script type="text/javascript">


    $.ajax({
        url: 'https://maps.googleapis.com/maps/api/geocode/json?latlng=<?php echo $_GET['mylocation'] ?>&result_type=route&key=AIzaSyCrM94NRHiWS652rYp3jenICI1Z24BH4dM',
        dataType: 'json',
        success: function(json) {

          datas = JSON.stringify(json)

          var obj = JSON.parse(datas);


         

          $('#gps').text(obj.results[0].formatted_address + "\n" + "<?php echo $_GET['mylocation'] ?>");


        }
    });




</script>


