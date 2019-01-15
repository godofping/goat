<?php
include('../connection.php');

if (isset($_SESSION['farmerId'])) {
  header("Location: menu.php");
}

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
     
      a:hover, a:visited, a:link, a:active
      {
          text-decoration: none !important;
          outline: none;
          box-shadow: none;
      }
        

       button:hover, button:visited, button:link, button:active
      {
          text-decoration: none !important;
          outline: none;
          box-shadow: none;
      }
          
    </style>

  </head>
  <body class="bg-light">
  
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12 pt-5">
          <h5 class="text-center font-weight-bold">FARMER LOGIN PAGE</h5>
        </div>
       </div>

      <div class="row pt-3">
        <div class="col-md-4"></div>
        <div class="col-md-4">
          <div class="card">
            <div class="card-body">
              <form method="POST" action="mobile-controller.php" autocomplete="off">

                <?php if (isset($_GET['s']) and $_GET['s'] == 'failed'): ?>
                    <div class="alert alert-warning" role="alert">
                      Login Failed! Incorrect username and/or password.
                    </div>
                <?php endif ?>
                
                <div class="form-group">
                  <label for="username">Username</label>
                  <input type="text" class="form-control" name="username" id="username" required="">
                </div>

                <div class="form-group">
                  <label for="password">Password</label>
                  <input type="password" class="form-control" name="password" id="password" required="">
                </div>

                <button type="submit" class="btn btn-block btn-primary">Login</button>
                <input type="text" name="from" value="login" hidden="">
              </form>
            </div>
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