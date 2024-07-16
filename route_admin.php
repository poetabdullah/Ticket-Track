<?php
// Author: Abdullah Imran; GitHub: poetabdullah
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

// Fetch data from city_admin_panel
$cityAdminQuery = "SELECT id, departure_city, arrival_city, price FROM city_admin_panel";
$cityAdminResult = $conn->query($cityAdminQuery);

if ($cityAdminResult->num_rows > 0) {
    // Store city_admin_panel data in an associative array
    $cityAdminData = [];
    while ($row = $cityAdminResult->fetch_assoc()) {
        $cityAdminData[$row['id']] = [
            'departure_city' => $row['departure_city'],
            'arrival_city' => $row['arrival_city'],
            'price' => $row['price']
        ];
    }

    // Define the intra-country tables to update
    $intraTables = ['IntraCountryMorning', 'IntraCountryAfternoon', 'IntraCountryEvening'];

    // Update each intra-country table
    foreach ($intraTables as $table) {
        // Fetch all rows from the current table
        $tableQuery = "SELECT route_no FROM $table";
        $tableResult = $conn->query($tableQuery);

        if ($tableResult->num_rows > 0) {
            while ($row = $tableResult->fetch_assoc()) {
                $routeNo = $row['route_no'];

                // Update the current row with data from city_admin_panel
                if (isset($cityAdminData[$routeNo])) {
                    $updateQuery = "UPDATE $table SET 
                        departure_station = '" . $cityAdminData[$routeNo]['departure_city'] . "',
                        arrival_station = '" . $cityAdminData[$routeNo]['arrival_city'] . "',
                        fare = '" . $cityAdminData[$routeNo]['price'] . "'
                        WHERE route_no = $routeNo";
                    $conn->query($updateQuery);
                }
            }
        }
    }
}

// Fetch data from country_admin_panel
$countryAdminQuery = "SELECT id, departure, arrival, price FROM country_admin_panel";
$countryAdminResult = $conn->query($countryAdminQuery);

if ($countryAdminResult->num_rows > 0) {
    // Store country_admin_panel data in an associative array
    $countryAdminData = [];
    while ($row = $countryAdminResult->fetch_assoc()) {
        $countryAdminData[$row['id']] = [
            'departure' => $row['departure'],
            'arrival' => $row['arrival'],
            'price' => $row['price']
        ];
    }

    // Define the inter-country tables to update
    $interTables = ['InterCountryMorning', 'InterCountryAfternoon', 'InterCountryEvening'];

    // Update each inter-country table
    foreach ($interTables as $table) {
        // Fetch all rows from the current table
        $tableQuery = "SELECT route_no FROM $table";
        $tableResult = $conn->query($tableQuery);

        if ($tableResult->num_rows > 0) {
            while ($row = $tableResult->fetch_assoc()) {
                $routeNo = $row['route_no'];

                // Update the current row with data from country_admin_panel
                if (isset($countryAdminData[$routeNo])) {
                    $updateQuery = "UPDATE $table SET 
                        departure_station = '" . $countryAdminData[$routeNo]['departure'] . "',
                        arrival_station = '" . $countryAdminData[$routeNo]['arrival'] . "',
                        fare = '" . $countryAdminData[$routeNo]['price'] . "'
                        WHERE route_no = $routeNo";
                    $conn->query($updateQuery);
                }
            }
        }
    }
}



$conn->close();
?>