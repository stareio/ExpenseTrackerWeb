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
        <%@include file='css.jsp'%>
    </head>
    <body class="container-fluid d-flex flex-column py-100">
        <%@include file='header.jsp'%>
        
        <div id="content" class="container-fluid">
            <div class="pt-5 text-center">
                <img src="css/coin_happy.png" id="happy-coin-size" alt="happy coin image">
            </div>

            <div class="container-fluid my-100">
                <div class="row d-flex justify-content-center">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-6">
                        <div class="card shadow-2-strong text-black bg-light p-40" style="border-radius: 1rem;">
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

                                <input name="action" type="submit" value="Login" class="btn btn-primary"/>

                            </form>
                        </div>
                    </div>
                </div>
            </div>            

            <div class="container-fluid py-5 text-center">
                <img src="css/coin_coinstacks.png" id="coin-stacks-size" alt="stacks of coins image">
            </div>
        </div>
            
        <%@include file='footer.jsp'%>
    </body>
</html>

<!--
references:
login template: https://mdbootstrap.com/docs/standard/extended/login/
coin images: https://www.shutterstock.com/image-vector/sad-coin-character-wallpaper-free-space-1465036271
-->