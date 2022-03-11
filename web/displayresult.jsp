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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link type="text/css" href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <header>
            <p><% out.print(getServletContext().getInitParameter("header")); %></p>
        </header>
        
        <%           
            User account = (User) session.getAttribute("account");  
            ExpenseManager em = new ExpenseManager();
            List<Expense> result = (ArrayList) request.getAttribute("results");
        %>
        
        <div class="container" id="displayresult-container">
            <table id="compute-table" class="table table-sm">
            <tr>
                <th>Income</th>
                <th>Expenses</th>
                <th>Balance</th>
            </tr>
 
            <tr>
                <td><%= em.computeIncome(result) %></td>
                <td><%= em.computeExpenses(result) %></td>
                <td><%= em.computeBalance() %></td>
            </tr>
 
        </table>
        
        <table id="records-table" class="table table-sm table-striped table-hover">    
            <tr>
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
                    <tr>
                        <td><%= em.printDate(e.getDate()) %></td>
                        <td><%= e.getInex() %></td>
                        <td><%= em.printAmount(e.getAmount()) %></td>
                        <td><%= e.getCategory() %></td>
                        <td><%= e.getDescription() %></td>
                        <td>
                            <div class="d-grid gap-2 d-md-flex">
                                <form name="UpdateButton" method="post" action="Expenses" >
                                    <input name="action" type="submit" value="Update" id="update" class="btn btn-outline-primary btn-sm">                 
                                    <!--references for updating the record-->
                                    <input name="updateDate" type="hidden" value="<%= e.getDate() %>"/>
                                    <input name="updateDescr" type="hidden" value="<%= e.getDescription() %>"/>
                                </form>

                                <form name="DeleteButton" method="post" action="Expenses">
                                    <input name="action" type="submit" value="Delete" id="delete" class="btn btn-outline-danger btn-sm">
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

            <form name="AddRecord" method="post" action="Expenses">
                <input name="action" type="submit" value="Add an Entry"/>
            </form>
        </div>
        
        <footer>
            <p><% out.print(getServletContext().getInitParameter("footer")); %></p>
        </footer>
    </body>
</html>