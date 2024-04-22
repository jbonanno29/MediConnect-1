<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Make an Appointment</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Make an Appointment</h1>
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
</body>
</html>
