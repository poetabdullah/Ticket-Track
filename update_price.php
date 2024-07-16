<?php
// Author: Abdullah Imran; GitHub: poetabdullah
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

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $route = $_POST['route'];
    $price = $_POST['price'];

    if ($price < 20 || $price > 100) {
        echo json_encode(['error' => 'Price must be between 20 and 100.']);
        exit();
    }

    list($departure, $arrival) = explode("-", $route);
    $departure = trim($departure);
    $arrival = trim($arrival);

    $stmt = null;
    if (strpos($departure, ',') !== false) {
        $stmt = $conn->prepare("UPDATE country_admin_panel SET price = ? WHERE departure = ? AND arrival = ?");
    } else {
        $stmt = $conn->prepare("UPDATE city_admin_panel SET price = ? WHERE departure_city = ? AND arrival_city = ?");
    }

    if (!$stmt) {
        echo json_encode(['error' => 'Prepare failed: (' . $conn->errno . ') ' . $conn->error]);
        exit();
    }

    $stmt->bind_param("dss", $price, $departure, $arrival);

    if ($stmt->execute()) {
        echo json_encode(['success' => 'Price updated successfully.']);
    } else {
        echo json_encode(['error' => 'Error updating price: (' . $stmt->errno . ') ' . $stmt->error]);
    }

    $stmt->close();
    $conn->close();
}
?>