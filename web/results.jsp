<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Results Page</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
    
    <%
        int hrsWorked = Integer.parseInt(request.getParameter("worked"));
        int hrRate = Integer.parseInt(request.getParameter("pay"));
        int preTaxDeduct = Integer.parseInt(request.getParameter("pretax"));
        int postTaxDeduct = Integer.parseInt(request.getParameter("posttax"));
        int regularHours;
        int otHours;
        double otPayRate;
        double otPay;
        double regularPay;
        double grossPay;
        double taxAmount;
        double postTaxPay;
        double netPay;
        
        if (hrsWorked > 40){
    regularHours = 40;
    otHours = hrsWorked - 40;
    otPayRate = hrRate * 1.5;
    otPay = otHours * otPayRate;
    regularPay = regularHours * hrRate;
    grossPay = regularPay + otPay;
    }
        else {
                grossPay = hrsWorked * hrRate;
                otHours = 0;
                otPayRate = 0;
                }
        
        double taxablePay = grossPay - preTaxDeduct;
        
        if (grossPay < 500){
            taxAmount = taxablePay * 0.18;
        }
        
        else {
            taxAmount = taxablePay * 0.22;
        }
        
        postTaxPay = taxablePay - taxAmount;
        netPay = postTaxPay - postTaxDeduct;
        %>
        
    <body>
        <h1>Salary Info</h1>
        <hr/>
        <table id="table2" border="1">
            <tbody>
                <tr>
                    <td>Total Hours Worked:</td>
                    <td><%= hrsWorked %></td>
                </tr>
                
                <tr>
                    <td>Hourly Rate:</td>
                    <td><%= hrRate %></td>
                </tr>
                
                <tr>
                    <td># Hours Overtime:</td>
                    <td><%= otHours %></td>
                </tr>
                
                <tr>
                    <td>Overtime Hourly Rate:</td>
                    <td><%= otPayRate %></td>
                </tr>
                
                <tr>
                    <td>Gross Pay:</td>
                    <td><%= grossPay %></td>
                </tr>
                
                <tr>
                    <td>Pre-tax Deduct:</td>
                    <td><%= preTaxDeduct %></td>
                </tr>
                
                <tr>
                    <td>Pre-tax Pay:</td>
                    <td><%= taxablePay %></td>
                </tr>
                
                <tr>
                    <td>Tax Amount:</td>
                    <td><%= taxAmount %></td>
                </tr>
                
                <tr>
                    <td>Post-tax Pay:</td>
                    <td><%= postTaxPay %></td>
                </tr>
                
                <tr>
                    <td>Post-tax Deduct:</td>
                    <td><%= postTaxDeduct %></td>
                </tr>
                
                <tr>
                    <td>Net Pay:</td>
                    <td><%= netPay %></td>
                </tr>
            </tbody>
        </table>
    </body>
</html>
