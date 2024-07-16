<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "db_tickettrack";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Define queries with DATE_FORMAT for AM/PM format
$queries = [
    'IntraCountryMorning' => "SELECT route_no, departure_station, arrival_station, DATE_FORMAT(departure_time, '%r') AS departure_time, DATE_FORMAT(arrival_time, '%r') AS arrival_time, distance, fare, time_taken FROM IntraCountryMorning",
    'IntraCountryAfternoon' => "SELECT route_no, departure_station, arrival_station, DATE_FORMAT(departure_time, '%r') AS departure_time, DATE_FORMAT(arrival_time, '%r') AS arrival_time, distance, fare, time_taken FROM IntraCountryAfternoon",
    'IntraCountryEvening' => "SELECT route_no, departure_station, arrival_station, DATE_FORMAT(departure_time, '%r') AS departure_time, DATE_FORMAT(arrival_time, '%r') AS arrival_time, distance, fare, time_taken FROM IntraCountryEvening",
    'InterCountryMorning' => "SELECT route_no, departure_station, arrival_station, DATE_FORMAT(departure_time, '%r') AS departure_time, DATE_FORMAT(arrival_time, '%r') AS arrival_time, distance, fare, time_taken FROM InterCountryMorning",
    'InterCountryAfternoon' => "SELECT route_no, departure_station, arrival_station, DATE_FORMAT(departure_time, '%r') AS departure_time, DATE_FORMAT(arrival_time, '%r') AS arrival_time, distance, fare, time_taken FROM InterCountryAfternoon",
    'InterCountryEvening' => "SELECT route_no, departure_station, arrival_station, DATE_FORMAT(departure_time, '%r') AS departure_time, DATE_FORMAT(arrival_time, '%r') AS arrival_time, distance, fare, time_taken FROM InterCountryEvening"
];

$data = [];

foreach ($queries as $key => $query) {
    $result = $conn->query($query);
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $data[$key][] = $row;
        }
    }
}

$conn->close();

header('Content-Type: application/json');
echo json_encode($data);
?>