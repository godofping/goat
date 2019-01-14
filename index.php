<?php 
include('header.php');
 ?>
    
    <div class="container">
    	<div class="row mt-5">
    		<div class="col-md-12">
    			<div class="jumbotron">


                    <?php if (isset($_SESSION['adminId'])): ?>
                        <h1>QR CODE GENERATOR FOR HALAL-RAISED GOATS</h1>   
                    <?php endif ?>

                    <?php if (isset($_SESSION['farmerId'])): 
                        $qry = mysqli_query($connection, "select * from farmer_view where farmerId = '" . $_SESSION['farmerId'] . "'");
                        $res = mysqli_fetch_assoc($qry);
                    ?>

                        <h2>Welcome <b class="text-primary"><?php echo $res['farmerName']; ?></b>!</h2>

                    <?php endif ?>
		              
		      
		        </div>
    		</div>
    	</div>

    </div>

<?php 
include('footer.php');
?>