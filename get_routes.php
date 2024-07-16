<?php
// Author : Abdullah Imran; GitHub: poetabdullah
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

$resultCity = $conn->query('SELECT CONCAT(departure_city, " - ", arrival_city) AS route FROM city_admin_panel');
$cityRoutes = $resultCity->fetch_all(MYSQLI_ASSOC);

$resultCountry = $conn->query('SELECT CONCAT(departure, " - ", arrival) AS route FROM country_admin_panel');
$countryRoutes = $resultCountry->fetch_all(MYSQLI_ASSOC);

$routes = array_merge($cityRoutes, $countryRoutes);

$routeStrings = array_map(function($route) {
    return $route['route'];
}, $routes);

echo json_encode(['routes' => $routeStrings]);

$conn->close();
?>