/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.time.*;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author star
 */
public class EntryValidator {
    // methods return true if input is valid
    
    public boolean checkDate(String str) {
        
        try {
            // check the length
            if (str.length() == 10){
                String[] split = str.split("/");
                
                int year = Integer.parseInt(split[0]);
                int month = Integer.parseInt(split[1]);
                int day = Integer.parseInt(split[2]);

                // throws a DTE if an invalid date value is passed to it
                LocalDate ld = LocalDate.of(year, month, day);
                
                System.out.println("date1: " + str);
                System.out.println("date2:" + ld);
                
                return true;
            }
        }
        
        catch (DateTimeException dte) {
            dte.printStackTrace();
        } 

        return false;
    }
    
    public boolean checkAmount(String amount) {
        try {
            double d = Double.valueOf(amount);
            
            return true;
        }
        
        catch (NumberFormatException nfe) {
            nfe.printStackTrace();
        }
        
        return false;
    }
}

// reference:
// date splitting: https://stackoverflow.com/questions/36290467/how-to-get-day-month-year-from-string-date