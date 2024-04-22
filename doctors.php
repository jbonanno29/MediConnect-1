<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mediconnect - Doctors</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Doctors</h1>
        <table>
            <tr>
                <th>Doctor ID</th>
                <th>Name</th>
                <th>Specialty</th>
            </tr>
            <?php
                $conn = new mysqli("localhost", "root", "your_password", "MediConnect");
                if ($conn->connect_error) {
                    die("Connection failed: " . $conn->connect_error);
                }

                $sql = "SELECT * FROM Doctor";
                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    while($row = $result->fetch_assoc()) {
                        echo "<tr><td>" . $row["DocID"] . "</td><td>" . $row["FName"] . " " . $row["LName"] . "</td><td>" . $row["Specialty"] . "</td></tr>";
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
