<!DOCTYPE html>
<html>
<head>
    <title>Make Appointment</title>
</head>
<body>
    <h2>Make Appointment</h2>
    <form action="make_appointment.php" method="post">
        <label for="doctor">Select Doctor:</label><br>
        <select id="doctor" name="doctor">
            <?php
            // Database connection
            $servername = "localhost";
            $username = "your_username";
            $password = "your_password";
            $dbname = "MediConnect";

            $conn = new mysqli($servername, $username, $password, $dbname);

            if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
            }

            // Fetch doctors from database
            $sql = "SELECT * FROM Doctor";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                    echo "<option value='" . $row["DocID"] . "'>" . $row["FName"] . " " . $row["LName"] . " - " . $row["Specialty"] . "</option>";
                }
            } else {
                echo "<option>No doctors available</option>";
            }

            $conn->close();
            ?>
        </select><br><br>
        <label for="patient">Select Patient:</label><br>
        <select id="patient" name="patient">
            <?php
            // Database connection
            $conn = new mysqli($servername, $username, $password, $dbname);

            if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
            }

            // Fetch patients from database
            $sql = "SELECT * FROM Patient";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                    echo "<option value='" . $row["PID"] . "'>" . $row["FName"] . " " . $row["LName"] . "</option>";
                }
            } else {
                echo "<option>No patients available</option>";
            }

            $conn->close();
            ?>
        </select><br><br>
        <label for="date">Date:</label><br>
        <input type="date" id="date" name="date" required><br><br>
        <label for="time">Time:</label><br>
        <input type="time" id="time" name="time" required><br><br>
        <label for="name">Your Name:</label><br>
        <input type="text" id="name" name="name" required><br><br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>


