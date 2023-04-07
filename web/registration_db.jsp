<%-- 
    Document   : registration_db
    Created on : 27 Dec, 2022, 10:55:23 PM
    Author     : ARUN KUMAR
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db_connection.db_connection"%>
<%@include file="regisnav.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
        <%
            try{
            String name=request.getParameter("name");
            String password=request.getParameter("password");
            float contact=Float.parseFloat(request.getParameter("contact"));
            String address=request.getParameter("address");
//            String passrecovery=request.getParameter("passrecovery");
//            String hint=request.getParameter("hint");
            String accno=request.getParameter("accno");
            
            db_connection db=new db_connection();
            Connection con=db.dbcon();
            
            
            
            String query="INSERT INTO `account`(`account_no`, `name`, `address`, `password`, `mobile_no`) VALUES (?,?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, accno);
            ps.setString(2, name);
            ps.setString(3, address);
            ps.setString(4, password);
            ps.setFloat(5, contact);
//            ps.setString(6, passrecovery);
//            ps.setString(7, hint);
            
            int result=ps.executeUpdate();
            if(result==1){
                out.println("<script>alert('"+accno+", is your Account Number');</script>");
                RequestDispatcher rd=request.getRequestDispatcher("registration.jsp");
                rd.include(request, response);
            }
            }
            catch(Exception e)
            {
                out.println(e);
            }
        %>
        <!--<h1>Hello World!</h1>-->
    </body>
</html>
