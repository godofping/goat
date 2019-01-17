<?php

include("../connection.php");

if (isset($_POST['from']) and $_POST['from'] == 'login') {
	
	$qry = mysqli_query($connection, "select * from farmer_view where username = '" . $_POST['username'] . "' and password = '" . $_POST['password'] . "'");
		if (mysqli_num_rows($qry) > 0) {
			$res = mysqli_fetch_assoc($qry);
			$_SESSION['farmerId'] = $res['farmerId'];
			header("Location: menu.php");
		}
		else
		{
			header("Location: login.php?s=failed");
		}
}

if (isset($_POST['from']) and $_POST['from'] == 'add-livestock') {

	$qry = mysqli_query($connection, "insert into livestock_table (liveStockQRId, weight, whenToSold, farmerId, gps, dateAdded, actualAddress) values ('" . $_POST['liveStockQRId'] . "', '" . $_POST['weight'] . "', '" . $_POST['whenToSold'] . "', '" . $_SESSION['farmerId'] . "', '" . $_POST['gps'] . "', '" . date('Y-m-d') . "', '" . $_POST['actualAddress'] . "')");
	header("Location: saved.php");
}


if (isset($_GET['from']) and $_GET['from'] == 'exit') {
	session_destroy();
	header("Location: exit.php");
}


if (isset($_POST['from']) and $_POST['from'] == 'update-profile') {
	mysqli_query($connection, "update farmer_table set farmerName = '" . $_POST['farmerName'] . "', farmerAddress = '" . $_POST['farmerAddress'] . "' where farmerId = '" . $_SESSION['farmerId'] . "'");
	header("Location: profile.php?status=profile");
}


if (isset($_POST['from']) and $_POST['from'] == 'update-password') {


	mysqli_query($connection, "update credential_table set password = '" . $_POST['password'] . "' where credentialId = '" . $_POST['credentialId'] . "'");





	header("Location: profile.php?status=password");
}




?>