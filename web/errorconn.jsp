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
        <%@include file='css.jsp'%>
    </head>
    <body class="d-flex flex-column h-100 small-font">
        <%@include file='header.jsp'%>
        
        <div id="content" class="container-fluid pt-5">
            <div class="pt-5 text-center">
                <img src="css/error_conn_edited.png" id="error-conn" alt="database connection error image" class="mb-2">
            </div>
            
            <div class="row d-flex justify-content-center p-4 text-center">
                <div class="col-12 col-md-9 col-lg-5 col-xl-6 small-font">
                    <h1 class="mb-2">Connection Error</h1>

                    <p>Sorry for the inconvenience. The web app was unable to
                        establish a connection to the database :(</p>
                </div>
            </div>
        </div>
            
        <%@include file='footer.jsp'%>
    </body>
</html>

<!--
references:
database error image: https://www.dreamstime.com/database-error-color-line-icon-vector-flat-elements-mobile-concept-web-apps-thin-icons-website-design-development-app-image121490201
-->