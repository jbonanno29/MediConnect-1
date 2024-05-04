
<!DOCTYPE html>
<html>
<head>
    <title>Patient Search</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Patient Search</h1>
        <form action="" method="post">
            <label for="search">Enter Patient Name:</label><br>
            <input type="text" id="search" name="search" required><br><br>
            <input type="submit" value="Search">
        </form>
        <br>
        <h2>Patient Information</h2>
        <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Database connection
        $servername = "localhost";
        $username = "root";
        $password = "Asmi25122002";
        $dbname = "MediConnect";

        $conn = new mysqli($servername, $username, $password, $dbname);

        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        // Retrieve search term
        $search = $_POST['search'];

        // Fetch patient information from database
        $sql = "SELECT * FROM Patient WHERE CONCAT(FName, ' ', LName) LIKE '%$search%'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                echo "<strong>Name:</strong> " . $row["FName"] . " " . $row["LName"] . "<br>";
                echo "<strong>Date of Birth:</strong> " . $row["DOB"] . "<br>";
                echo "<strong>Sex:</strong> " . $row["Sex"] . "<br>";
                echo "<strong>Insurance:</strong> " . $row["Insurance"] . "<br><br>";

                // Fetch medical records for the patient
                $sql_medical = "SELECT MedicalRecords.Date, MedicalRecords.Time, Doctor.FName AS DocFName, Doctor.LName AS DocLName, MedicalRecords.Diagnosis
                                FROM MedicalRecords
                                INNER JOIN Doctor ON MedicalRecords.DoctorID = Doctor.DocID
                                WHERE MedicalRecords.PatientID = " . $row["PID"];
                $result_medical = $conn->query($sql_medical);

                if ($result_medical->num_rows > 0) {
                    echo "<strong>Medical Records:</strong><br>";
                    echo "<table border='1'>";
                    echo "<tr><th>Date</th><th>Time</th><th>Doctor</th><th>Diagnosis</th></tr>";
                    while($row_medical = $result_medical->fetch_assoc()) {
                        echo "<tr>";
                        echo "<td>" . $row_medical["Date"] . "</td>";
                        echo "<td>" . $row_medical["Time"] . "</td>";
                        echo "<td>" . $row_medical["DocFName"] . " " . $row_medical["DocLName"] . "</td>";
                        echo "<td>" . $row_medical["Diagnosis"] . "</td>";
                        echo "</tr>";
                    }
                    echo "</table>";
                } else {
                    echo "No medical records found for this patient";
                }
            }
        } else {
            echo "No patient found";
        }

        $conn->close();
    }
    ?>
</body>
</html>
