<?php
// Author : Abdullah Imran; GitHub: poetabdullah
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
    echo json_encode(array("status" => "error", "message" => "Connection failed: " . $conn->connect_error));
    exit();
}

// Query to fetch country routes from country_admin_panel table
$sql = "SELECT departure, arrival FROM country_admin_panel";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $routes = array();
    while ($row = $result->fetch_assoc()) {
        $routes[] = array(
            "departure" => $row['departure'],
            "arrival" => $row['arrival']
        );
    }
    echo json_encode(array("status" => "success", "routes" => $routes));
} else {
    echo json_encode(array("status" => "error", "message" => "No routes found"));
}

// Close the database connection
$conn->close();
?>