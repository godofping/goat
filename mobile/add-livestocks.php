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
          <h5 class="text-center font-weight-bold">ADD LIVESTOCK</h5>
        </div>
       </div>

      <div class="row pt-3">
        <div class="col-md-4"></div>
        <div class="col-md-4">

       <p><?php echo $_GET['data']; ?></p>

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


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="js/jquery-3.3.1.slim.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>