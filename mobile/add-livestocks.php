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



       <p><?php echo $_GET['data']; ?></p>
       <p><?php 



 		$mylocation =  $_GET['mylocation'];

       	$mylocation = explode(",", $mylocation);
  
       	$latitude = $mylocation[0];

       	$longitude = $mylocation[1];

       ?></p>




   		<div class="form-group">
          <label for="username">Weight</label>
          <input type="number" class="form-control" name="weight" id="weight" required="">
        </div>
     	
     	<div class="form-group">
          <label for="username">Sold Date</label>
          <input type="text" class="form-control" name="whenToSold" id="whenToSold" required="">
        </div>

      
        </div>
        <div class="col-md-4"></div>

      </div>

        
     
    </div>


<button id="test">ASDASD</button>


<?php include('footer.php'); ?>


<script type="text/javascript">


    $.ajax({
        url: 'https://maps.googleapis.com/maps/api/geocode/json?latlng=6.69133463,124.6733888&result_type=route&key=AIzaSyCrM94NRHiWS652rYp3jenICI1Z24BH4dM',
        dataType: 'json',
        success: function(json) {

          datas = JSON.stringify(json)

          var obj = JSON.parse(datas);


          console.log(obj.results[0].formatted_address);


        }
    });




</script>


