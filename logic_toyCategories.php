<?php
    session_start();
    include 'conexion.php';
    
	$update=false;
	$id="";
	$name="";
	$description="";
	$state="";
	//$date="";

	if(isset($_POST['add'])){
		$id=$_POST['id'];
		$name=$_POST['name'];
        $description=$_POST['description'];
        $state=$_POST['state'];
        //$date=$_POST['start_date'];
        //$date=date("Y-m-d", $_POST['start_date']);

		//$photo=$_FILES['image']['name'];
		//$upload="uploads/".$photo;

		$query="INSERT INTO toy_category(ID, name, description, state) VALUES (?, ?, ?, ?)";
		$stmt=$mysqli->prepare($query);
        $stmt->bind_param('isss',$id,$name,$description,$state);
        //$upload va para imagen
        $stmt->execute();
        //echo $stmt;;
        
        header('location:CRUD_toyCategories.php');
		$_SESSION['response']="Successfully Inserted to the database!";
		$_SESSION['res_type']="success";
        //move_uploaded_file($_FILES['image']['tmp_name'], $upload);
        

	
	}
	if(isset($_GET['delete'])){
		$id=$_GET['delete'];

		/*$sql="SELECT photo FROM crud WHERE id=?";
		$stmt2=$conn->prepare($sql);
		$stmt2->bind_param("i",$id);
		$stmt2->execute();
		$result2=$stmt2->get_result();
		$row=$result2->fetch_assoc();

		$imagepath=$row['photo'];
		unlink($imagepath);*/

		$query="DELETE FROM toy_category WHERE ID=?";
		$stmt=$mysqli->prepare($query);
		$stmt->bind_param('i',$id);
		$stmt->execute();

		header('location:CRUD_toyCategories.php');
		$_SESSION['response']="Successfully Deleted!";
		$_SESSION['res_type']="danger";
	}
	if(isset($_GET['edit'])){
		$id=$_GET['edit'];

		$query="SELECT ID, name, description, state FROM toy_category WHERE ID=?";
		$stmt=$mysqli->prepare($query);
		$stmt->bind_param('i',$id);
		$stmt->execute();
		$result=$stmt->get_result();
		$row=$result->fetch_assoc();

		$id=$row['ID'];
		$name=$row['name'];
		$description=$row['description'];
		$state=$row['state'];
		//$date=$row['start_date'];

		$update=true;
	}
	if(isset($_POST['update'])){
		$id=$_POST['id'];
		$name=$_POST['name'];
		$description=$_POST['description'];
		$state=$_POST['state'];
       // $date=$_POST['start_date'];
        
        $query="UPDATE toy_category SET ID=?, name=?,description=?,state=? WHERE ID= ID";
		$stmt=$mysqli->prepare($query);
		$stmt->bind_param('isss',$id,$name,$description,$state);
		$stmt->execute();

		$_SESSION['response']="Updated Successfully!";
		$_SESSION['res_type']="primary";
		header('location: CRUD_toyCategories.php');
		/*if(isset($_FILES['image']['name'])&&($_FILES['image']['name']!="")){
			$newimage="uploads/".$_FILES['image']['name'];
			unlink($oldimage);
			move_uploaded_file($_FILES['image']['tmp_name'], $newimage);
		}
		else{
			$newimage=$oldimage;
		}*/
	
    }

	if(isset($_GET['details'])){
		$id=$_GET['details'];
		$query="SELECT * FROM assistants WHERE ID=?";
		$stmt=$mysqli->prepare($query);
		$stmt->bind_param('i',$id);
		$stmt->execute();
		$result=$stmt->get_result();
		$row=$result->fetch_assoc();

		$vid=$row['id'];
		$vname=$row['name'];
		$vemail=$row['position'];
		$vphone=$row['function'];
		$vdate=$row['date'];
	}
?>