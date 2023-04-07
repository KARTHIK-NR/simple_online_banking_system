<%-- 
    Document   : deposit_db
    Created on : 28 Dec, 2022, 1:00:25 AM
    Author     : ARUN KUMAR
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
<!--        <script> function open(y){
                var x=document.getElementById("modalmsg");
                x.innerHtml="Rs"+y+" Deposited Successful";
        }
        </script>-->
    </head>
    <body>
        
        <%
            try{
            String accno=session.getAttribute("accno").toString();
            int depositamt=Integer.parseInt(request.getParameter("depositamt"));
            
            if(depositamt<0){
                out.println("<script>alert(' Negative Amount ');</script>");
//                out.println("<script>open("+depositamt+");</script>");
                RequestDispatcher rd=request.getRequestDispatcher("deposit.jsp");
                rd.include(request, response);
            }
            else{
            db_connection db=new db_connection();
            Connection con=db.dbcon();
            
            String query="select balance from account where account_no=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, accno);
            ResultSet rs=ps.executeQuery();
            rs.next();
            int balance=Integer.parseInt(rs.getString("balance"));
           
            
            String query2="UPDATE account SET balance=? WHERE account_no=?";
            PreparedStatement ps2=con.prepareStatement(query2);
            balance=balance+depositamt;
           
            ps2.setInt(1, balance);
            ps2.setString(2, accno);
            int rs2=ps2.executeUpdate();
            
            String query3="INSERT INTO transactions(from_acc_no, to_acc_no, amount) VALUES (?,?,?)";
            PreparedStatement ps3=con.prepareStatement(query3);
           
            ps3.setString(1,accno);
            ps3.setString(2, accno);
            ps3.setInt(3, depositamt);
            int rs3=ps3.executeUpdate();
            if((rs2==1) && (rs3==1)){
                out.println("<script>alert('"+depositamt+" Amount Deposited Succedfully');</script>");
//                out.println("<script>open("+depositamt+");</script>");
                RequestDispatcher rd=request.getRequestDispatcher("deposit.jsp");
                rd.include(request, response);
                
            }
            }
            }
            catch(Exception e){
                out.println(e);
            }
            
            %>
<!--            <centre>
            <div class="row justify-content-md-center">
            <div class="col-md-3">
                <div class="modalmsg" id="modalmsg" style="display: none; background-color: black;height: 150px;width:300px; z-index:1">
                <div class="msgheader" id="msgheader">
                    
                </div>
                <div class="msgmsg" id="msgmsg">
                    
                </div>
                <div class="msgfooter" id="msgfooter">
                    
                </div>
                </div>
            </div>
            </div>
        </centre>-->
        <!--<h1>Hello World!</h1>-->
    </body>
</html>
