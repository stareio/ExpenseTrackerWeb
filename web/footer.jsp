<%-- 
    Document   : footer
    Created on : 03 14, 22, 10:40:55 PM
    Author     : star
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav class="fixed-bottom py-3 flex-shrink-0 border-top navbar-light bg-light text-muted">
    <div class="container">
        <span>
            <% out.print(getServletContext().getInitParameter("footer")); %>
        </span>
    </div>
</nav>