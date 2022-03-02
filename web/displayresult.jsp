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
                <th>Action</th>
            </tr>
            
            <%
                // Retrieve the List
                List<Expense> result = (ArrayList) request.getAttribute("results");
                int ctr = 0;
                
                for (Expense e : result) {
                    e.setId(ctr);
            %>
            
                <tr>
                    <td><%= e.printDate() %></td>
                    <td><%= e.getInex() %></td>
                    <td><%= e.printAmount() %></td>
                    <td><%= e.getCategory() %></td>
                    <td><%= e.getNote() %></td>
                    <td>
                        <form name="UpdateButton" method="post" action="ExpenseController">
                            <input name="updateRecord" type="button" id="update" value="Update">
                            <input name="id" type="hidden" value="<%=ctr%>">
                        </form>
                        
                        <form name="DeleteButton" method="post" action="ExpenseController">
                            <input name="deleteRecord" type="button" id="delete" value="Delete">
                            <input name="id" type="hidden" value="<%=ctr%>">
                        </form>
                        
                    </td>
                </tr>

            <%
                    ctr++;
                }
            %>
        </table> 
        
        <footer>
            <p><% out.print(getServletContext().getInitParameter("school")); %></p>
        </footer>
    </body>
</html>
