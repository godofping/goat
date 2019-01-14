<?php 
include('header.php');
 ?>
    
    <div class="container">
    	<div class="row mt-5">
    		<div class="col-md-12">
    			<div class="jumbotron">

                    <h2>Generate QR Codes</h2>
                    <hr>

                    <button class="btn btn-success mt-2 mb-3" data-toggle="modal" data-target="#addModal">Generate</button>

                    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Generate</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body">
                            <form method="GET" action="generatecodes.php" target="_blank">
                                
                              <div class="form-group">
                                <label># of QR Codes</label>
                                <input type="number" name="numberOfQRCodes" class="form-control" required="" max="50" min="1">
                              </div>


                           
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Generate</button>
                        </form>
                          </div>
                        </div>
                      </div>
                    </div>


    		   
		      
		        </div>
    		</div>
    	</div>

    </div>

<?php 
include('footer.php');
?>