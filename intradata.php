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
    echo json_encode(['status' => 'error', 'message' => 'Connection failed: ' . $conn->connect_error]);
    exit();
}

// Helper function to get POST data safely
function get_post($key) {
    return isset($_POST[$key]) ? $_POST[$key] : '';
}

// Get form data
$name = get_post('name1');
$departure = get_post('departure1');
$arrival = get_post('arrival1');
$date = get_post('date1');
$time = get_post('time1');
$category = get_post('category1');
$passengers = get_post('passengers1');

// Validate the inputs (add your own validation rules as needed)
if (empty($name) || empty($departure) || empty($arrival) || empty($date) || empty($time) || empty($category) || empty($passengers)) {
    echo json_encode(['status' => 'error', 'message' => 'Please fill in all fields.']);
    exit();
}

// Prepare the SQL statement to insert data
$sql = "INSERT INTO tbl_intra (Name_of_Passenger, Departure_Station, Arrival_Station, Date, Time, Category_of_Seat, Number_of_Passengers) 
VALUES ('$name', '$departure', '$arrival', '$date', '$time', '$category', '$passengers')";

// Run the SQL query and check if it was successful
if ($conn->query($sql) === TRUE) {
    echo json_encode(['status' => 'success', 'message' => 'Data added to the database successfully']);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Error adding data to the database: ' . $conn->error]);
}

// Close the database connection
$conn->close();
?>
