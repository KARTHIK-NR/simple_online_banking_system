<%-- 
    Document   : transfer
    Created on : 28 Dec, 2022, 8:13:18 PM
    Author     : ARUN KUMAR
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
             int w_limit=rs.getInt("withdraw_limit");
             
             String pattern="yyyy-MM-dd";
            SimpleDateFormat simpleDateFormat =new SimpleDateFormat(pattern);
//            Date d=new Date();
            String s=simpleDateFormat.format(new Date())+"%";
//            out.println(simpleDateFormat);
            //out.println(s);
            
            String query4="select count(tid),sum(amount) from transactions where from_acc_no=? and date_time like ? and (type=? or type=?)";
//            select * from transactions where from_acc_no="MYS906641" and date_time like "2022-12-30%" and (type="withdraw" or type="transfer");
            PreparedStatement ps4=con.prepareStatement(query4);
            ps4.setString(1, accno);
            ps4.setString(2, s);
            ps4.setString(3, "withdraw");
            ps4.setString(4, "transfer");
//            ps4.setString(3, sdate);
            ResultSet rs4=ps4.executeQuery();
            
            rs4.next();
            int t_count=rs4.getInt("count(tid)");
            int t_sum=rs4.getInt("sum(amount)");
            
            String query5="select * from manager";
            PreparedStatement ps5=con.prepareStatement(query5);
            
            ResultSet rs5=ps5.executeQuery();
            rs5.next();
            int daily_limit=rs5.getInt("daily_limit_no");
            

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
                        <li style=" margin: 10px;padding: 5px; background-color:#0D4C92; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: underline;font-weight: bolder;padding: 120px;" class="lists" href="transfer.jsp">Transfer</a></li>
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="balance.jsp">Balance</a></li> 
                <li style="margin: 10px;padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white; text-decoration: none;font-weight:bolder;" class="lists" href="deposit.jsp">Deposit</a> </li>
                
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="withdraw.jsp">Withdraw</a></li>
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="ministatement.jsp">Mini Statement</a></li>
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="accountsettings.jsp">Set Transaction Limit</a></li>
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="block.jsp">Request for Block</a></li>
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="update_password.jsp">Password Update</a></li></ul>
                </div>  </div>
            <div class="col-md-9" style="float:right;">
               
                   
                   
                <% 
//                     out.println("<form method='post' action='transfer_db.jsp'>" );
//            out.println("Select Account Number to Transfer Money:<select name='credit_acc'><br>");
//             String query2="select * from account";
//            PreparedStatement ps2=con.prepareStatement(query2);
//            
//            ResultSet rs2=ps2.executeQuery();
//            while(rs2.next())
//            {
//            String credit_name=rs2.getString("name");
//            String credit_acc=rs2.getString("account_no");
//            out.println("<option value='"+credit_acc+"'>"+credit_acc+"</option><br><br>");
//            }
//            out.println("</select><br>");
//            out.println("Enter Amount:<input type='text' name='amt'><br><br>");
//            out.println("<input type='submit' value='Transfer Money'>");

                    out.println("<form method='post' action='transfer_db.jsp'>" );
                    
                     out.println("<h3 class='headlines' style='color:black;padding-top:20px;'>Select Account Number to Transfer Money : <select name='credit_acc'></h3><br>");
                      String query2="select * from account where status='approved'";
            PreparedStatement ps2=con.prepareStatement(query2);
            
            ResultSet rs2=ps2.executeQuery();
            while(rs2.next())
            {
            String credit_name=rs2.getString("name");
            String credit_acc=rs2.getString("account_no");
            if(!(credit_acc.equals(accno))){
            out.println("<option value='"+credit_acc+"'>"+credit_acc+"</option><br><br>");
            }
            }
            out.println("</select><br>");
             out.println("<h3 class='headlines' style='color:black;padding-top:20px;'>Enter Amount : <input type='text' name='amt'><br></h3>");
            
            out.println("<input type='submit' style='background-color:green;color:white;padding:8px;margin-left:45%;border-radius:5px;' value='Transfer Money'></form>");
                
            int rem_lim=w_limit-t_sum;
            int rem_count=t_count-daily_limit;
            out.println("<div class='infotable' style='border:2px black;'> ");
            out.println("<h6>Withdrawal Limit :"+w_limit+"</h6>");
            out.println("<h6>Amount Transacted Today :"+t_sum+"</h6>");
            out.println("<h6>Allowed Transaction Limit :"+rem_lim+"</h6>");
            out.println("<h6>Transaction Limit :"+daily_limit+"</h6>");
            out.println("<h6>No of Transactions :"+t_count+"</h6>");
            out.println("<h6>Allowed No of Transactions :"+rem_count+"</h6>");
            out.println("</div>");
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
        
        <!--<h1>Transfer Page</h1>-->
        
    </body>
</html>
