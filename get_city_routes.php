<?php
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

// Query to fetch city routes
$sql = "SELECT departure_city, arrival_city FROM city_admin_panel";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $routes = array();
    while ($row = $result->fetch_assoc()) {
        $routes[] = array(
            "departure" => $row['departure_city'],
            "arrival" => $row['arrival_city']
        );
    }
    echo json_encode(array("status" => "success", "routes" => $routes));
} else {
    echo json_encode(array("status" => "error", "message" => "No routes found"));
}

// Close the database connection
$conn->close();
?>