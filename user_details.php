<?php
include 'db.php';

// Handle delete request
if (isset($_POST['delete_id'])) {
    $delete_id = $_POST['delete_id'];
    
    // Check if the user is admin
    $checkAdmin = $conn->prepare("SELECT username FROM users WHERE id=?");
    $checkAdmin->bind_param("i", $delete_id);
    $checkAdmin->execute();
    $checkAdmin->bind_result($username);
    $checkAdmin->fetch();
    $checkAdmin->close();

    if ($username !== 'admin') {
        $sql = "DELETE FROM users WHERE id=?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $delete_id);
        if ($stmt->execute()) {
            echo "<script>alert('User deleted successfully');</script>";
        } else {
            echo "<script>alert('Error deleting user');</script>";
        }
        $stmt->close();
    } else {
        echo "<script>alert('Admin cannot be deleted');</script>";
    }
}

$sql = "SELECT id, username, name, gender, age, gmail FROM users";
$result = $conn->query($sql);

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(to right, #2C3E50, #4CA1AF);
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .container {
        background: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 20px;
        width: 100%;
        max-width: 800px;
        overflow-x: auto;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    th,
    td {
        padding: 12px 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #4CA1AF;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    </style>
</head>

<body>
    <div class="container">
        <h2 class="text-center mb-4">User Details</h2>
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>Age</th>
                    <th>Gmail</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <?php
                if ($result->num_rows > 0) {
                    while($row = $result->fetch_assoc()) {
                        echo "<tr>
                                <td>" . $row["id"]. "</td>
                                <td>" . $row["username"]. "</td>
                                <td>" . $row["name"]. "</td>
                                <td>" . $row["gender"]. "</td>
                                <td>" . $row["age"]. "</td>
                                <td>" . $row["gmail"]. "</td>
                                <td>
                                    <form method='POST' style='display:inline-block'>
                                        <input type='hidden' name='delete_id' value='" . $row["id"]. "'>
                                        <button type='submit' class='btn btn-danger btn-sm'>Delete</button>
                                    </form>
                                </td>
                              </tr>";
                    }
                } else {
                    echo "<tr><td colspan='7' class='text-center'>No records found</td></tr>";
                }
                $conn->close();
                ?>
            </tbody>
        </table>
    </div>
</body>

</html>