<%-- 
    Document   : error
    Created on : 02 27, 22, 4:43:02 PM
    Author     : star
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Connection Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <%@include file='css.jsp'%>
    </head>
    <body class="d-flex flex-column h-100">
        <%@include file='header.jsp'%>
        
        <div>
            <img src="css/error_conn_edited.png" alt="database connection error image"
                 class="img-fluid">
            
            <h1>Connection Error</h1>

            <p>Sorry for the inconvenience. The web app was unable to
                establish a connection to the database :(</p>
        </div>
            
        <%@include file='footer.jsp'%>
    </body>
</html>

<!--
references:
database error image: https://www.dreamstime.com/database-error-color-line-icon-vector-flat-elements-mobile-concept-web-apps-thin-icons-website-design-development-app-image121490201
-->