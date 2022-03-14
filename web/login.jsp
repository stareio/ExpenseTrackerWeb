<%-- 
    Document   : errorLogin
    Created on : 02 27, 22, 7:09:43 PM
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
    <body>
        <header class="py-3 mb-3 border-bottom bg-light">
            <div class="container">
                <div class="d-flex justify-content-center align-items-center mb-lg-0 me-lg-auto text-dark text-decoration-none">
                    <i class="bi bi-piggy-bank me-2" style="font-size: 25px" alt="Logo"></i>
                    <span class="d-flex align-items-center mb-0 mb-lg-0">
                        <% out.print(getServletContext().getInitParameter("header")); %>
                    </span>
                </div>
            </div>
        </header>
                    
        <div class="row d-flex justify-content-center">
            <div class="col-12 col-md-8 col-lg-6 col-xl-6">
                <div class="card shadow-2-strong text-black bg-light" style="border-radius: 1rem;">
                    <form name="LoginForm" method="post" action="Expenses" autocomplete="off" class="card-body p-5 text-center">
                        
                        <h3 class="mb-5">Login</h3>
                        
                        <div class="alert alert-danger d-flex align-items-center" role="alert">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="Warning:">
                                <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                            </svg>

                            <div>
                                Login Failed. Please try again.
                            </div>            
                        </div>

                        <div class="input-group input-group-sm mb-3">
                            <span class="input-group-text" style="width: 6em;">Username</span>
                            <input name="loginUsername" type="text" class="form-control"/>
                        </div>

                        <div class="input-group input-group-sm mb-3">
                            <span class="input-group-text" style="width: 6em;">Password</span>
                            <input name="loginPassword" type="password" class="form-control"/>
                        </div>

                        <input name="action" type="submit" id="submit-btn" value="Login"/>
                        
                    </form>
                </div>
            </div>
        </div>
        
        <footer class="text-center p-3 border-top bg-light">
            <div class="container">
            <span>
                <% out.print(getServletContext().getInitParameter("footer")); %>
            </span>
            </div>
        </footer>
    </body>
</html>
