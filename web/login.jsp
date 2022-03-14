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
        <%@include file='css.jsp'%>
    </head>
    <body>
        <%@include file='header.jsp'%>
                    
        <main>
            <div class="row d-flex justify-content-center">
                <div class="col-12 col-md-8 col-lg-6 col-xl-6">
                    <div class="card shadow-2-strong text-black bg-light" style="border-radius: 1rem;">
                        <form name="LoginForm" method="post" action="Expenses" autocomplete="off" class="card-body p-5 text-center">

                            <h3 class="mb-4">Login</h3>

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

                            <input name="action" type="submit" value="Login" class="btn btn-primary" style="font-size: 14px;"/>

                        </form>
                    </div>
                </div>
            </div>
        </main>
        
        <%@include file='footer.jsp'%>
    </body>
</html>
