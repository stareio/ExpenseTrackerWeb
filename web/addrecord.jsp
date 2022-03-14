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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <%@include file='header.jsp'%>
        
        <%
            // retrieve the user's account
            User account = (User) session.getAttribute("account");
        %>
        
        <h1>Hello, <% out.print(account.getNickname()); %>! Let's <u>add</u> a record!</h1>
        
        <form name="AddRecordForm" method="post" id="add" action="Expenses" autocomplete="off">
            
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
        
        <%@include file='footer.jsp'%>
    </body>
</html>