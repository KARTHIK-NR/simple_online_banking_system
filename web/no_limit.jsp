<%-- 
    Document   : accountsettings
    Created on : 28 Dec, 2022, 11:48:17 PM
    Author     : ARUN KUMAR
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="db_connection.db_connection"%>
<%@include file="adminnav.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <centre>
    <div class="row justify-content-md-center" style="margin-top:10%;">
        <div class="col-md-11" id="mainscreen" style="background-color:#BCCEF8;margin-top: 3%">

        
        <div class="row">
            <div class="col-md-3" style="float: left;padding-left: 5px;">
                <div class="buttons">
                    <ul class="buttons" style='list-style-type: none;' class="buttons"><li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white; text-decoration: none;font-weight: bolder;" class="lists" href="approve_users.jsp">Approve Users</a></li> 
                <li style="margin: 10px;padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="search_users.jsp">Search Users</a> </li>
                <li style=" margin: 10px;padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="block_request.jsp">Block Users</a></li>
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="unblock_request.jsp">Unblock Users</a></li>
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="transactions.jsp">Transactions</a></li>
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="no_limit.jsp">Set Transaction Limit</a></li>
                <!--<li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="block.jsp">Request for Block</a></li>-->
                <!--<li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="update_password.jsp">Password Update</a></li></ul>-->
                </div>  </div>
            
                <div class="col-md-9" style="float:right;">
                    <%
            try{
            String accno=session.getAttribute("accno").toString();
            db_connection db=new db_connection();
            Connection con=db.dbcon();
            
            String query="select * from manager where m_name=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, accno);
            ResultSet rs=ps.executeQuery();
            rs.next();
            
            int tlimit=rs.getInt("daily_limit_no");
            
//            out.println("<form action='daily_limit_no.jsp'>Enter Number of Transaction Limit per Day:<input type='text' name='limit' value="+tlimit+" pattern='[0-9]'>");
            
//            out.println("<br><input type='submit' value='Set Limit'></form>");
            
             out.println("<form method='post' action='daily_limit_no.jsp'>" );
            out.println("<h2 class='headlines' style='color:black;padding-top:20px;'>Enter Number of Transaction Limit per Day :");
            out.println("<input type='text' name='limit' value="+tlimit+" pattern='[0-9]{*}'></h2><br>");
                     
            out.println("<input type='submit' style='background-color:green;color:white;padding:8px;margin-left:15%;border-radius:5px;' value='Set Limit'></form>");
       
            
            }
            catch(Exception e){
                out.println(e);
            }
            %>
                    
                    <!--<h2 class='headlines' style='color:black;padding-top:20px;'>Welcome Admin!<br></h2>-->
                     
                </div>
           
        </div>
        

</div>
</div>
</centre>
                
        
            
    </body>
</html>
