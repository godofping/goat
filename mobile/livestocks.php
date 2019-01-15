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

          <h5 class="text-center font-weight-bold">LIVESTOCKS</h5>
        </div>
       </div>

      <div class="row pt-3">
        <div class="col-md-4"></div>
        <div class="col-md-4">

   			<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">#</th>
			      <th scope="col">Kilo</th>
			      <th scope="col">Sold Date</th>
			    </tr>
			  </thead>
			  <tbody>
			    <?php 
			    $qry = mysqli_query($connection, "select * from livestock_view");
			    while ($res = mysqli_fetch_assoc($qry)) { ?>
			   	<tr>
			      <th scope="row"><?php echo $res['liveStockId']; ?></th>
			      <td><?php echo $res['weight']; ?></td>
			      <td><?php echo $res['whenToSold']; ?></td>
			    </tr>

			    <?php } ?>

			  </tbody>
			</table>

       
      
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