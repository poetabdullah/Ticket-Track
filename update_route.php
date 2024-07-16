<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

$host = 'localhost';
$db = 'db_tickettrack';
$user = 'root';
$pass = '';

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die('Connection failed: ' . $conn->connect_error);
}

header('Content-Type: application/json');

$data = json_decode(file_get_contents('php://input'), true);

if (!isset($data['route']) || !isset($data['newDeparture']) || !isset($data['newArrival'])) {
    echo json_encode(['success' => false, 'message' => 'Invalid input']);
    exit();
}

$route = $data['route'];
$newDeparture = $data['newDeparture'];
$newArrival = $data['newArrival'];

list($departure, $arrival) = explode("-", $route);
$departure = trim($departure);
$arrival = trim($arrival);

$stmt = null;
if (strpos($departure, ',') !== false) {
    $stmt = $conn->prepare("UPDATE country_admin_panel SET departure = ?, arrival = ? WHERE departure = ? AND arrival = ?");
} else {
    $stmt = $conn->prepare("UPDATE city_admin_panel SET departure_city = ?, arrival_city = ? WHERE departure_city = ? AND arrival_city = ?");
}

if (!$stmt) {
    echo json_encode(['success' => false, 'message' => 'Prepare failed: (' . $conn->errno . ') ' . $conn->error]);
    exit();
}

$stmt->bind_param("ssss", $newDeparture, $newArrival, $departure, $arrival);

if ($stmt->execute()) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['success' => false, 'message' => 'Error updating route: (' . $stmt->errno . ') ' . $stmt->error]);
}

$stmt->close();
$conn->close();
?>