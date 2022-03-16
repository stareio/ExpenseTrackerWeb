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
        <title>Update Entry</title>
        <%@include file='css.jsp'%>
    </head>
    <body class="d-flex flex-column h-100 small-font">
        <%@include file='header.jsp'%>
        
        <div id="content" class="container-fluid"> 
            <%
                User account = (User) session.getAttribute("account");
                ExpenseManager em = new ExpenseManager();
                List<Expense> result = (ArrayList) request.getAttribute("results");
            %>

                <div class="pt-5 text-center">
                    <img src="css/coin_meditate.png" alt="meditating coin image" class="pb-4">
                </div>

                <div class="row d-flex justify-content-center p-5">
                    <h1 class="text-center pb-4">Hello, <% out.print(account.getNickname()); %>! Let's <u>update</u> a record!</h1>

                    <table id="update-table" class="table table-sm table-striped p-2">
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
                </div>

            <div class="row d-flex justify-content-center">
                <div id="input-card" class="col-md-6">
                    <div class="card shadow-2-strong text-black bg-light px-4 py-3" style="border-radius: 1rem;">
                        <form name="UpdateEntryForm" method="post" id="update" action="Expenses" autocomplete="off">

                            <div class="mb-3">
                                <label for="inputDate" class="form-label ps-1">Date</label>
                                <input name="date" type="text" placeholder="ex: 01/23/2000"
                                       aria-describedby="dateHelp" class="form-control form-text-input small-font" required/>
                                <div id="dateHelp" class="form-text ps-1">
                                    Must follow the MM/DD/YYYY format.
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="inputDate" class="form-label ps-1">Income/Expense</label>
                                <select name="inex" aria-describedby="inexHelp" class="form-select form-inex-input small-font">
                                    <option value="Income">Income</option>
                                    <option value="Expense">Expense</option>
                                </select>
                                <div id="inexHelp" class="form-text ps-1">
                                    Indicate whether the record is an income or an expense.
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="inputAmount" class="form-label ps-1">Amount</label>
                                <input name="amount" type="text" placeholder="ex: 4500, 256.25"
                                       aria-describedby="amountHelp" class="form-control form-text-input small-font" required/>
                                <div id="amountHelp" class="form-text ps-1">
                                    Must be 1-20 characters long and have 0-2 decimal places.
                                </div>
                            </div>           

                            <div class="mb-3">
                                <label for="inputCategory" class="form-label ps-1">Category</label>
                                <input name="category"type="text" placeholder="ex: Education, Food"
                                       aria-describedby="categoryHelp" class="form-control form-text-input small-font" required/>
                                <div id="categoryHelp" class="form-text ps-1">
                                    Must be 1-15 characters long.
                                </div>
                            </div>
                            
                            <div class="mb-5">
                                <label for="inputDescription" class="form-label ps-1">Description</label>
                                <input name="descr" type="text" placeholder="ex: Education, Food"
                                       aria-describedby="descriptionHelp" class="form-control form-text-input small-font" required/>
                                <div id="descriptionHelp" class="form-text ps-1">
                                    Must be 1-20 characters long.
                                </div>
                            </div>

                            <div class="container-fluid my-4 text-center">
                                <input name="action" type="submit" id="update-entry-btn" value="Update Entry" class="btn btn-primary"/>
                                <input name="updateDate" type="hidden" value=""/>
                                <input name="updateDescr" type="hidden" value=""/>
                            </div>
                        </form>
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

<script>
    window.onload = function() {
        if(!window.location.hash) {
            window.location = window.location + '#loaded';
            window.location.reload();
        }
    }
</script>

<!--
reference:
JS to refresh page once: https://stackoverflow.com/questions/6985507/one-time-page-refresh-after-first-page-load
-->