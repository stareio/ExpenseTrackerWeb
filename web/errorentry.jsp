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
        
        <div id="content" class="container-fluid pt-5">
            <div class="pt-5 text-center">
                <img src="css/coin_sad.png" alt="sad coin image" class="img-fluid">
            </div> 
            
            <div class="row d-flex justify-content-center p-4 text-center">
                <div id="small-font" class="col-12 col-md-9 col-lg-5 col-xl-6">
                    <h1 class="mb-2">Invalid Entry</h1>

                    <p>Please input a valid entry</p>

                    <form name="ReturnForm" method="post" action="Expenses">
                        <input name="action" id="return-btn" type="submit" value="Return" class="btn btn-primary mt-4"/>
                    </form>
                </div>
            </div>
        </div>
        
        <%@include file='footer.jsp'%>
    </body>
</html>

<!--
references:
sad coin image: https://www.shutterstock.com/image-vector/sad-coin-character-wallpaper-free-space-1465036271
-->
