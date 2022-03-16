<%-- 
    Document   : header
    Created on : 03 14, 22, 10:40:15 PM
    Author     : star
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav class="fixed-top py-3 mb-3 border-bottom navbar-light bg-light">
    <div class="container">
        <div class="d-flex justify-content-center align-items-center mb-lg-0 me-lg-auto text-dark text-decoration-none">
            <i class="bi bi-piggy-bank me-2" style="font-size: 25px" alt="Logo"></i>
            <span class="d-flex align-items-center mb-0 mb-lg-0">
                <% out.print(getServletContext().getInitParameter("header")); %>
            </span>
        </div>
    </div>
</nav>

<!--
reference:
https://getbootstrap.com/docs/5.0/examples/headers/#
-->