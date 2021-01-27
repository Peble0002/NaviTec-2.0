<?php

    $mysqli = new mysqli("localhost", "root", "", "navitec");

    if ($mysqli->connect_error){
        die("Could not connect to the database".$mysqli->connect_error);
    }



?>
