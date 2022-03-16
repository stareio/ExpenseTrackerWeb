<%-- 
    Document   : errorPage
    Created on : 03 10, 22, 3:55:01 PM
    Author     : star
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Entry Page</title>
        <%@include file='css.jsp'%>
    </head>
    <body class="d-flex flex-column h-100">
        <%@include file='header.jsp'%>
        
        <div>
            <img src="css/coin_sad.png" alt="sad coin image" class="img-fluid">
            
            <h1>Invalid Entry</h1>

            <p>Please input a valid entry</p>

            <form name="ReturnForm" method="post" action="Expenses">
                <input name="action" type="submit" id="submit-btn" value="Return"/>
            </form>
        </div>
        
        <%@include file='footer.jsp'%>
    </body>
</html>

<!--
references:
sad coin image: https://www.shutterstock.com/image-vector/sad-coin-character-wallpaper-free-space-1465036271
-->
