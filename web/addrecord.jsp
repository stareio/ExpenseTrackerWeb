<%-- 
    Document   : updatelist
    Created on : 03 2, 22, 7:11:40 PM
    Author     : star
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update List</title>
    </head>
    <body>
        <header>
            <p><% out.print(getServletContext().getInitParameter("title")); %></p>
        </header>
        
        <h1>Hello World! Let's add a record!</h1>
        
        <!--accepts mm-dd-yyyy-->
        <% String patternDate = "/^(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])-\\d{4}$/";%>
        <!--accepts a max of XXXXXXXXX.XX--> 
        <% String patternAmt = "^\\d{1,9}(\\.[0]\\d|\\.1[01])?$";%>
        <!--accepts only either accented or non-accented letters; spaces are only allowed after a letter-->
        <% String patternText = "/^([a-zA-ZÀ-ÿ\u00f1\u00d1]+ ?)*$/";%>
        
        <form name="AddRecordForm" method="post" id="add" action="Expenses">
            <p>Date</p>
            <input name="Date" type="text" size="6" placeholder="01-23-2000" pattern="<%=patternDate%>"/>
            
            <p>Income/Expense</p>
            <select>
                <option value="1">Income</option>
                <option value="2">Expense</option>
            </select>
            <input name="Inex" type="submit"/>
            
            <p>Amount</p>
            <input name="Date" type="text" size="20"/>
            
            <p>Category</p>
            <input name="Date" type="text" size="40" placeholder="Food" pattern="<%=patternText%>"/>
            
            <p>Description</p>
            <input name="Date" type="text" size="40" placeholder="ex: Rice" pattern="<%=patternText%>"/>
            <input name="action" type="submit" id="submit-btn" value="Add Entry"/>
        </form>
        
        <footer>
            <p><% out.print(getServletContext().getInitParameter("school")); %></p>
        </footer>
    </body>
</html>

<!-- references:
regex (date): https://stackoverflow.com/questions/22061723/regex-date-validation-for-yyyy-mm-dd
regex (letters): https://stackoverflow.com/questions/52487915/regular-expression-to-validate-accents-spaces-and-only-letters
regex (spaces): https://stackoverflow.com/questions/15472764/regular-expression-to-allow-spaces-between-words
-->