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
                $('#table6').DataTable();
                  });
                </script>
    </head>
    <body>
        <!--<h1>Unblock Users</h1>-->
<!--        <table id="table6" class="display" style="width:100%">
        <thead>
            <tr>
                                    <th>Account No</th>
                                    <th>Name</th>
                                    <th>Mobile NO</th>
                                    <th>Balance</th>
                                    <th>Update Details</th>
                                    
            </tr>
        </thead>
        <tbody>-->
            
            <div class="col-md-2"
         <ul class="buttons" style='list-style-type: none;margin-top:8%;margin-left: 20px' class="buttons"> <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="adminhome.jsp">Home</a></li></ul>
        </div>
        <centre>
    <div class="row justify-content-md-center">
        
        <div class="col-md-11" id="mainscreen" style="background-color:white;margin-top: 1%;">
            <h2 style="margin-left: 35%"> Search Users </h2>

        
        <div class="row">
            <table id="table6" class="display" style="width:100%">
        <thead>
            <tr>
                                    <th>Account No</th>
                                    <th>Name</th>
                                    <th>Mobile NO</th>
                                    <th>Balance</th>
                                    <!--<th>Update Details</th>-->
                                    
            </tr>
        </thead>
        <tbody>

        <%
            try{
            String accno=session.getAttribute("accno").toString();
            db_connection db=new db_connection();
            Connection con=db.dbcon();
            
            String query="select * from account";
            PreparedStatement ps=con.prepareStatement(query);
           
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                   out.println("<tr><td>"+rs.getString("account_no")+"</td>" );
                   out.println("<td>"+rs.getString("name")+"</td>");
                   out.println("<td>"+rs.getBigDecimal("mobile_no")+"</td>");
                   out.println("<td>"+rs.getFloat("balance")+"</td></tr>");
                   out.println("<form action='update_users.jsp'>");
                   
//                   out.println("<td><button type='info' name='btn' value='"+rs.getString("account_no")+"'>Update</button></td></form></tr>");
           
            
            }
            }
            catch(Exception e){
                out.println(e);
            }
            %>
            </div>
           
        </div>
        

</div>
       
</centre>
        </tbody>
       
    </body>
</html>
