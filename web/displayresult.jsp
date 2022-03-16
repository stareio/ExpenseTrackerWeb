<%-- 
    Document   : displayresult
    Created on : 02 27, 22, 7:11:19 PM
    Author     : star
--%>

<%@page import="model.ExpenseManager"%>
<%@page import="model.User"%>
<%@page import="model.Expense"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of Expenses</title>
        <%@include file='css.jsp'%>
    </head>
    <body class="d-flex flex-column small-font">
        <%@include file='header.jsp'%>
        
        <div id="content" class="container-fluid">            
            <%           
                User account = (User) session.getAttribute("account");  
                ExpenseManager em = new ExpenseManager();
                List<Expense> result = (ArrayList) request.getAttribute("results");
            %>
            
            <div class="pt-5 text-center">
                <img src="css/coin_coinpile.png" id="coin-pile-size" alt="piles of coins image" class="pb-4">
            </div>
            
            <div class="row d-flex justify-content-center">
                <div class="col-sm-6">
                    <div class="card shadow-2-strong text-black bg-light pt-3 px-4" style="border-radius: 1rem;">
                        <h1 class="text-center py-2 pb-3">Hello, <% out.print(account.getNickname()); %>!</h1>

                        <table id="compute-table p-2" class="table table-borderless table">
                        <tr class="text-center">
                            <th>Income</th>
                            <th>Expenses</th>
                            <th>Balance</th>
                        </tr>
                        
                        <tr class="text-center">
                                <td><%= em.computeIncome(result) %></td>
                                <td><%= em.computeExpenses(result) %></td>
                                <td><%= em.computeBalance() %></td>
                            </tr>

                        </table>
                    </div>
                </div>
            </div>
            
            <div class="row d-flex justify-content-center p-5">

                <table id="records-table" class="table table-sm table-striped table-hover align-middle">    
                    <tr class="text-center">
                        <th>Date</th>
                        <th>Income/Expense</th>
                        <th>Amount</th>
                        <th>Category</th>
                        <th>Description</th>
                        <th>Action</th>
                    </tr>

                <%                
                    for (Expense e : result) {
                %>
                    <tr class="text-center">
                        <td><%= em.printDate(e.getDate()) %></td>
                        <td><%= e.getInex() %></td>
                        <td><%= em.printAmount(e.getAmount()) %></td>
                        <td><%= e.getCategory() %></td>
                        <td><%= e.getDescription() %></td>
                        <td>
                            <div class="d-grid gap-2 d-md-flex text-center justify-content-center">
                                <form name="UpdateButton" method="post" action="Expenses">
                                    <input name="action" type="submit" value="Update" id="update" class="btn btn-outline-primary btn-sm small-font">                 
                                    <!--references for updating the record-->
                                    <input name="updateDate" type="hidden" value="<%= e.getDate() %>"/>
                                    <input name="updateDescr" type="hidden" value="<%= e.getDescription() %>"/>
                                </form>

                                <form name="DeleteButton" method="post" action="Expenses">
                                    <input name="action" type="submit" value="Delete" id="delete" class="btn btn-outline-danger btn-sm small-font">
                                    <input name="date" type="hidden" value="<%=e.getDate()%>">
                                    <input name="descr" type="hidden" value="<%=e.getDescription()%>">
                                </form>
                            </div>
                        </td>
                    </tr>
                <%
                    }
                %>

                </table>

            </div>          
             
            <div class="container-fluid mb-4 text-center">
                <form name="AddEntry" method="post" action="Expenses">
                    <input name="action" type="submit" value="Add an Entry" id="add-entry-btn" class="btn btn-primary"/>
                </form>
            </div>
                
            <div class="container-fluid py-5 text-center">
                <img src="css/coin_coinstacks.png" id="coin-stacks-size" alt="stacks of coins image">
            </div>
        </div>
                
        <%@include file='footer.jsp'%>
    </body>
</html>

<script>
    if ( window.history.replaceState ) {
      window.history.replaceState( null, null, window.location.href );
    }
</script>

<!--
references:
JS to prevent resubmission of form: https://stackoverflow.com/questions/6320113/how-to-prevent-form-resubmission-when-page-is-refreshed-f5-ctrlr
-->