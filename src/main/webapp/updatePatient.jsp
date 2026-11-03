<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Patient | Hospital Care</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <nav class="navbar">
        <div class="brand">+ Hospital Care</div>
        <div>
            <a href="index.jsp">Home</a>
            <a href="addPatient.jsp">Add Patient</a>
            <a href="ViewPatientServlet">View Patients</a>
            <a href="updatePatient.jsp">Update Patient</a>
            <a href="deletePatient.jsp">Delete Patient</a>
        </div>
    </nav>

    <main class="container">
        <section class="hero">
            <h1>🏥 Update Patient Details</h1>
            <p>Hospital Patient Record Management System</p>
        </section>

        <section class="card">
            <h2>Patient Information</h2>
            <p class="subtitle">
                Enter the ID of an existing patient and the new details.
            </p>

            <form class="patient-form"
                  action="UpdatePatientServlet"
                  method="post">

                <div class="form-group">
                    <label for="id">Patient ID</label>
                    <input type="number"
                           id="id"
                           name="id"
                           placeholder="Enter Patient ID"
                           required>
                </div>

                <div class="form-group">
                    <label for="contact">New Contact Number</label>
                    <input type="text"
                           id="contact"
                           name="contact"
                           placeholder="Enter New Contact Number"
                           required>
                </div>

                <div class="form-group">
                    <label for="doctor">New Doctor Name</label>
                    <input type="text"
                           id="doctor"
                           name="doctor"
                           placeholder="Enter New Doctor Name"
                           required>
                </div>

                <div class="form-group">
                    <label for="date">New Appointment Date</label>
                    <input type="date"
                           id="date"
                           name="date"
                           required>
                </div>

                <div class="button-row">
                    <button type="submit" class="btn btn-primary">
                        Update Patient
                    </button>

                    <a href="index.jsp" class="btn btn-secondary">
                        Back to Home
                    </a>
                </div>

            </form>
        </section>
    </main>

    <footer class="footer">
        Hospital Patient Record Management System
    </footer>

</body>
</html>