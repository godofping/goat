<?php 
include('header.php');
 ?>

 <style type="text/css" href= "css/datatable.css"></style>
    
    <div class="container">
      <div class="row mt-5">
        <div class="col-md-12">
          <div class="jumbotron">

                    <h2>Registered Livestocks</h2>
                    <hr>

                      
        <table id="example" class="table table-responsive table-bordered bg-white" style="width:100%">
        <thead class="bg-primary text-white">
            <tr>
                <th>#</th>
                <th>Weight</th>
                <th>Sold Date</th>
                <th>Actual Address</th>
                <th>GPS</th>
                <th>Date Added</th>
                <th>Raiser Name</th>
                <th>Raiser Address</th>
                <th>QR Code ID</th>
            </tr>
        </thead>
        <tbody>
            <?php $qry = mysqli_query($connection, "select * from livestock_view"); while ($res = mysqli_fetch_assoc($qry)) { ?>
            <tr>
                <td><?php echo $res['liveStockId']; ?></td>
                <td><?php echo $res['weight']; ?></td>
                <td><?php echo $res['whenToSold']; ?></td>
                <td><?php echo $res['actualAddress']; ?></td>
                <td><?php echo $res['gps']; ?></td>
                <td><?php echo $res['dateAdded']; ?></td>
                <td><?php echo $res['farmerName']; ?></td>
                <td><?php echo $res['farmerAddress']; ?></td>
                <td><?php echo $res['liveStockQRId']; ?></td>

            </tr>
            <?php } ?>
            
        </tbody>

    </table>

             


           
          
            </div>
        </div>
      </div>

    </div>





<?php 

include('footer.php');
?>

    <script type="text/javascript">$(document).ready(function() {
    $('#example').DataTable();
} );</script>

<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap4.min.js"></script>