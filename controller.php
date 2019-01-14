<?php

include("connection.php");

if (isset($_POST['from']) and $_POST['from'] == 'login') {
	
	$qry = mysqli_query($connection, "select * from admin_view where username = '" . $_POST['username'] . "' and password = '" . $_POST['password'] . "'");

	if (mysqli_num_rows($qry) > 0) {
		$res = mysqli_fetch_assoc($qry);
		$_SESSION['adminId'] = $res['adminId'];
		header("Location: index.php");
	}
	else
	{	
		$qry = mysqli_query($connection, "select * from farmer_view where username = '" . $_POST['username'] . "' and password = '" . $_POST['password'] . "'");
		if (mysqli_num_rows($qry) > 0) {
			$res = mysqli_fetch_assoc($qry);
			$_SESSION['farmerId'] = $res['farmerId'];
			header("Location: index.php");
		}
		else
		{
			header("Location: login.php?s=failed");
		}
		
	}
}

if (isset($_GET['from']) and $_GET['from'] == 'logout') {
	session_destroy();
	header("Location: login.php");

}

if (isset($_POST['from']) and $_POST['from'] == 'add-farmer') {

	$uAndP = substr(md5(date('Y-m-d H:i:s')), 0,4);


	mysqli_query($connection, "insert into credential_table (username, password) values ('" . $uAndP . "', '" . $uAndP . "')");

	$credentialId = mysqli_insert_id($connection);

	mysqli_query($connection, "insert into farmer_table (farmerName,farmerAddress, credentialId) values ('" . $_POST['farmerName'] . "', '" . $_POST['farmerAddress'] . "', '" . $credentialId  . "')");

	header("Location: farmers.php");
}


if (isset($_POST['from']) and $_POST['from'] == 'delete-farmer') {

	mysqli_query($connection, "delete from farmer_table where farmerId = '" . $_POST['farmerId'] . "'");

	header("Location: farmers.php");
}


if (isset($_POST['from']) and $_POST['from'] == 'update-farmer') {

	mysqli_query($connection, "update farmer_table set farmerName = '" . $_POST['farmerName'] . "', farmerAddress = '" . $_POST['farmerAddress'] . "' where farmerId = '" . $_POST['farmerId'] . "'");

	header("Location: farmers.php");
}


?>