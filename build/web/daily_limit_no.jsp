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
            try{
            int tlimit=Integer.parseInt(request.getParameter("limit"));
            String accno=session.getAttribute("accno").toString();
            db_connection db=new db_connection();
            Connection con=db.dbcon();
            
            String query2="UPDATE manager SET daily_limit_no=? WHERE m_name=?";
            PreparedStatement ps2=con.prepareStatement(query2);
            
           
            ps2.setInt(1, tlimit);
            ps2.setString(2, accno);
            ps2.executeUpdate();
            
            RequestDispatcher rd=request.getRequestDispatcher("no_limit.jsp");
            rd.include(request, response);
            }
            catch(Exception e){
                out.println(e);
            }
            
           
            %>
        <br><a href="adminhome.jsp">Home</a>
        <br><a href="logout.jsp">Logout</a>
        <!--<h1>Hello World!</h1>-->
    </body>
</html>
