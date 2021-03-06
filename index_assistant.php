<?php

require "conexion.php";
session_start();

if($_POST){
    $id = $_POST['id'];
    //$name = $_POST['name'];

    $sql = "SELECT id, name, position, functions, start_date FROM assistants WHERE id = '$id'";
    $resultado = $mysqli->query($sql);
    $num = $resultado->num_rows;

    if($num>0){
        $row = $resultado->fetch_assoc();
        //$password_bd = $row['password'];

        $pass_c = sha1($password);

        if($id == $_POST['id']){

            $_SESSION['id'] = $row['id'];
            $_SESSION['name'] = $row['name'];
            $_SESSION['user_type'] = $row['user_type'];

            header("Location: principal.php");

        } else {
            echo "Wrong password";
        }

        } else{
        echo "ID not valid";
    }


}

/*if(isset($_POST['id'])){
    $id=$_POST['id'];
    $name=$_POST['name'];
    $password=$_POST['password'];
    $user_type=$_POST['user_type'];

    //$photo=$_FILES['image']['name'];
    //$upload="uploads/".$photo;

    $query="INSERT INTO users(id, name, password, user_type) VALUES (?, ?, ?, ?)";
    $stmt=$mysqli->prepare($query);
    $stmt->bind_param('issi',$id,$name,$password,$user_type);
    //$upload va para imagen
    $stmt->execute();
    
    header('location:index_assistant.php');
    $_SESSION['response']="Successfully Inserted to the database!";
    $_SESSION['res_type']="success";
    //move_uploaded_file($_FILES['image']['tmp_name'], $upload);
    


}*/


?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="Pedro, Pablo y Esteban" />
        <title>NaviTEC</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Assistant Login</h3></div>
                                    <div class="card-body">
                                        <form method = "POST" action="<?php echo $_SERVER['PHP_SELF'];?>">
                                            <input type="hidden" name="name" value="<?= $name; ?>">
                                            <input type="hidden" name="user_type" value="<?= $user_type; ?>">
                                            <div class="form-group">
                                                <label class="small mb-1" for="inputID">ID</label>
                                                <input class="form-control py-4" id="inputID" name= "id" type="text" placeholder="Enter ID" required/>
                                            </div>
                                            <!--<div class="form-group">
                                                <label class="small mb-1" for="inputPassword">Password</label>
                                                <input class="form-control py-4" id="inputPassword" name = "name" type="password" placeholder="Enter name" required/>
                                            </div>
                                            <div class="form-group">-->
                                                <div class="custom-control custom-checkbox">
                                                    <input class="custom-control-input" id="rememberPasswordCheck" type="checkbox" />
                                                    <label class="custom-control-label" for="rememberPasswordCheck">Remember password</label>
                                                </div>
                                            </div>
                                           <!-- <div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a class="small" href="index_assistant.php">Assistant Login</a>-->
                                                <button type = "submit" class="btn btn-primary">
                                                Login</button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center">
                                        <div class="small"><a href="register.html">Need an account? Sign up!</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2020</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
