<%-- 
    Document   : updatelist
    Created on : 03 2, 22, 7:11:40 PM
    Author     : star
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.ExpenseManager"%>
<%@page import="model.Expense"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Record</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link type="text/css" href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <%@include file='header.jsp'%>
        
        <%
            User account = (User) session.getAttribute("account");
            ExpenseManager em = new ExpenseManager();
            List<Expense> result = (ArrayList) request.getAttribute("results");
        %>
        
        <div class="container" id="displayresult-container">
            <h1>Hello, <% out.print(account.getNickname()); %>! Let's <u>update</u> a record!</h1>
            
            <table id="update-table" class="table table-sm table-striped">
                <tr>
                    <th>Date</th>
                    <th>Income/Expense</th>
                    <th>Amount</th>
                    <th>Category</th>
                    <th>Description</th>
                </tr>

                <%                
                    for (Expense e : result) {
                %>
                        <tr>
                            <td><%= em.printDate(e.getDate()) %></td>
                            <td><%= e.getInex() %></td>
                            <td><%= em.printAmount(e.getAmount()) %></td>
                            <td><%= e.getCategory() %></td>
                            <td><%= e.getDescription() %></td>
                        </tr>
                <%
                    }
                %>
            </table>
        
            <form name="UpdateRecordForm" method="post" id="update" action="Expenses" autocomplete="off">

                <p>Date</p>
                <input name="date" type="text" size="25" placeholder="ex: 01/23/2000" required/>

                <p>Income/Expense</p>
                <select name="inex">
                    <option value="Income">Income</option>
                    <option value="Expense">Expense</option>
                </select>

                <p>Amount</p>
                <input name="amount" type="text" size="25" placeholder="ex: 500, 256.25" required/>

                <p>Category</p>
                <input name="category" type="text" size="25" placeholder="ex: Education, Food" required/>

                <p>Description</p>
                <input name="descr" type="text" size="25" placeholder="ex: Books, Rice" required/>

                <div>
                    <input name="action" type="submit" id="update-btn" value="Update Record"/>
                    <input name="updateDate" type="hidden" value=""/>
                    <input name="updateDescr" type="hidden" value=""/>
                </div>
            </form>
        </div>
            
        <%@include file='footer.jsp'%>
    </body>
</html>