<?php
    session_start();
    include 'conexion.php';
    
	$update=false;
	$id="";
	$name="";
	$description="";
	$photo="";
	$categoryID="";
	$letterID="";

	if(isset($_POST['add'])){
		$id=$_POST['id'];
		$name=$_POST['name'];
        $description=$_POST['description'];
		$categoryID=$_POST['categoryID'];
		$letterID=$_POST['letterID'];

		$photo=$_FILES['image']['name'];
		$upload="uploads/".$photo;

		$query="INSERT INTO new_toy(ID,name,description,photo,category_ID,letter_ID)VALUES(?,?,?,?,?,?)";
		$stmt=$mysqli->prepare($query);
		$stmt->bind_param("isssii",$id,$name,$description,$categoryID,$letterID,$upload);
		$stmt->execute();
		move_uploaded_file($_FILES['image']['tmp_name'], $upload);

		header('location:CRUD_toys.php');
		$_SESSION['response']="Successfully Inserted to the database!";
		$_SESSION['res_type']="success";
        
	
	}
	if(isset($_GET['delete'])){
		$id=$_GET['delete'];

		$sql="SELECT photo FROM new_toy WHERE id=?";
		$stmt2=$conn->prepare($sql);
		$stmt2->bind_param("i",$id);
		$stmt2->execute();
		$result2=$stmt2->get_result();
		$row=$result2->fetch_assoc();

		$imagepath=$row['photo'];
		unlink($imagepath);

		$query="DELETE FROM new_toy WHERE ID=?";
		$stmt=$mysqli->prepare($query);
		$stmt->bind_param('i',$id);
		$stmt->execute();

		header('location:CRUD_toys.php');
		$_SESSION['response']="Successfully Deleted!";
		$_SESSION['res_type']="danger";
	}
	if(isset($_GET['edit'])){
		$id=$_GET['edit'];

		$query="SELECT * FROM assistants WHERE ID=?";
		$stmt=$mysqli->prepare($query);
		$stmt->bind_param('i',$id);
		$stmt->execute();
		$result=$stmt->get_result();
		$row=$result->fetch_assoc();

		$id=$row['id'];
		$name=$row['name'];
		$description=$row['position'];
		$categoryID=$row['categoryID'];
		$letterID=$row['letterID'];
		$photo=$row['photo'];

		$update=true;
	}
	if(isset($_POST['update'])){
		$id=$_POST['id'];
		$name=$_POST['name'];
        $description=$_POST['description'];
		$categoryID=$_POST['cattegory_ID'];
		$letterID=$_POST['letter_ID'];
		$oldimage=$_POST['oldimage'];
		
		if(isset($_FILES['image']['name'])&&($_FILES['image']['name']!="")){
			$newimage="uploads/".$_FILES['image']['name'];
			unlink($oldimage);
			move_uploaded_file($_FILES['image']['tmp_name'], $newimage);
		}
		else{
			$newimage=$oldimage;
		}
        
        $query="UPDATE assistants SET ID=?,name=?,description=?,photo=?,category_ID=?, letter_ID=? WHERE id=ID";
		$stmt=$mysqli->prepare($query);
		$stmt->bind_param('sssdi',$name,$position,$function,$date,$id);
		$stmt->execute();

		$_SESSION['response']="Updated Successfully!";
		$_SESSION['res_type']="primary";
		header('location: CRUD_toys.php');
	
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