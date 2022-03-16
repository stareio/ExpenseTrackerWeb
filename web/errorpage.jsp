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
        <title>Error Page</title>
        <%@include file='css.jsp'%>
    </head>
    <body class="d-flex flex-column h-100">
        <%@include file='header.jsp'%>
        
        <div>
            <img src="css/coin_tired.png" alt="tired coin image" class="img-fluid">
            
            <h1>Page Unavailable</h1>

            <!--image-->

            <p>Sorry for the inconvenience, but the page you're looking for isn't available.</p>
        </div>
            
        <%@include file='footer.jsp'%>
    </body>
</html>
