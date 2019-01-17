
<?php include('header.php'); ?>

  <body class="bg-light">
  
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12 pt-5">
       
        	<a href="qrcode-data.php?mylocation=<?php echo $_GET['mylocation'] ?>&data=<?php echo $_GET['data'] ?>"><button type="text" class="btn btn-block btn-warning mb-4">Back</button></a>
          <h5 class="text-center font-weight-bold">ADD LIVESTOCK</h5>
        </div>
       </div>

      <div class="row pt-3">
        <div class="col-md-4"></div>
        <div class="col-md-4">

        <?php 

        $qrcodeid = $_GET['qrcodeid'];


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
            <label for="weight">Weight (KG)</label>
            <input type="number" class="form-control" name="weight" id="weight" required="" min="1" max="999">
        </div>
        
        <div class="form-group">
            <label for="whenToSold">Disposal Date</label>
            <input type="date" class="form-control" name="whenToSold" id="whenToSold" required="">
        </div>

        <button type="submit" class="btn btn-block btn-success mb-4">Add</button>
        <input type="text" name="from" value="add-livestock" hidden="">
        <input type="text" name="gps" value="<?php echo $_GET['mylocation'] ?>" hidden="">
        <input type="text" name="liveStockQRId" value="<?php echo $qrcodeid; ?>" hidden="">
        <input type="text" name="actualAddress" id="actualAddress" hidden="">


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
          $('#actualAddress').val(obj.results[0].formatted_address);


        }
    });




</script>


