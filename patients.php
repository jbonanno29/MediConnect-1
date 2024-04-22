<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mediconnect - Patients</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Patients</h1>
        <table>
            <tr>
                <th>Patient ID</th>
                <th>Name</th>
                <th>Date of Birth</th>
                <th>Sex</th>
                <th>Insurance</th>
            </tr>
            <?php
                $conn = new mysqli("localhost", "your_username", "your_password", "MediConnect");
                if ($conn->connect_error) {
                    die("Connection failed: " . $conn->connect_error);
                }

                $sql = "SELECT * FROM Patient";
                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    while($row = $result->fetch_assoc()) {
                        echo "<tr><td>" . $row["PID"] . "</td><td>" . $row["FName"] . " " . $row["LName"] . "</td><td>" . $row["DOB"] . "</td><td>" . $row["Sex"] . "</td><td>" . $row["Insurance"] . "</td></tr>";
                    }
                    echo "</table>";
                } else {
                    echo "0 results";
                }
                $conn->close();
            ?>
        </table>
        <a href="index.php">Back to Home</a>
    </div>
</body>
</html>
