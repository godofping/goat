<?php include('header.php'); ?>

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

   			<div class="table-responsive">
        <table class="table">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Weight (KG)</th>
            <th scope="col">Sold Date</th>
            <th scope="col">Location</th>
            <th scope="col">Date Added</th>
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
            <td>
              <?php echo $res['actualAddress']; ?>
              <br>
              <?php echo $res['gps']; ?>
            </td>
            <td><?php echo $res['dateAdded']; ?></td>
          </tr>

          <?php } ?>

        </tbody>
      </table>  
        </div>

       
      
        </div>
        <div class="col-md-4"></div>

      </div>

        
     
    </div>


    <?php include('footer.php'); ?>