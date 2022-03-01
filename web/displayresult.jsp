<%-- 
    Document   : displayresult
    Created on : 02 27, 22, 7:11:19 PM
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
            <input name="loginUsername" tpye="text" size="40"/>
            <input name="loginPassword" tpye="text" size="40"/>
            <input type="submit" value="Submit"/>
            <br><br>
        </form>
    </body>
</html>
