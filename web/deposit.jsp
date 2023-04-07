<%-- 
    Document   : deposit
    Created on : 28 Dec, 2022, 12:54:09 AM
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
            out.println("Accno "+accno+"<br>");-->
           
            <centre>
    <div class="row justify-content-md-center">
        <div class="col-md-11" id="mainscreen" style="background-color:#BCCEF8;">

        
        <div class="row">
            <div class="col-md-3" style="float: left;padding-left: 5px;">
                <div class="buttons">
                    <ul class="buttons" style='list-style-type: none;' class="buttons">
                        <li style="margin: 10px;padding: 5px; background-color:#0D4C92; border: 2px black;border-radius: 5px;"><a style="color:white; text-decoration: underline;font-weight:bolder;padding: 120px;" class="lists" href="deposit.jsp">Deposit</a> </li>
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="balance.jsp">Balance</a></li> 
                
                <li style=" margin: 10px;padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="withdraw.jsp">Withdraw</a></li>
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="transfer.jsp">Transfer</a></li>
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="ministatement.jsp">Mini Statement</a></li>
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="accountsettings.jsp">Set Transaction Limit</a></li>
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="block.jsp">Request for Block</a></li>
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="update_password.jsp">Password Update</a></li></ul>
                </div>  </div>
            <div class="col-md-9" style="float:right;">
               
                   
                   
                <% 
                    out.println("<form method='post' action='deposit_db.jsp'>" );
                     out.println("<h2 class='headlines' style='color:black;padding-top:20px;'>Enter Amount to Deposit : <input type='text' name='depositamt' placeholder='in Rs'><br></h2>");
                     
            out.println("<input type='submit' style='background-color:green;color:white;padding:8px;margin-left:80%;border-radius:5px;' value='Deposit'></form>");
                     
        }
        catch(Exception e){
            out.println(e);
        }
            %>
        </div>
        

</div>
</div>
    </div>
</centre>
<!--        <centre>
            <div class="row justify-content-md-center">
            <div class="col-md-3">
                <div class="modalmsg" id="modalmsg" style=" background-color: black;height: 150px;width:300px; z-index:1">
                <div class="msgheader" id="msgheader">
                    
                </div>
                <div class="msgmsg" id="msgmsg">
                    
                </div>
                <div class="msgfooter" id="msgfooter">
                    
                </div>
                </div>
            </div>
            </div>
        </centre>-->

      
            
    </body>
</html>
