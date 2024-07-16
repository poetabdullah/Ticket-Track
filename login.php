<?php
// Author: Hammad; GitHub: Hammad448
include 'db.php';

$username = $_POST['username'];
$password = md5($_POST['password']); // Hash the password

$sql = "SELECT * FROM users WHERE (username='$username' OR gmail='$username') AND password='$password'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Check if the user is admin
    $row = $result->fetch_assoc();
    if ($row['username'] == 'admin') {
        echo "admin";
    } else {
        echo "success";
    }
} else {
    echo "Invalid username or password.";
}

$conn->close();
?>