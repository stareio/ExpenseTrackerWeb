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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <%@include file='header.jsp'%>
        
        <h1>Invalid Entry</h1>
        
        <!--image-->
        
        <p>Please input a valid entry</p>
        
        <form name="ReturnForm" method="post" action="Expenses">
            <input name="action" type="submit" id="submit-btn" value="Return"/>
        </form>
        
        <%@include file='footer.jsp'%>
    </body>
</html>
