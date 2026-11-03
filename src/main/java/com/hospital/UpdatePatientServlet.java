package com.hospital;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class UpdatePatientServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Connection con = DBConnection.getConnection();

            String sql = "UPDATE PATIENTS SET CONTACT_NUMBER=?, "
                       + "DOCTOR_NAME=?, APPOINTMENT_DATE=? "
                       + "WHERE PATIENT_ID=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, request.getParameter("contact"));
            ps.setString(2, request.getParameter("doctor"));
            ps.setDate(3, Date.valueOf(request.getParameter("date")));
            ps.setInt(4, Integer.parseInt(request.getParameter("id")));

            int result = ps.executeUpdate();

            if (result > 0) {
                out.println("<h2>Patient Updated Successfully!</h2>");
            } else {
                out.println("<h2>Patient ID Not Found!</h2>");
            }

            con.close();

        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }

        out.println("<a href='index.jsp'>Home</a>");
    }
}