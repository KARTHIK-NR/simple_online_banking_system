<%-- 
    Document   : tlimit
    Created on : 29 Dec, 2022, 8:21:55 PM
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
    </head>
    <body>
        <%
            int tlimit=Integer.parseInt(request.getParameter("limit"));
            String accno=session.getAttribute("accno").toString();
            db_connection db=new db_connection();
            Connection con=db.dbcon();
            
            String query2="UPDATE account SET withdraw_limit=? WHERE account_no=?";
            PreparedStatement ps2=con.prepareStatement(query2);
            
           
            ps2.setInt(1, tlimit);
            ps2.setString(2, accno);
            int rs2=ps2.executeUpdate();
            
            
            RequestDispatcher rd=request.getRequestDispatcher("accountsettings.jsp");
            rd.include(request, response);
            out.println("<script>alert('Update Successful');</script>");
            
           
            %>
        
        <!--<h1>Hello World!</h1>-->
    </body>
</html>
