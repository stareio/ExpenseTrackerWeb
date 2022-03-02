<%-- 
    Document   : displayresult
    Created on : 02 27, 22, 7:11:19 PM
    Author     : star
--%>

<%@page import="model.Expense"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of Expenses</title>
    </head>
    <body>
        <header>
            <p><% out.print(getServletContext().getInitParameter("title")); %></p>
        </header>
        
        <%
            // Retrieve the user's nickname
            String name = (String) request.getAttribute("displayName");
        %>
        
        <h1 align="center">Hello, <% out.print(name); %></h1>
        
        <table border="1" align="center">
            <tr>
                <th>Date</th>
                <th>Income/Expense</th>
                <th>Amount</th>
                <th>Category</th>
                <th>Note</th>
            </tr>
            
            <%
                // Retrieve the List
                List<Expense> result = (ArrayList) request.getAttribute("results");
                
                for (Expense e : result) {
            %>
            
                <tr>
                    <td><%= e.printDate() %></td>
                    <td><%= e.getInex() %></td>
                    <td><%= e.printAmount() %></td>
                    <td><%= e.getCategory() %></td>
                    <td><%= e.getNote() %></td>
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
