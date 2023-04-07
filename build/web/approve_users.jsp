<%-- 
    Document   : approve_users
    Created on : 29 Dec, 2022, 9:58:42 PM
    Author     : ARUN KUMAR
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db_connection.db_connection"%>
<%@include file="adminnav.jsp"%>
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
                $('#table2').DataTable();
                  });
                </script>
    </head>
    <body>
        <div class="col-md-2"
         <ul class="buttons" style='list-style-type: none;margin-top:8%;margin-left: 20px' class="buttons"> <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="adminhome.jsp">Home</a></li></ul>
        </div>
        <centre>
    <div class="row justify-content-md-center">
        
        <div class="col-md-11" id="mainscreen" style="background-color:white;margin-top: 1%;">

        
        <div class="row">
<!--            <div class="col-md-3" style="float: left;padding-left: 5px;">
                <div class="buttons">
                    <ul class="buttons" style='list-style-type: none;' class="buttons"><li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white; text-decoration: none;font-weight: bolder;" class="lists" href="approve_users.jsp">Approve Users</a></li> 
                <li style="margin: 10px;padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="search_users.jsp">Search Users</a> </li>
                <li style=" margin: 10px;padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="block_request.jsp">Block Users</a></li>
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="unblock_request.jsp">Unblock Users</a></li>
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="transactions.jsp">Transactions</a></li>
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="no_limit.jsp">Set Transaction Limit</a></li>
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="block.jsp">Request for Block</a></li>
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="update_password.jsp">Password Update</a></li></ul>
                </div>  </div>-->
                <div class="col-md-11" style="">
                    <h2 style="margin-left: 35%"> Approve Pending Users </h2>
                    <!--<h2 class='headlines' style='color:black;padding-top:20px;'>Welcome Admin!<br></h2>-->
                    <table id="table2" class="display" style="width:90%">
        <thead>
            <tr>
                                    <th>Account No</th>
                                    <th>Name</th>
                                    <th>Mobile NO</th>
                                    <th>Balance</th>
                                    <th>Approve</th>
                                    
            </tr>
        </thead>
        <tbody>
        <%
            try{
            String accno=session.getAttribute("accno").toString();
            db_connection db=new db_connection();
            Connection con=db.dbcon();
            
            String query="select * from account where status=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, "pending");
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                   out.println("<tr><td>"+rs.getString("account_no")+"</td>" );
                   out.println("<td>"+rs.getString("name")+"</td>");
                   out.println("<td>"+rs.getBigDecimal("mobile_no")+"</td>");
                   out.println("<td>"+rs.getFloat("balance")+"</td>");
                   out.println("<form action='approve_db.jsp'>");
                   
                   out.println("<td><button type='info' name='btn' value='"+rs.getString("account_no")+"'>Approve</button></td></form></tr>");
           
            
            }
            }
            catch(Exception e){
                out.println(e);
            }
            %>
        </tbody>
                     
                </div>
           
        </div>
        

</div>
       
</centre>
        
        
        
<!--        <h1>Approve Users</h1>
        <table id="table2" class="display" style="width:100%">
        <thead>
            <tr>
                                    <th>Account No</th>
                                    <th>Name</th>
                                    <th>Mobile NO</th>
                                    <th>Balance</th>
                                    <th>Approve</th>
                                    
            </tr>
        </thead>
        <tbody>
        
//            try{
//            String accno=session.getAttribute("accno").toString();
//            db_connection db=new db_connection();
//            Connection con=db.dbcon();
//            
//            String query="select * from account where status=?";
//            PreparedStatement ps=con.prepareStatement(query);
//            ps.setString(1, "pending");
//            ResultSet rs=ps.executeQuery();
//            
//            while(rs.next()){
//                   out.println("<tr><td>"+rs.getString("account_no")+"</td>" );
//                   out.println("<td>"+rs.getString("name")+"</td>");
//                   out.println("<td>"+rs.getBigDecimal("mobile_no")+"</td>");
//                   out.println("<td>"+rs.getFloat("balance")+"</td>");
//                   out.println("<form action='approve_db.jsp'>");
//                   
//                   out.println("<td><button type='info' name='btn' value='"+rs.getString("account_no")+"'>Approve</button></td></form></tr>");
//           
//            
//            }
//            }
//            catch(Exception e){
//                out.println(e);
//            }
//            
        </tbody>
        <br><a href="adminhome.jsp">Home</a>
        <br><a href="logout.jsp">Logout</a>-->
    </body>
</html>
