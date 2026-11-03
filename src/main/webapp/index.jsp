<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital Care | Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css?v=3">
</head>
<body>

<header class="topbar">
    <a class="logo" href="index.jsp">
        <span class="logo-icon">+</span>
        <span>Hospital<span class="logo-light">Care</span></span>
    </a>
    <span class="system-label">PATIENT MANAGEMENT SYSTEM</span>
</header>

<main class="dashboard">

    <section class="welcome">
        <div>
            <span class="eyebrow">HOSPITAL ADMINISTRATION</span>
            <h1>Patient Management</h1>
            <p>Welcome to the Hospital Patient Record Management System.</p>
        </div>
        <div class="welcome-icon">✚</div>
    </section>

    <section class="menu-section">
        <div class="section-heading">
            <div>
                <h2>Patient Services</h2>
                <p>Select an operation to manage patient records.</p>
            </div>
            <span class="menu-count">4 SERVICES</span>
        </div>

        <div class="service-grid">

            <a href="addPatient.jsp" class="service-card add-card">
                <div class="service-icon">＋</div>
                <span class="service-number">01</span>
                <h3>Add Patient</h3>
                <p>Register a new patient and enter their details.</p>
                <span class="card-action">Open service <span>→</span></span>
            </a>

           <a href="viewPatients.jsp" class="service-card view-card">
                <div class="service-icon">▤</div>
                <span class="service-number">02</span>
                <h3>View Patients</h3>
                <p>View patient records and search by ID or name.</p>
                <span class="card-action">Open service <span>→</span></span>
            </a>

            <a href="updatePatient.jsp" class="service-card update-card">
                <div class="service-icon">✎</div>
                <span class="service-number">03</span>
                <h3>Update Patient</h3>
                <p>Update contact, doctor, and appointment details.</p>
                <span class="card-action">Open service <span>→</span></span>
            </a>

            <a href="deletePatient.jsp" class="service-card delete-card">
                <div class="service-icon">−</div>
                <span class="service-number">04</span>
                <h3>Delete Patient</h3>
                <p>Remove an existing patient record by patient ID.</p>
                <span class="card-action">Open service <span>→</span></span>
            </a>

        </div>
    </section>

    <section class="notice">
        <span class="notice-icon">ⓘ</span>
        <p><strong>Reminder:</strong> Verify the patient ID before updating or deleting a record.</p>
    </section>

</main>

<footer class="site-footer">
    <span>+ Hospital Care</span>
    <span>Hospital Patient Record Management System</span>
</footer>

</body>
</html>