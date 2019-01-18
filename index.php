<?php 
include('header.php');
 ?>
    
    <div class="container">
    	<div class="row mt-5">
    		<div class="col-md-12">
    			<div class="jumbotron">


                  
                        <h3 class="text-center font-weight-bold">HALAL-RAISED GOATS ADMIN DASHBOARD</h3>
                        <hr>

                        <h5 class="text-center">Number of registered livestocks:</h5>
                        <h2 class="text-center font-weight-bold text-primary"><?php $qry = mysqli_query($connection, "select count(*) as result from livestock_view"); $res = mysqli_fetch_assoc($qry); echo $res['result']; ?></h2>

                        <hr>

            
		              
		      
		        </div>
    		</div>
    	</div>

    </div>

<?php 
include('footer.php');
?>