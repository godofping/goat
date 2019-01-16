<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>

<?php 
$numberOfQRCodes = $_GET['numberOfQRCodes'];

for ($i=1 ; $i <= $numberOfQRCodes; $i++ ) { 
$link =   "http://halalraisedgoats.tk/check.php?qrcodeid=" . base64_encode("HALALGOATS" . date('Y-m-d H:i:s u') . $i);


	?>
<img src="https://chart.googleapis.com/chart?chs=200x200&cht=qr&chl=<?php echo $link; ?>&choe=UTF-8&fbclid=IwAR3A6NSESuPmaisUg0jOcsyibP777E8LY52zb55fRR5R4rtCsrEt0ROJPkw">
<?php } ?>

<script type="text/javascript">window.print();</script>

</body>
</html>