<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Patient | Hospital Care</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <nav class="navbar">
        <div class="brand">+ Hospital Care</div>
        <div>
            <a href="index.jsp">Home</a>
            <a href="addPatient.jsp">Add Patient</a>
            <a href="updatePatient.jsp">Update Patient</a>
        </div>
    </nav>

    <main class="container">

        <section class="hero">
            <h1>🏥 Add New Patient</h1>
            <p>Hospital Patient Record Management System</p>
        </section>

        <section class="card">
            <h2>Patient Information</h2>
            <p class="subtitle">
                Enter the details below to register a patient.
            </p>

            <form class="patient-form"
                  action="AddPatientServlet"
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
                    <label for="name">Patient Name</label>
                    <input type="text"
                           id="name"
                           name="name"
                           placeholder="Enter Patient Name"
                           required>
                </div>

                <div class="form-group">
                    <label for="age">Age</label>
                    <input type="number"
                           id="age"
                           name="age"
                           min="0"
                           placeholder="Enter Age"
                           required>
                </div>

                <div class="form-group">
                    <label for="gender">Gender</label>
                    <select id="gender" name="gender" required>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="contact">Contact Number</label>
                    <input type="text"
                           id="contact"
                           name="contact"
                           placeholder="Enter Contact Number"
                           required>
                </div>

                <div class="form-group">
                    <label for="doctor">Doctor Name</label>
                    <input type="text"
                           id="doctor"
                           name="doctor"
                           placeholder="Enter Doctor Name"
                           required>
                </div>

                <div class="form-group">
                    <label for="date">Appointment Date</label>
                    <input type="date"
                           id="date"
                           name="date"
                           required>
                </div>

                <div class="button-row">
                    <button type="submit" class="btn btn-primary">
                        Add Patient
                    </button>

                    <button type="reset" class="btn btn-secondary">
                        Clear Form
                    </button>

                    <a href="index.jsp" class="btn btn-secondary">
                        ← Back to Home
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
