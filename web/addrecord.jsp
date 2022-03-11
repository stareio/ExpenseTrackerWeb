<%-- 
    Document   : updatelist
    Created on : 03 2, 22, 7:11:40 PM
    Author     : star
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Record</title>
    </head>
    <body>
        <header>
            <p><% out.print(getServletContext().getInitParameter("header")); %></p>
        </header>
        
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");    // HTTP 1.1
            response.setHeader("Pragma", "no-cache");    // HTTP 1.0
            response.setHeader("Expires", "0");    //prevents caching at the proxy server
            
            // retrieve the user's account
            User account = (User) session.getAttribute("account");
            
            // check if user is logged in
            if(account == null) {
                response.sendRedirect("errorLogin.jsp");
            }
        %>
        
        <h1>Hello, <% out.print(account.getNickname()); %>! Let's <u>add</u> a record!</h1>
        
        <form name="AddRecordForm" method="post" id="add" action="Expenses">
            
            <p>Date</p>
            <input name="date" type="text" size="25" placeholder="ex: 01/23/2000" required/>
            
            <p>Income/Expense</p>
            <select name="inex">
                <option value="Income">Income</option>
                <option value="Expense">Expense</option>
            </select>
            
            <p>Amount</p>
            <input name="amount" type="text" size="25" placeholder="ex: 500, 256.25" required/>
            
            <p>Category</p>
            <input name="category" type="text" size="25" placeholder="ex: Education, Food" required/>
            
            <p>Description</p>
            <input name="descr" type="text" size="25" placeholder="ex: Books, Rice" required/>
            
            <div>
                <input name="action" type="submit" id="add-btn" value="Add Record"/>
            </div>
        </form>
        
        <footer>
            <p><% out.print(getServletContext().getInitParameter("footer")); %></p>
        </footer>
    </body>
</html>