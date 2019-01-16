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
          <h5 class="text-center font-weight-bold">MENU</h5>
        </div>
       </div>

      <div class="row pt-3">
        <div class="col-md-4"></div>
        <div class="col-md-4">

   

          <a href="open-qrcode-scanner-for-registration.php"><button type="text" class="btn btn-block btn-secondary mt-3">Add livestock</button></a>

          <a href="open-qr-code-scanner.php"><button type="text" class="btn btn-block btn-secondary mt-3">QR Code Scanner</button></a>

          <button type="text" class="btn btn-block btn-secondary mt-3" id="getGPS">GET GPS</button>

          <a href="livestocks.php"><button type="text" class="btn btn-block btn-secondary mt-3">Livestocks</button></a>
          
          <a href="exit.php"><button type="text" class="btn btn-block btn-secondary mt-3">Exit</button></a>
             
 
      
        </div>
        <div class="col-md-4"></div>

      </div>

        
     
    </div>


    <?php include('footer.php'); ?>

    <script type="text/javascript">
      $('#getGPS').click(function(){

          Android.getGPS();

      });

  </script>