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
        <h1>Hello World!</h1>
        
        <form name="LoginForm" method="post" action="ExpenseController">
            <input name="loginUsername" type="text" size="40"/>
            <input name="loginPassword" type="text" size="40"/>
            <input type="submit" value="Submit"/>
            <br><br>
        </form>
    </body>
</html>
