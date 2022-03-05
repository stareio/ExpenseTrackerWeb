/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.math.RoundingMode;
import java.sql.*;
import java.text.DecimalFormat;
import java.util.*;

/**
 *
 * @author star
 */
public class ExpenseManager {
    
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
    
    // computes the total income
    public double getIncome(List<Expense> list) {
        Double income = 0.00;

        for (Expense e : list) {
            if (e.getInex().equals("Income")) {
                income = income + e.getAmount();
            }
        }
        
        System.out.println("income: " + income);
        return income;
    }
    
    // computes the total expenses
    public double getExpenses(List<Expense> list) {
        Double expenses = 0.00;
        
        for (Expense e : list) {
            if (e.getInex().equals("Expense")) {
                expenses = expenses + e.getAmount();
            }
        }
        
        System.out.println("income: " + expenses);
        
        return expenses;
    }
    
    // computes the remaining balance (income - expenses)
    public double getBalance(double income, double expenses) {
        Double balance = income - expenses;
        
        return balance;
    }
    
    // returns the amount as either a whole number or not
    public String printAmount(double amount) {
        String strAmount = amount + "";
        
        // checks if whole number
        if (amount - (int)amount == 0) {
            int i = (int) amount;
            strAmount = Integer.toString(i);
        }
        
        return strAmount;
    }
}
