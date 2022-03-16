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
        
        <div id="content" class="container-fluid pt-5">
            <div class="pt-5 text-center">
                <img src="css/coin_tired.png" alt="tired coin image" class="img-fluid">
            </div>
            
            <div class="row d-flex justify-content-center p-4 text-center">
                <div class="col-12 col-md-9 col-lg-5 col-xl-6 small-font">
                    <h1 class="mb-2">Page Unavailable</h1>

                    <p>Sorry for the inconvenience, but the page you're looking for 
                        isn't available.</p>
                </div>
            </div>
        </div>
            
        <%@include file='footer.jsp'%>
    </body>
</html>
