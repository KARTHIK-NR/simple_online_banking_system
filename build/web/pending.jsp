<%-- 
    Document   : pending
    Created on : 4 Jan, 2023, 9:45:24 AM
    Author     : HP
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="db_connection.db_connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%--<%@include file="usernav.jsp"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css\main.css">

    <!--<link rel="stylesheet" href="bootstrap\css\bootstrap.min.css">-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        
    </head>
    <body>
         <body style="background-color: #DFF6FF;">
    <div class="col-md-12">
    <div class="nav-bar">
<div id="main-title">

<a href="index.html">MYSORE BANK</a>
    
</div>
<!--        <ul><li> <a href="balance.jsp">Balance</a>
        <li><a href="deposit.jsp">Deposit</a></li>
        <li><a href="withdraw.jsp">Withdraw</a></li>
        <li><a href="transfer.jsp">Transfer</a></li>-->
        <li><a id="btn1" style="border: 2px; float: right;margin-right: 20px;margin-top:10px; border-radius: 10%; background-color: green;
    border-color:#25316D;" href="logout.jsp">Logout</a></li>
        </ul>
    </div>
    </div>
        

        
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
            String status=rs.getString("status");
            
            
            %>
            
<centre>
<div class="row justify-content-md-center" id="balancerow">
    <div class="col-md-8 justify-content-md-center" style="margin-top: 30px;" id="balance">
        <%
            out.println("<h4 class='headlines'>Account Holder Name : "+name+"</h4>");
            out.println("<h4 class='headlines'>Account Number : "+accno+"</h4>");
            
            out.println("<h2 class='headlines'>Your Account is yet to be Approved</h2>");
            %>
    </div>
    </div>
</centre>
            
<!--            out.println("Name "+name+"<br>");
            out.println("Accno "+accno+"<br>");-->
           <% 
        }
        catch(Exception e){
            out.println(e);
        }
            %>
            
<script src="jquery/jquery.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>

    </body>
</html>
