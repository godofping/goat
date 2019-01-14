<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>

<?php 
$numberOfQRCodes = $_GET['numberOfQRCodes'];

for ($i=1 ; $i <= $numberOfQRCodes; $i++ ) { 
$link =   "https://localhost/" . md5(date('Y-m-d H:i:s u') . $i);
	?>
<img src="https://chart.googleapis.com/chart?chs=200x200&cht=qr&chl=<?php echo $link; ?>&choe=UTF-8&fbclid=IwAR3A6NSESuPmaisUg0jOcsyibP777E8LY52zb55fRR5R4rtCsrEt0ROJPkw">
<?php } ?>


</body>
</html>