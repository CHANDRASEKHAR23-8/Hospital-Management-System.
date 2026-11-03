package com.hospital;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AddPatientServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO PATIENTS VALUES (?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, Integer.parseInt(request.getParameter("id")));
            ps.setString(2, request.getParameter("name"));
            ps.setInt(3, Integer.parseInt(request.getParameter("age")));
            ps.setString(4, request.getParameter("gender"));
            ps.setString(5, request.getParameter("contact"));
            ps.setString(6, request.getParameter("doctor"));
            ps.setDate(7, Date.valueOf(request.getParameter("date")));

            int result = ps.executeUpdate();

            if (result > 0) {
                out.println("<h2>Patient Added Successfully!</h2>");
            }

            con.close();

        } catch (Exception e) {
            out.println("<h2>Error: " + e.getMessage() + "</h2>");
        }

        out.println("<a href='index.jsp'>Home</a>");
    }
}