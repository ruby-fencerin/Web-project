<?php
    echo "testing";

    $conn  = new PDO('mysql:host=db;dbname=my_webapp', 'user', 'user_password');
    $sql   = "SELECT * FROM MAJOR";
    //$sql = "SELECT * FROM MAJOR WHERE START_YEAR = $year"
                // Now lets say $year = "''; DROP DATABASE MAJORS;"

    $query = $conn->query($sql) or die("failed!");
    while ($row = $query->fetch(PDO::FETCH_ASSOC)) {
        echo "<br>резулат на query: ",$row['name'];
    }
?>