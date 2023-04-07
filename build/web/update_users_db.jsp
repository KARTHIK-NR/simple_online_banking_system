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
            
            String accno=session.getAttribute("accno").toString();
            String acc=request.getParameter("account_no");
            String name=request.getParameter("name");
            float mobile=Float.parseFloat(request.getParameter("mobile_no"));
            float balance=Float.parseFloat(request.getParameter("balance"));
            
            db_connection db=new db_connection();
            Connection con=db.dbcon();
            
            String query2="UPDATE account SET name=?, mobile_no=?, balance=? where account_no=?";
            PreparedStatement ps2=con.prepareStatement(query2);
            
           
            ps2.setString(1, name);
            ps2.setFloat(2, mobile);
            ps2.setFloat(3, balance);
            ps2.setString(4, acc);
            ps2.executeUpdate();
            
            RequestDispatcher rd=request.getRequestDispatcher("search_users.jsp");
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
