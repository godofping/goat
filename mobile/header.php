<?php
include('connection.php');
if (isset($_SESSION['adminId']) or isset($_SESSION['farmerId'])) {
}
else
{
  header("Location: login.php");
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
  <body>
  	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="index.php">
    <?php if (isset($_SESSION['adminId'])): ?>
      ADMIN DASHBOARD
    <?php endif ?>

    <?php if (isset($_SESSION['farmerId'])): ?>
      FARMER DASHBOARD
    <?php endif ?>
      
    </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">

    <?php if (isset($_SESSION['adminId'])): ?>

      <li class="nav-item <?php if (basename($_SERVER["SCRIPT_FILENAME"], '.php') == 'farmers'): ?>
        active
      <?php endif ?>">
      <a class="nav-link" href="farmers.php">Farmers</a>
      </li>

      <li class="nav-item <?php if (basename($_SERVER["SCRIPT_FILENAME"], '.php') == 'generateqrcodes'): ?>
        active
      <?php endif ?>">
      <a class="nav-link" href="generateqrcodes.php">Generate Qr Codes</a>
      </li>


    <?php endif ?>

    <?php if (isset($_SESSION['farmerId'])): ?>
      <li class="nav-item <?php if (basename($_SERVER["SCRIPT_FILENAME"], '.php') == 'livestocks'): ?>
        active
      <?php endif ?>">
      <a class="nav-link" href="livestocks.php">Livestocks</a>
      </li>
    <?php endif ?>




    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li class="nav-item"> <a href="controller.php?from=logout"><button class="btn btn-outline-warning">Logout</button></a></li>
    </ul>


  </div>
</nav>

