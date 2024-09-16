<?php
session_start();
error_reporting(0);
include('includes/dbconnection.php');
if (strlen($_SESSION['sturecmsaid']==0)) {
  header('location:logout.php');
  } else{
   if(isset($_POST['submit']))
  {
    $cname=$_POST['course']; 
   
    $sql="SELECT Tot_Years from tblcourse where ID=:cname";
    $query = $dbh -> prepare($sql);
    $query->bindParam(':cname',$cname,PDO::PARAM_STR);
    $query->execute();
    $results=$query->fetchAll(PDO::FETCH_OBJ);
    if($query->rowCount() > 0)
    {
    foreach($results as $row)
    {
      $totyear = $row->Tot_Years;
    }
    }

      #course
      $sql="SELECT CourseName from tblcourse where ID=:cname";
      $query = $dbh -> prepare($sql);
      $query->bindParam(':cname',$cname,PDO::PARAM_STR);
      $query->execute();
      $results=$query->fetchAll(PDO::FETCH_OBJ);
      if($query->rowCount() > 0)
      {
      foreach($results as $row)
      {
        $coursename = $row->CourseName;
      }
      }
      #course
    $batch=$coursename;
    $date=$_POST['start_date'];
    $batch.=date('Y',strtotime($date));
    $futureDate=date('y',strtotime($date)); 
    $futureDate=$futureDate+$totyear;
    $slash ="/";
    $batch.=$slash;
    $batch.=$futureDate;
  
   #Sql Data start 
   $sql="insert into tblbatch(StartDate,CourseName,BatchName)values(:date,:coursename,:batch)"; 
$query=$dbh->prepare($sql);
$query->bindParam(':date',$date,PDO::PARAM_STR);
$query->bindParam(':coursename',$coursename,PDO::PARAM_STR);
$query->bindParam(':batch',$batch,PDO::PARAM_STR);
$query->execute();
   $LastInsertId=$dbh->lastInsertId();
   if ($LastInsertId>0) {
    echo '<script>alert("Course has been added.")</script>';
    echo "<script>alert('Batch Name : $batch');</script>";
echo "<script>window.location.href ='dashboard.php'</script>";
  }
  else
    {
         echo '<script>alert("Something Went Wrong. Please try again")</script>';
    }
   #Sql Data End


    
}
  ?>
<!DOCTYPE html>
<html lang="en">
  <head>
   
    <title>Student  Management System|| Add Batch</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="vendors/simple-line-icons/css/simple-line-icons.css">
    <link rel="stylesheet" href="vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="vendors/select2/select2.min.css">
    <link rel="stylesheet" href="vendors/select2-bootstrap-theme/select2-bootstrap.min.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="css/style.css" />
    
  </head>
  <body>
    <div class="container-scroller">
      <!-- partial:partials/_navbar.html -->
     <?php include_once('includes/header.php');?>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->
      <?php include_once('includes/sidebar.php');?>
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title"> Add Batch </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="dashboard.php">Dashboard</a></li>
                  <li class="breadcrumb-item active" aria-current="page"> Add Batch</li>
                </ol>
              </nav>
            </div>
            <div class="row">
          
              <div class="col-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title" style="text-align: center;">Add Batch</h4>
                   
                    <form class="forms-sample" method="post">                                       
                      <div class="form-group">
                        <label for="exampleInputName1">Date of Start </label>
                        
            <input type="date" name="start_date" value="" class="form-control" min=
						<?php 
							$todays_date=date('Y-m-d'); 
							echo $todays_date;
						?> 
						 required>
                      </div>
                      <div class="form-group">
                        <label for="exampleInputEmail3">Select Course</label>
                        <select  name="course" class="form-control" placeholder="" required='true'>
                    
                        <option value="">Select Course</option>
                          
                         <?php 

$sql2 = "SELECT * from    tblcourse ";
$query2 = $dbh -> prepare($sql2);
$query2->execute();
$result2=$query2->fetchAll(PDO::FETCH_OBJ);

foreach($result2 as $row1)
{          
    ?>  
<option value="<?php echo htmlentities($row1->ID);?>"><?php echo htmlentities($row1->CourseName);?></option>
 <?php } ?> 
                        </select>               
                      </div>
                     <!--          
                      <div class="form-group">
                        <label for="exampleInputName1">Batch Name</label>
                        <input type="text" name="cname" value="<?php# echo $batch; ?>" class="form-control">
                      </div>-->
                      <button type="submit" class="btn btn-primary mr-2" name="submit">Add</button>
                     
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
         <?php include_once('includes/footer.php');?>
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="vendors/select2/select2.min.js"></script>
    <script src="vendors/typeahead.js/typeahead.bundle.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="js/off-canvas.js"></script>
    <script src="js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="js/typeahead.js"></script>
    <script src="js/select2.js"></script>
    <!-- End custom js for this page -->
  </body>
</html><?php }  ?>