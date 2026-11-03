package com.hospital;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class DeletePatientServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Connection con = DBConnection.getConnection();

            String sql = "DELETE FROM PATIENTS WHERE PATIENT_ID=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, Integer.parseInt(request.getParameter("id")));

            int result = ps.executeUpdate();

            if (result > 0) {
                out.println("<h2>Patient Deleted Successfully!</h2>");
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