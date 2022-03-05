<%-- 
    Document   : displayresult
    Created on : 02 27, 22, 7:11:19 PM
    Author     : star
--%>

<%@page import="model.User"%>
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
            // retrieve the user's account
            User account = (User) request.getAttribute("account");
        %>
        
        <h1 align="center">Hello, <% out.print(account.getNickname()); %></h1>
        
        <table border="1" align="center">
            <tr>
                <th>Date</th>
                <th>Income/Expense</th>
                <th>Amount</th>
                <th>Category</th>
                <th>Description</th>
                <th>Action</th>
            </tr>
            
            <%
                List<Expense> result = (ArrayList) request.getAttribute("results");
                
                for (Expense e : result) {
            %>
            
                <tr>
                    <td><%= e.printDate() %></td>
                    <td><%= e.getInex() %></td>
                    <td><%= e.printAmount() %></td>
                    <td><%= e.getCategory() %></td>
                    <td><%= e.getDescription() %></td>
                    <td>
                        <form name="UpdateButton" method="post" action="Expenses">
                            <input name="action" type="submit" id="update" value="Update">
                            <input name="user" type="hidden" value="<%=account.getUsername()%>">
                            <input name="date" type="hidden" value="<%=e.getDate()%>">
                            <input name="descr" type="hidden" value="<%=e.getDescription()%>">
                        </form>
                        
                        <form name="DeleteButton" method="post" action="Expenses">
                            <input name="action" type="submit" id="delete" value="Delete">
                            <!--check if still need to pass username-->
                            <input name="user" type="hidden" value="<%= account.getUsername()%>">
                            <input name="date" type="hidden" value="<%=e.getDate()%>">
                            <input name="descr" type="hidden" value="<%=e.getDescription()%>">
                        </form>
                        
                    </td>
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
