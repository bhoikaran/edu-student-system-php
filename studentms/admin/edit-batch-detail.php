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
   
    $sql="SELECT Tot_Years from tblcourse where CourseName=:cname";
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

       $end_date="";
        $date=$_POST['start_date'];
        $cname=$_POST['course'];
        if($_POST['end_date']==null)
        {
            $end_date=null;  
        }
        else{
            $end_date=$_POST['end_date'];
        }
        
        $eid=$_GET['editid'];
        

        $batch=$cname;
            
            $batch.=date('Y',strtotime($date));
            $futureDate=date('y',strtotime($date)); 
            $futureDate=$futureDate+$totyear;
            $slash ="/";
            $batch.=$slash;
            $batch.=$futureDate;
            

        $sql="update tblbatch set StartDate=:date,CourseName=:cname,BatchName=:batch,EndDate=:end_date where ID=:eid";
        $query=$dbh->prepare($sql);
        $query->bindParam(':date',$date,PDO::PARAM_STR);      
        $query->bindParam(':cname',$cname,PDO::PARAM_STR);
        $query->bindParam(':batch',$batch,PDO::PARAM_STR);
        $query->bindParam(':end_date',$end_date,PDO::PARAM_STR);  
        $query->bindParam(':eid',$eid,PDO::PARAM_STR);
        $query->execute();
        echo '<script>alert("Course has been updated")</script>';
        #echo "<script>window.location.href ='manage-batch.php'</script>";
}

  ?>
<!DOCTYPE html>
<html lang="en">
  <head>
   
    <title>Student  Management System|| Manage Class</title>
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
              <h3 class="page-title"> Manage Class </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="dashboard.php">Dashboard</a></li>
                  <li class="breadcrumb-item active" aria-current="page"> Manage Class</li>
                </ol>
              </nav>
            </div>
            <div class="row">
          
              <div class="col-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title" style="text-align: center;">Manage Class</h4>
                   
                    <form class="forms-sample" method="post">
                      <?php
$eid=$_GET['editid'];
$sql="SELECT * from  tblbatch where ID=$eid";
$query = $dbh -> prepare($sql);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $row)
{               ?>  
                        
                       <div class="form-group">
                       
                        <label for="exampleInputName1">Batch Name</label>
                        <input type="text" name="batch" value="<?php  echo htmlentities($row->BatchName);?>" class="form-control" readonly="true">
                        <label style="background-color:red">* Batch Name will be Changed Automaticaly</label>
                    </div>
                       <div class="form-group">
                        <label for="exampleInputName1">Date of Start </label>
                        <input type="date" name="start_date" value="<?php  echo htmlentities($row->StartDate);?>" class="form-control" required='true'>
                      </div>
                      <div class="form-group">
                        <label for="exampleInputEmail3">Select Course</label>
                        <select  name="course" class="form-control" placeholder="" required='true'>                       
                        <option value="<?php  echo htmlentities($row->CourseName);?>"><?php  echo htmlentities($row->CourseName);?> <?php  echo htmlentities($row->Section);?></option>
                       
                          
                         <?php 

$sql2 = "SELECT * from    tblcourse ";
$query2 = $dbh -> prepare($sql2);
$query2->execute();
$result2=$query2->fetchAll(PDO::FETCH_OBJ);

foreach($result2 as $row1)
{          
    ?>  
<option value="<?php echo htmlentities($row1->CourseName);?>"><?php echo htmlentities($row1->CourseName);?></option>
 <?php } ?> 
                        </select>               
                      </div>
                      <div class="form-group">
                        <label for="exampleInputName1">Date of End </label>
                        <input type="date" name="end_date" value="<?php  echo htmlentities($row->EndDate);?>" class="form-control">
                      </div><?php $cnt=$cnt+1;}} ?>
                      <button type="submit" class="btn btn-primary mr-2" name="submit">Update</button>
                     
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