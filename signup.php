<?php
include 'db.php';

$username = $_POST['username'];
$name = $_POST['name'];
$gender = $_POST['gender'];
$age = $_POST['age'];
$gmail = $_POST['gmail'];
$password = md5($_POST['password']); // Hash the password

$sql = "INSERT INTO users (username, name, gender, age, gmail, password) VALUES ('$username', '$name', '$gender', $age, '$gmail', '$password')";

if ($conn->query($sql) === TRUE) {
    echo "Signed up successfully.";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>