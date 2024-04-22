<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mediconnect - Appointments</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MediConnect - Make an Appointment</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>MediConnect</h1>
        <nav>
            <ul>
                <li><a href="index.php">Home</a></li>
                <li><a href="about.php">About</a></li>
                <li><a href="contact.php">Contact</a></li>
                <!-- Add more navigation links as needed -->
            </ul>
        </nav>
    </header>

    <main>
        <h2>Make an Appointment</h2>
        <form action="make_appointment.php" method="POST">
            <label for="doctor">Select Doctor:</label>
            <select name="doctor" id="doctor">
                <option value="1">Matthew Rodriguez (Physician)</option>
                <option value="2">Olivia Perez (Dermatologist)</option>
                <option value="3">Ethan Torres (Anesthesiologist)</option>
                <!-- Add options for other doctors -->
            </select><br><br>
            <label for="date">Date:</label>
            <input type="date" name="date" id="date" required><br><br>
            <label for="time">Time:</label>
            <input type="time" name="time" id="time" required><br><br>
            <label for="name">Your Name:</label>
            <input type="text" name="name" id="name" required><br><br>
            <label for="email">Your Email:</label>
            <input type="email" name="email" id="email" required><br><br>
            <input type="submit" value="Make Appointment">
        </form>
    </main>

    <footer>
        <!-- Footer content -->
    </footer>
</body>
</html>

    <div class="container">
        <h1>Appointments</h1>
        <table>
            <tr>
                <th>Doctor</th>
                <th>Patient</th>
                <th>Date</th>
                <th>Time</th>
            </tr>
            <?php
                $conn = new mysqli("localhost", "your_username", "your_password", "MediConnect");
                if ($conn->connect_error) {
                    die("Connection failed: " . $conn->connect_error);
                }

                $sql = "SELECT Doctor.FName AS DocFName, Doctor.LName AS DocLName, Patient.FName AS PatientFName, Patient.LName AS PatientLName, Appointment.Date, Appointment.Time FROM Appointment INNER JOIN Doctor ON Appointment.DoctorID = Doctor.DocID INNER JOIN Patient ON Appointment.PatientID = Patient.PID";
                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    while($row = $result->fetch_assoc()) {
                        echo "<tr><td>" . $row["DocFName"] . " " . $row["DocLName"] . "</td><td>" . $row["PatientFName"] . " " . $row["PatientLName"] . "</td><td>" . $row["Date"] . "</td><td>" . $row["Time"] . "</td></tr>";
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
