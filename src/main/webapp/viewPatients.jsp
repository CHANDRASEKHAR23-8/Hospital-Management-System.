<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.hospital.DBConnection" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Patients | Hospital Care</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .table-wrapper {
            width: 100%;
            overflow-x: auto;
            margin-top: 20px;
        }

        .patient-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
        }

        .patient-table th,
        .patient-table td {
            padding: 12px;
            border: 1px solid #e0e6ed;
            text-align: left;
            white-space: nowrap;
        }

        .patient-table th {
            background: #eaf2f8;
            color: #243b53;
        }

        .patient-table tr:nth-child(even) {
            background: #f8fafc;
        }

        .search-form {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            align-items: center;
            margin-top: 20px;
        }

        .search-form input[type="text"] {
            flex: 1;
            min-width: 200px;
            padding: 11px;
            border: 1px solid #cbd5e1;
            border-radius: 6px;
        }

        .message {
            padding: 12px;
            text-align: center;
        }
    </style>
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
            <h1>Hospital Patient Records</h1>
            <p>View and search registered patient information.</p>
        </section>

        <section class="card">
            <h2>Patient Records</h2>

            <form class="search-form" action="viewPatient.jsp" method="get">
                <input type="text"
                       name="search"
                       value="<%= request.getParameter("search") == null
                           ? "" : request.getParameter("search") %>"
                       placeholder="Search by Patient ID or Name">

                <button type="submit" class="btn btn-primary">
                    Search
                </button>

                <a href="viewPatient.jsp" class="btn btn-secondary">
                    Show All
                </a>
            </form>

            <div class="table-wrapper">
                <table class="patient-table">
                    <thead>
                        <tr>
                            <th>Patient ID</th>
                            <th>Patient Name</th>
                            <th>Age</th>
                            <th>Gender</th>
                            <th>Contact Number</th>
                            <th>Doctor Name</th>
                            <th>Appointment Date</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        Connection con = null;
                        PreparedStatement ps = null;
                        ResultSet rs = null;

                        try {
                            con = DBConnection.getConnection();

                            String search = request.getParameter("search");
                            String sql = "SELECT * FROM PATIENTS";

                            boolean hasSearch =
                                search != null && !search.trim().isEmpty();

                            if (hasSearch) {
                                sql += " WHERE TO_CHAR(PATIENT_ID) = ?"
                                     + " OR LOWER(PATIENT_NAME) LIKE LOWER(?)";
                            }

                            ps = con.prepareStatement(sql);

                            if (hasSearch) {
                                ps.setString(1, search.trim());
                                ps.setString(2, "%" + search.trim() + "%");
                            }

                            rs = ps.executeQuery();
                            boolean found = false;

                            while (rs.next()) {
                                found = true;
                    %>
                        <tr>
                            <td><%= rs.getInt("PATIENT_ID") %></td>
                            <td><%= rs.getString("PATIENT_NAME") %></td>
                            <td><%= rs.getInt("AGE") %></td>
                            <td><%= rs.getString("GENDER") %></td>
                            <td><%= rs.getString("CONTACT_NUMBER") %></td>
                            <td><%= rs.getString("DOCTOR_NAME") %></td>
                            <td><%= rs.getDate("APPOINTMENT_DATE") %></td>
                        </tr>
                    <%
                            }

                            if (!found) {
                    %>
                        <tr>
                            <td colspan="7" class="message">
                                No patient records found.
                            </td>
                        </tr>
                    <%
                            }
                        } catch (Exception e) {
                            application.log("Error loading patient records", e);
                    %>
                        <tr>
                            <td colspan="7" class="message">
                                Unable to load patient records.
                                Check the database connection and server log.
                            </td>
                        </tr>
                    <%
                        } finally {
                            try {
                                if (rs != null) rs.close();
                            } catch (SQLException ignored) {}

                            try {
                                if (ps != null) ps.close();
                            } catch (SQLException ignored) {}

                            try {
                                if (con != null) con.close();
                            } catch (SQLException ignored) {}
                        }
                    %>
                    </tbody>
                </table>
            </div>

            <div class="button-row">
                <a href="index.jsp" class="btn btn-secondary">
                    Back to Home
                </a>
            </div>
        </section>

    </main>

    <footer class="footer">
        Hospital Patient Record Management System
    </footer>

</body>
</html>