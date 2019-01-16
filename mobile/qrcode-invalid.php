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
        	<a href="menu.php"><button type="text" class="btn btn-block btn-warning mb-4">Back</button></a>
          <h5 class="text-center font-weight-bold">QR CODE INVALID</h5>
        </div>
       </div>

      <div class="row pt-3">
        <div class="col-md-4"></div>
        <div class="col-md-4">

   

          <?php if ($_GET['error'] == 1): ?>
          	<p class="text-center">You scanned an invalid QR Code. Please use the one provided by the Administrator. Make sure that QR CODE is unused. </p>
          <?php endif ?>

          <?php if ($_GET['error'] == 2): ?>
          	<p class="text-center">You scanned an already used QR Code. Please scan a new and unused QR Code provided by the Administrator.</p>
          <?php endif ?>
             

          <a href="open-qrcode-scanner-for-registration.php"><button type="text" class="btn btn-block btn-secondary mt-3">Try again</button></a>
 
      
        </div>
        <div class="col-md-4"></div>

      </div>

        
     
    </div>


    <?php include('footer.php'); ?>

 