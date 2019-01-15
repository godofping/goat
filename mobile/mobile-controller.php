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



?>