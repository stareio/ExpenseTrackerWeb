<%-- 
    Document   : index
    Created on : 02 27, 22, 4:34:37 PM
    Author     : star
--%>

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
        
        <h1>Hello World!</h1>
        
        <form name="LoginForm" method="post" action="ExpenseController">
            <input name="loginUsername" type="text" id="login" size="40" placeholder="Username"/>
            <input name="loginPassword" type="text" id="login" size="40" placeholder="Password"/>
            <input name="action" type="submit" id="submit-btn" value="Submit"/>
        </form>
        
        <footer>
            <p><% out.print(getServletContext().getInitParameter("school")); %></p>
        </footer>
    </body>
</html>
