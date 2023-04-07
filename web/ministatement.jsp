<%-- 
    Document   : ministatement
    Created on : 28 Dec, 2022, 11:17:58 PM
    Author     : ARUN KUMAR
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db_connection.db_connection"%>
<%@include file="usernav.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
            <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>

            <script>
                $(document).ready(function () {
                $('#table1').DataTable();
                  });
                </script>
    </head>
    <body>
        
        <% try{
            String accno=session.getAttribute("accno").toString();
            db_connection db=new db_connection();
            Connection con=db.dbcon();
            
            String query="select * from account where account_no=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, accno);
            ResultSet rs=ps.executeQuery();
            rs.next();
            String name=rs.getString("name");
            int balance=rs.getInt("balance");
            %>
            <centre>
<div class="row justify-content-md-center" id="balancerow">
    <div class="col-md-8 justify-content-md-center" id="balance">
        <%
            out.println("<h4 class='headlines'>Account Holder Name : "+name+"</h4>");
            out.println("<h4 class='headlines'>Account Number : "+accno+"</h4>");
             out.println("<h4 class='headlines'>Balance : Rs."+balance+"</h4>");
            %>
    </div>
    </div>
</centre>
            
<!--            out.println("Name "+name+"<br>");
            out.println("Accno "+accno+"<br>"); -->
           
            <centre>
    <div class="row justify-content-md-center">
        <div class="col-md-11" id="mainscreen" style="background-color:white;">

        
       <!-- <div class="row">
            <div class="col-md-3" style="float: left;padding-left: 5px;">
                <div class="buttons">
                    <ul class="buttons" style='list-style-type: none;' class="buttons"><li style="margin: 10px; padding: 5px; background-color:#0D4C92; border: 2px black;border-radius: 5px;"><a style="color:white; text-decoration: underline;font-weight:bolder;padding: 120px;" class="lists" href="balance.jsp">Balance</a></li> 
                <li style="margin: 10px;padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="deposit.jsp">Deposit</a> </li>
                <li style=" margin: 10px;padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="withdraw.jsp">Withdraw</a></li>
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="transfer.jsp">Transfer</a></li>
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="ministatement.jsp">Mini Statement</a></li>
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="accountsettings.jsp">Set Transaction Limit</a></li>
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="block.jsp">Request for Block</a></li>
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="update_password.jsp">Password Update</a></li></ul>
                </div>  </div>-->
            <!--<div class="col-md-9" style="float:right;"> -->
                <table id="table1" class="display" style="width:100%">
        <thead>
            <tr>
                                    <th>Transaction ID</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <th>Type</th>
                                    <th>From Acc No</th>
                                    <th>To Acc No</th>
                                    <th>Amount</th>
            </tr>
        </thead>
        <tbody>
               
                   
                   
                <% 
                     String query2="SELECT * FROM `transactions` WHERE from_acc_no=? or to_acc_no=? order by tid desc";
            PreparedStatement ps2=con.prepareStatement(query2);
            ps2.setString(1, accno);
            ps2.setString(2, accno);
            ResultSet rs2=ps2.executeQuery();
            int i=1;
            while(i<=10 && rs2.next()){
                   out.println("<tr><td>"+rs2.getInt("tid")+"</td>" );
                   out.println("<td>"+rs2.getDate("date_time")+"</td>");
                   out.println("<td>"+rs2.getTime("date_time")+"</td>");
                   out.println("<td>"+rs2.getString("type")+"</td>");
                   out.println("<td>"+rs2.getString("from_acc_no")+"</td>");
                   out.println("<td>"+rs2.getString("to_acc_no")+"</td>");
                   String t=rs2.getString("type");
                   if(t.equals("self")){
                   out.println("<td>+"+rs2.getInt("amount")+"</td></tr>");
                   }
                   else if(t.equals("withdraw")){
                       out.println("<td>-"+rs2.getInt("amount")+"</td></tr>");
                   }
                   else if(t.equals("transfer")){
//                       String f=rs2.getString("from_acc_no");
//                       String to=rs2.getString("to_acc_no");
                       if(accno.equals(rs2.getString("from_acc_no"))){
                           out.println("<td>-"+rs2.getInt("amount")+"</td></tr>");
                       }
                       if(accno.equals(rs2.getString("to_acc_no"))){
                           out.println("<td>+"+rs2.getInt("amount")+"</td></tr>");
                       }
                   }
                   else{
                       out.println("<td>"+rs2.getInt("amount")+"</td></tr>");
                   }
                   i++;
                }
            
        }
        catch(Exception e){
            out.println(e);
        }
            %>
        <!--</div>-->
        

</div>
</div>
    <!--</div-->
</centre>
        
       
    </body>
</html>
