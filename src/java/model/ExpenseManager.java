/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.*;
import java.util.*;

/**
 *
 * @author star
 */
public class ExpenseManager {
    
    private double income;
    private double expenses;
    
    public List<Expense> getExpenses(Connection conn, String action, String date, String descr) {
        
        List<Expense> list = new ArrayList<>();
        
        try {
            String query = "";
            System.out.println("action is: " + action);
            
            if (!action.equals("Login")) {
                System.out.println("date: " + date);
                System.out.println("descr: " + descr);
                
                if (action.equals("Delete")) {
                    query = "DELETE FROM expense WHERE date = ? AND description = ?";
                    PreparedStatement ps = conn.prepareStatement(query);
                    ps.setString(1, date);
                    ps.setString(2, descr);

                    ps.executeUpdate();
                    System.out.println("record deleted!");
                }
                
                else if (action.equals("Add")) {
                    query = ""; // query for insert
                    
                    query = "INSERT INTO expense WHERE NOT EXISTS "
                            + "(SELECT FROM expense WHERE date = ? AND description = ?)";
                    PreparedStatement ps = conn.prepareStatement(query);
                    ps.setString(1, date);
                    ps.setString(2, descr);
                    
                    ps.executeUpdate();
                    System.out.println("record added!");
                }
            }
            
            query = "SELECT * FROM expense ORDER BY date";
            PreparedStatement ps = conn.prepareStatement(query);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
                Expense e = new Expense();
                
                e.setDate(rs.getDate("date"));
                e.setInex(rs.getString("income_expense"));
                e.setAmount(rs.getString("amount"));
                e.setCategory(rs.getString("category"));
                e.setDescription(rs.getString("description"));
                list.add(e);
            }
        }
        
        catch (SQLException sqle) {
            sqle.printStackTrace();
        }
        
        return list;
    }
    
    // computes & displays the total income
    public String computeIncome(List<Expense> list) {
        income = 0.00;

        for (Expense e : list) {
            if (e.getInex().equals("Income")) {
                income = income + e.getAmount();
            }
        }
        
        System.out.println("income: " + income);
        return printAmount(income);
    }
    
    // computes & displays the total expenses
    public String computeExpenses(List<Expense> list) {
        expenses = 0.00;
        
        for (Expense e : list) {
            if (e.getInex().equals("Expense")) {
                expenses = expenses + e.getAmount();
            }
        }
        
        System.out.println("income: " + expenses);
        
        return printAmount(expenses);
    }
    
    // computes & displays the remaining balance (income - expenses)
    public String computeBalance() {
        Double balance = income - expenses;
        
        return printAmount(balance);
    }
    
    // returns the amount as either a whole number or not
    public String printAmount(double amount) {
        String strAmount = amount + "";
        
        // removes decimal places if whole number
        if (amount - (int)amount == 0) {
            int i = (int) amount;
            strAmount = Integer.toString(i);
        }
        
        return strAmount;
    }
}
