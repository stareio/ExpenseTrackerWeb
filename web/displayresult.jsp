<%-- 
    Document   : displayresult
    Created on : 02 27, 22, 7:11:19 PM
    Author     : star
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <p><% out.print(getServletContext().getInitParameter("title")); %></p>
        </header>
        
        <h1>Expense Table</h1>
        
        <table border="1" align="center">
            <tr>
                <th>Date</th>
                <th>Income/Expense</th>
                <th>Amount</th>
                <th>Category</th>
                <th>Note</th>
            </tr>
            
            <%
                // Retrieve the ResultSet
                ResultSet result = (ResultSet) request.getAttribute("results");
                while (result.next()) {
            %>
                <tr>
                    <td><%= result.getString("date") %></td>
                    <td><%= result.getString("income_expense") %></td>
                    <td><%= result.getString("amount") %></td>
                    <td><%= result.getString("category") %></td>
                    <td><%= result.getString("note") %></td>
                </tr>

            <%
                }
            %>
        </table> 
        
        <footer>
            <p><% out.print(getServletContext().getInitParameter("school")); %></p>
        </footer>
    </body>
</html>
