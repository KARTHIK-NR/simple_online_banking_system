<%-- 
    Document   : block
    Created on : 29 Dec, 2022, 7:31:35 PM
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
            String status=rs.getString("status");
             
            %>
            <centre>
<div class="row justify-content-md-center" id="balancerow">
    <div class="col-md-8 justify-content-md-center" id="balance">
        <%
            out.println("<h4 class='headlines'>Account Holder Name : "+name+"</h4>");
            out.println("<h4 class='headlines'>Account Number : "+accno+"</h4>");
             out.println("<h4 class='headlines'>Balance : Rs."+balance+"</h4>");
               out.println("<h4 class='headlines'>Status : Rs."+status+"</h4>");
             
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
                    <ul class="buttons" style='list-style-type: none;' class="buttons"><li style="margin: 10px; padding: 5px; background-color:#0D4C92; border: 2px black;border-radius: 5px;"><a style="color:white; text-decoration: underline;font-weight:bolder;padding: 30px;" class="lists" href="block.jsp">Request for Block</a></li> 
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="block.jsp">Request for Block</a></li>
                        <li style="margin: 10px;padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="deposit.jsp">Deposit</a> </li>
                <li style=" margin: 10px;padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="withdraw.jsp">Withdraw</a></li>
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="transfer.jsp">Transfer</a></li>
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="ministatement.jsp">Mini Statement</a></li>
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="accountsettings.jsp">Set Transaction Limit</a></li>
                
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="update_password.jsp">Password Update</a></li></ul>
                </div>  </div>
            
            <div class="col-md-9" style="float:right;">
               
                   
                   
                <% 

             
            
            
            out.println("<form method='post' action='block_db.jsp'>" );
            if(status.equals("approved")){
                 out.println("<input type='submit'  name='block' style='background-color:green;color:white;padding:8px;margin-left:15%;margin-top:25px;border-radius:5px;' value='Request for Block'><br></form>");
            }
             else if(status.equals("blocked")){
                 out.println("<input type='submit'  name='block' style='background-color:green;color:white;padding:8px;margin-left:15%;margin-top:25px;border-radius:5px;' value='Request for Unblock'><br></form>");
             }
             else if(status.equals("blockrequest"))
            {
                out.println("<h3 style='margin-top:25px;'> waiting for approval of Block Request</h3>");
            }
           
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
        
        
<!--        
//            String accno=session.getAttribute("accno").toString();
//            db_connection db=new db_connection();
//            Connection con=db.dbcon();
//            
//            String query="select * from account where account_no=?";
//            PreparedStatement ps=con.prepareStatement(query);
//            ps.setString(1, accno);
//            ResultSet rs=ps.executeQuery();
//            rs.next();
//            String name=rs.getString("name");
//            int balance=rs.getInt("balance");
//            
//            out.println("Name "+name+"<br>");
//            out.println("Accno "+accno+"<br>");
////            out.println("Balance "+balance+"<br>");
//            
            
            out.println("<form action='block_db.jsp'>");
            if(status.equals("approved")){
            
//            out.println("<button type='danger' name='block'>Request for Block</button><br>");
            out.println("<input type='submit' name='block' value='Request for Block'><br>");
                out.println("</form>");
            }
            else if(status.equals("block")){
                out.println("<input type='submit' name='block' value='Request for Unblock'><br>");
                out.println("</form>");
                
            }
            else if(status.equals("blockrequest"))
            {
                out.println("waiting for approval of Block Request");
            }
            %>
            
                    <a href="userhome.jsp">Home</a><br>
            <a href="logout.jsp"><button>Logout</button></a><br><br>-->
        
                    
                    <!--<h1>Hello World!</h1>-->
    </body>
</html>
