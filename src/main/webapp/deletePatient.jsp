<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Patient | Hospital Care</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <nav class="navbar">
        <div class="brand">+ Hospital Care</div>
        <div>
            <a href="index.jsp">Home</a>
            <a href="addPatient.jsp">Add Patient</a>
            <a href="updatePatient.jsp">Update Patient</a>
            <a href="deletePatient.jsp">Delete Patient</a>
        </div>
    </nav>

    <main class="container">

        <section class="hero">
            <h1>Delete Patient Record</h1>
            <p>Hospital Patient Record Management System</p>
        </section>

        <section class="card">
            <h2>Remove Patient</h2>
            <p class="subtitle">
                Enter the ID of the patient whose record you want to delete.
            </p>

            <form class="patient-form"
                  action="DeletePatientServlet"
                  method="post"
                  onsubmit="return confirm('Are you sure you want to delete this patient record?');">

                <div class="form-group">
                    <label for="id">Patient ID</label>
                    <input type="number"
                           id="id"
                           name="id"
                           placeholder="Enter Patient ID"
                           required>
                </div>

                <div class="button-row">
                    <button type="submit" class="btn btn-primary">
                        Delete Patient
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
