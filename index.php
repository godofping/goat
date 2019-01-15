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

            
		              
		      
		        </div>
    		</div>
    	</div>

    </div>

<?php 
include('footer.php');
?>