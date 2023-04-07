<%-- 
    Document   : approve_users
    Created on : 29 Dec, 2022, 9:58:42 PM
    Author     : ARUN KUMAR
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db_connection.db_connection"%>
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
                $('#table7').DataTable();
                  });
                </script>
    </head>
    <body>
        <h1>Unblock Users</h1>
        <table id="table7" class="display" style="width:100%">
        <thead>
            <tr>
                                    <th>Account No</th>
                                    <th>Name</th>
                                    <th>Mobile NO</th>
                                    <th>Balance</th>
                                    <th>Update Details</th>
                                    
            </tr>
        </thead>
        <tbody>
        <%
            try{
            
            String accno=request.getParameter("btn");
            db_connection db=new db_connection();
            Connection con=db.dbcon();
            
            String query="select * from account where account_no=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, accno);
           
            ResultSet rs=ps.executeQuery();
            
            rs.next();
                     out.println("<form action='update_users_db.jsp'>");
                   out.println("<tr><td><input type='text' name='acc_no' value='"+rs.getString("account_no")+"' readonly></td>" );
                   out.println("<td><input type='text' name='name' value='"+rs.getString("name")+"'></td>");
                   out.println("<td><input type='text' name='mobile' value='"+rs.getBigDecimal("mobile_no")+"'></td>");
                   out.println("<td><input type='text' name='mobile' value='"+rs.getFloat("balance")+"'></td>");
                  
                   
                   out.println("<td><input type='submit' name='btn' value='Update'></form></td></tr>");
           
            
            
            }
            catch(Exception e){
                out.println(e);
            }
            %>
        </tbody>
        </table>
        <br><a href="adminhome.jsp">Home</a>
        <br><a href="logout.jsp">Logout</a>
    </body>
</html>
