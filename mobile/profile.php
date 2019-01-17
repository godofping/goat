<?php include('header.php'); ?>

  <body class="bg-light">
  
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12 pt-5">
       
          <a href="menu.php"><button type="text" class="btn btn-block btn-warning mb-4">Back</button></a>
          <h5 class="text-center font-weight-bold">PROFILE</h5>
          <?php if (isset($_GET['status']) and $_GET['status'] == 'profile'): ?>
            <p class="text-center">Profile updated!</p>
          <?php endif ?>

          <?php if (isset($_GET['status']) and $_GET['status'] == 'password'): ?>
            <p class="text-center">Password updated!</p>
          <?php endif ?>


        </div>
       </div>

      <div class="row pt-3">
        <div class="col-md-4"></div>
        <div class="col-md-4">

        <?php 

        $qry = mysqli_query($connection, "select * from farmer_view where farmerId = '" . $_SESSION['farmerId'] . "'");
        $res = mysqli_fetch_assoc($qry);


        ?>



      <form method="POST" action="mobile-controller.php">
    

        
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" class="form-control" name="username" id="username" required="" disabled="" value="<?php echo $res['username'] ?>">
        </div>

        <div class="form-group">
            <label for="farmerName">Farmer Name</label>
            <input type="text" class="form-control" name="farmerName" id="farmerName" required="" value="<?php echo $res['farmerName'] ?>">
        </div>

        <div class="form-group">
            <label for="farmerAddress">Farmer Address</label>
            <textarea class="form-control" name="farmerAddress" id="farmerAddress" rows="2" required=""><?php echo $res['farmerAddress'] ?></textarea>
        </div>


        <button type="submit" class="btn btn-block btn-success mb-4">Update Profile</button>
        <input type="text" name="from" value="update-profile" hidden="">


      </form>


      <form method="POST" action="mobile-controller.php">
    

        
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" name="password" id="password" required="">
        </div>

   

       
        <button type="submit" class="btn btn-block btn-success mb-4">Update Password</button>
        <input type="text" name="from" value="update-password" hidden="">
        <input type="text" name="credentialId" value="<?php echo $res['credentialId'] ?>" hidden>



      </form>

      
        </div>
        <div class="col-md-4"></div>

      </div>

        
     
    </div>




<?php include('footer.php'); ?>





