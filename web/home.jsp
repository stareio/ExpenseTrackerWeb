<%-- 
    Document   : home
    Created on : 03 11, 22, 10:13:48 PM
    Author     : star
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        <header>
            <p><% out.print(getServletContext().getInitParameter("header")); %></p>
        </header>
        
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");    // HTTP 1.1
            response.setHeader("Pragma", "no-cache");    // HTTP 1.0
            response.setHeader("Expires", "0");    //prevents caching at the proxy server
            
            User account = (User) session.getAttribute("account");
        %>
        
        <h1 align="center">Hello, <% out.print(account.getNickname()); %></h1>
        
        <form name="DisplayResultForm" method="post" action="Expenses">
            <input name="action" type="submit" value="View List of Expenses">
        </form>
    </body>
</html>
