package com.hospital;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ViewPatientServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Connection con = DBConnection.getConnection();

            String search = request.getParameter("search");

            String sql = "SELECT * FROM PATIENTS";

            if (search != null && !search.trim().isEmpty()) {
                sql += " WHERE TO_CHAR(PATIENT_ID)=? "
                     + "OR LOWER(PATIENT_NAME) LIKE LOWER(?)";
            }

            PreparedStatement ps = con.prepareStatement(sql);

            if (search != null && !search.trim().isEmpty()) {
                ps.setString(1, search);
                ps.setString(2, "%" + search + "%");
            }

            ResultSet rs = ps.executeQuery();

            out.println("<h2>Patient Records</h2>");

            out.println("<form>");
            out.println("<input name='search' placeholder='Search ID or Name'>");
            out.println("<input type='submit' value='Search'>");
            out.println("</form>");

            out.println("<table border='1'>");
            out.println("<tr><th>ID</th><th>Name</th><th>Age</th>"
                    + "<th>Gender</th><th>Contact</th>"
                    + "<th>Doctor</th><th>Date</th></tr>");

            while (rs.next()) {
                out.println("<tr>");
                for (int i = 1; i <= 7; i++) {
                    out.println("<td>" + rs.getString(i) + "</td>");
                }
                out.println("</tr>");
            }

            out.println("</table>");
            out.println("<a href='index.jsp'>Home</a>");

            con.close();

        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    }
}