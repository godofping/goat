<?php 
include('header.php');
 ?>
    
    <div class="container">
      <div class="row mt-5">
        <div class="col-md-12">
          <div class="jumbotron">

                    <h2>Raisers</h2>
                    <hr>

                    <button class="btn btn-success mt-2 mb-3" data-toggle="modal" data-target="#addModal">Add raiser</button>

                    <!-- Modal -->
                    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Add</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body">
                            <form method="POST" action="controller.php">
                                
                              <div class="form-group">
                                <label>Name</label>
                                <input type="text" name="farmerName" class="form-control" required="">
                              </div>

                              <div class="form-group">
                                <label>Address</label>
                                <input type="text" name="farmerAddress" class="form-control" required="">
                              </div>




                           
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <input type="text" name="from" value="add-farmer" hidden="">
                            <button type="submit" class="btn btn-primary">Save</button>
                        </form>
                          </div>
                        </div>
                      </div>
                    </div>


                  <table class="table bg-white">
                          <thead class="bg-primary text-white">
                            <tr>
                              <th scope="col">#</th>
                              <th scope="col">Name</th>
                              <th scope="col">Address</th>
                              <th scope="col">Username and default password</th>
                              <th scope="col">Actions</th>
                            </tr>
                          </thead>
                          <tbody>


                            <?php
                            $qry = mysqli_query($connection, "select * from farmer_view");
                            while ($res = mysqli_fetch_assoc($qry)) { ?>
                            <tr>
                              <td scope="col"><?php echo $res['farmerId']; ?></td>
                              <td scope="col"><?php echo $res['farmerName']; ?></td>
                              <td scope="col"><?php echo $res['farmerAddress']; ?></td>
                              <td scope="col"><?php echo $res['username']; ?></td>
                              <td scope="col"><button class="btn btn-secondary" data-toggle="modal" data-target="#editModal<?php echo $res['farmerId']; ?>">Edit</button> <button class="btn btn-secondary" data-toggle="modal" data-target="#deleteModal<?php echo $res['farmerId']; ?>">Delete</button></td>
                            </tr>



                                <!-- Modal -->
                                <div class="modal fade" id="editModal<?php echo $res['farmerId']; ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                  <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Update</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                          <span aria-hidden="true">&times;</span>
                                        </button>
                                      </div>
                                      <div class="modal-body">
                                        <form method="POST" action="controller.php">
                                            
                                          <div class="form-group">
                                            <label>Name</label>
                                            <input type="text" name="farmerName" class="form-control" required="" value="<?php echo $res['farmerName']; ?>">
                                          </div>

                                          <div class="form-group">
                                            <label>Address</label>
                                            <input type="text" name="farmerAddress" class="form-control" required="" value="<?php echo $res['farmerAddress']; ?>">
                                          </div>
                                      </div>
                                      <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                        <input type="text" name="from" value="update-farmer" hidden="">
                                        <button type="submit" class="btn btn-primary">Save</button>
                                        <input type="text" name="farmerId" value="<?php echo $res['farmerId'] ?>" hidden>
                                    </form>
                                      </div>
                                    </div>
                                  </div>
                                </div>

                                 <!-- Modal -->
                                <div class="modal fade" id="deleteModal<?php echo $res['farmerId']; ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                  <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Delete</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                          <span aria-hidden="true">&times;</span>
                                        </button>
                                      </div>
                                      <div class="modal-body">
                                        <h4>Are you sure to delete <?php echo $res['farmerName']; ?> account?</h4>
                                      </div>
                                      <div class="modal-footer">
                                    <form action="controller.php" method="POST">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                        <input type="text" name="from" value="delete-farmer" hidden="">
                                        <button type="submit" class="btn btn-primary">Delete</button>
                                        <input type="text" name="farmerId" value="<?php echo $res['farmerId'] ?>" hidden>
                                    </form>
                                      </div>
                                    </div>
                                  </div>
                                </div>

                            <?php } ?>
            
                          </tbody>
                        </table>

          
            </div>
        </div>
      </div>

    </div>

<?php 
include('footer.php');
?>