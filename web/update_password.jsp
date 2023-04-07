<%-- 
    Document   : update_password
    Created on : Dec 30, 2022, 11:32:22 AM
    Author     : Admin
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
        <script>
            function checkpass(){
                
                var o=document.getElementById("newpass1").value;
                 var n=document.getElementById("newpass2").value;
                 if(o!=n){
                     document.getElementById("dis").innerHTML="password doesn't  matches";
                     display.style.defineProperty(display:none;);
                 }
                                    
            }
            </script>
        
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
            String password=rs.getString("password");
             
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

               out.println("<form method='post' action='updatepassword_db.jsp'>" );
                     out.println("<h3 class='headlines' style='color:black;padding-top:20px;'>Enter Old Password : <input type='password' name='oldpass'><br></h3>");
                      out.println("<h3 class='headlines' style='color:black;padding-top:20px;'>Enter New Password : <input type='password'id='newpass1' name='newpass1'><br></h3>");
                      
                      out.println("<h3 class='headlines' style='color:black;padding-top:20px;'>Re-Enter New Password : <input type='password' id='newpass2' name='newpass2' onblur='checkpass()'><br></h3>");
                      out.println("<div class='dis' id='dis'><p></p><div/>");
                      out.println("<input type='submit' style='background-color:green;color:white;padding:8px;margin-left:60%;border-radius:5px;' value='Update'></form>");
//                     
//             out.println("<form method='post' action='updatepassword_db.jsp'>" );
//            out.println("Enter Old Password<input type='password' name='oldpass'><br>");
//            out.println("Enter New Password<input type='password' name='newpass1'><br>");
//            out.println("Re-Enter New Password<input type='password' name='newpass2'><br>");
//            out.println("<input type='submit' value='Update'>");
            
            
           
           
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
        
       
        <!--<h1>Hello World!</h1>-->
    </body>
</html>
