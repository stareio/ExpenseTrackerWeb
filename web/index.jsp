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
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link type="text/css" href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <header>
            <p><% out.print(getServletContext().getInitParameter("header")); %></p>
        </header>
        
        <div class="container">
            <div class="col-18 col-md-12 col-lg-6 col-xl-5">
        
                <h1>Login</h1>

                <form name="LoginForm" method="post" action="Expenses" autocomplete="off">
                    <div class="input-group input-group-sm mb-3">
                        <span class="input-group-text" id="login-field">Username</span>
                        <input name="loginUsername" type="text" class="form-control"/>
                    </div>

                    <div class="input-group input-group-sm mb-3">
                        <span class="input-group-text" id="login-field">Password</span>
                        <input name="loginPassword" type="password" class="form-control"/>
                    </div>

                    <input name="action" type="submit" id="submit-btn" value="Login"/>
                </form>
        
            </div>
        </div>
        
        <footer>
            <p><% out.print(getServletContext().getInitParameter("footer")); %></p>
        </footer>
    </body>
</html>