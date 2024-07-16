<?php
$servername = "localhost";
$username = "root";
$password = ""; // Change if you have set a password for the root user
$dbname = "db_tickettrack";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>