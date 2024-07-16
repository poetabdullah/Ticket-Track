<?php
// Author: Ambreen; GitHub: AmbreenAmbi04
// Set the response type to JSON
header('Content-Type: application/json');

// Database connection details
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "db_tickettrack";

// Connect to the database
$conn = new mysqli($servername, $username, $password, $dbname);

// Check if the connection failed
if ($conn->connect_error) {
    echo '{"status": "error", "message": "Connection failed: ' . $conn->connect_error . '"}';
    exit();
}

// Helper function to get POST data safely
function get_post($key) {
    return isset($_POST[$key]) ? $_POST[$key] : '';
}

// Get form data
$name = get_post('name');
$departure = get_post('departure');
$arrival = get_post('arrival');
$id = get_post('id');
$date = get_post('date');
$time = get_post('time');
$category = get_post('category');
$passengers = get_post('passengers');

// Prepare the SQL statement to insert data
$sql = "INSERT INTO tbl_inter (Name_of_Passenger, Departure_Station, Arrival_Station, ID_Card, Date, Time, Category_of_Seat, Number_of_Passengers) 
VALUES ('$name', '$departure', '$arrival', '$id', '$date', '$time', '$category', '$passengers')";

// Run the SQL query and check if it was successful
if ($conn->query($sql) === TRUE) {
    echo '{"status": "success", "message": "Data added to the database successfully"}';
} else {
    echo '{"status": "error", "message": "Error adding data to the database: ' . $conn->error . '"}';
}

// Close the database connection
$conn->close();
?>