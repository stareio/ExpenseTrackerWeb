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
        <title>Login Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link type="text/css" href="css/style.css" rel="stylesheet">
    </head>
    <body class="d-flex flex-column h-100">
        <%@include file='header.jsp'%>
        
        <main>    
            
            <!--image of spinning coin-->
            
            <div class="row d-flex justify-content-center">
                <div class="col-12 col-md-8 col-lg-6 col-xl-6">
                    <div class="card shadow-2-strong text-black bg-light" style="border-radius: 1rem;">
                        <form name="LoginForm" method="post" action="Expenses" autocomplete="off" class="card-body p-5 text-center">

                            <h3 class="mb-5">Login</h3>

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" style="width: 6em;">Username</span>
                                <input name="loginUsername" type="text" class="form-control"/>
                            </div>

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" style="width: 6em;">Password</span>
                                <input name="loginPassword" type="password" class="form-control"/>
                            </div>

                            <input name="action" type="submit" value="Login" class="btn btn-primary" style="font-size: 14px;"/>

                        </form>
                    </div>
                </div>
            </div>
        </main>
        
        <%@include file='footer.jsp'%>
    </body>
</html>

<!--
references:
header: https://getbootstrap.com/docs/5.0/examples/headers/#
login template: https://mdbootstrap.com/docs/standard/extended/login/
gold coin gif: https://tenor.com/view/coins-gold-coins-spin-gif-17512701
-->