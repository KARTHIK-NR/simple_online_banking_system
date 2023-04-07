<%-- 
    Document   : withdraw2_db
    Created on : Dec 30, 2022, 12:36:27 PM
    Author     : Admin
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
    </head>
    <body>
        <table>
        <%
            try{
            String accno=session.getAttribute("accno").toString();
            int withdrawamt=Integer.parseInt(request.getParameter("withdrawamt"));
            if(withdrawamt<0){
                out.println("<script>alert(' Negative Amount ');</script>");
//                out.println("<script>open("+depositamt+");</script>");
                RequestDispatcher rd=request.getRequestDispatcher("withdraw.jsp");
                rd.include(request, response);
            }
            else{
            
            db_connection db=new db_connection();
            Connection con=db.dbcon();
            
            String query="select * from account where account_no=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, accno);
            ResultSet rs=ps.executeQuery();
            rs.next();
            int balance=Integer.parseInt(rs.getString("balance"));
            int w_limit=rs.getInt("withdraw_limit");
            
            String pattern="yyyy-MM-dd";
            SimpleDateFormat simpleDateFormat =new SimpleDateFormat(pattern);
//            Date d=new Date();
            String s=simpleDateFormat.format(new Date())+"%";
//            out.println(simpleDateFormat);
            //out.println(s);
            
            String query4="select count(tid),sum(amount) from transactions where from_acc_no=? and date_time like ? and (type=? or type=?)";
//            select * from transactions where from_acc_no="MYS906641" and date_time like "2022-12-30%" and (type="withdraw" or type="transfer");
            PreparedStatement ps4=con.prepareStatement(query4);
            ps4.setString(1, accno);
            ps4.setString(2, s);
            ps4.setString(3, "withdraw");
            ps4.setString(4, "transfer");
//            ps4.setString(3, sdate);
            ResultSet rs4=ps4.executeQuery();
            
            rs4.next();
            int t_count=rs4.getInt("count(tid)");
            int t_sum=rs4.getInt("sum(amount)");
            
            String query5="select * from manager";
            PreparedStatement ps5=con.prepareStatement(query5);
            
            ResultSet rs5=ps5.executeQuery();
            rs5.next();
            int daily_limit=rs5.getInt("daily_limit_no");
            
            if(t_count<daily_limit){
                
                if(t_sum+withdrawamt<w_limit){
                    
                    if(withdrawamt<balance){
                        
                        String query2="UPDATE account SET balance=? WHERE account_no=?";
            PreparedStatement ps2=con.prepareStatement(query2);
            balance=balance-withdrawamt;
           
            ps2.setInt(1, balance);
            ps2.setString(2, accno);
            int rs2=ps2.executeUpdate();
            
            String query3="INSERT INTO transactions(type,from_acc_no, to_acc_no, amount) VALUES (?,?,?,?)";
            PreparedStatement ps3=con.prepareStatement(query3);
            ps3.setString(1,"withdraw");
            ps3.setString(2,accno);
            ps3.setString(3, accno);
            ps3.setInt(4, withdrawamt);
            int rs3=ps3.executeUpdate();
            if((rs2==1) && (rs3==1)){
                out.println("<script>alert('"+withdrawamt+" Amount Withdraw Succedful');</script>");
                RequestDispatcher rd=request.getRequestDispatcher("withdraw.jsp");
                rd.include(request, response);
                
            }
                        
                    }
                    else{
                out.println("<script>alert('NOT ENOUGH BALANCE');</script>");
                RequestDispatcher rd=request.getRequestDispatcher("withdraw.jsp");
                rd.include(request, response);
                        
                    }
                }
                else{
                    out.println("<script>alert('Daily Withdraw Limit exceeded');</script>");
                RequestDispatcher rd=request.getRequestDispatcher("withdraw.jsp");
                rd.include(request, response);

                    
                }
            }
            else{
                 out.println("<script>alert('Daily transactions Limit Exceeded');</script>");
                RequestDispatcher rd=request.getRequestDispatcher("withdraw.jsp");
                rd.include(request, response);
                
            }
            
//            if(t_count>daily_limit){
//                out.println("<script>alert('Daily transactions Limit Exceeded');</script>");
//                RequestDispatcher rd=request.getRequestDispatcher("withdraw.jsp");
//                rd.include(request, response);
//            }
//           
//            else{
//                if(t_sum+withdrawamt>w_limit){
//                out.println("<script>alert('Daily Withdraw Limit exceeded');</script>");
//                RequestDispatcher rd=request.getRequestDispatcher("withdraw.jsp");
//                rd.include(request, response);
//                }
//                else{
////                    if((t_count<daily_limit) && (t_sum<w_limit)){
//            if(withdrawamt<balance){
//                String query2="UPDATE account SET balance=? WHERE account_no=?";
//            PreparedStatement ps2=con.prepareStatement(query2);
//            balance=balance-withdrawamt;
//           
//            ps2.setInt(1, balance);
//            ps2.setString(2, accno);
//            int rs2=ps2.executeUpdate();
//            
//            String query3="INSERT INTO transactions(type,from_acc_no, to_acc_no, amount) VALUES (?,?,?,?)";
//            PreparedStatement ps3=con.prepareStatement(query3);
//            ps3.setString(1,"withdraw");
//            ps3.setString(2,accno);
//            ps3.setString(3, accno);
//            ps3.setInt(4, withdrawamt);
//            int rs3=ps3.executeUpdate();
//            if((rs2==1) && (rs3==1)){
//                out.println("<script>alert('"+withdrawamt+" Amount Withdraw Succedful');</script>");
//                RequestDispatcher rd=request.getRequestDispatcher("withdraw.jsp");
//                rd.include(request, response);
//                
//            }
//            }
//            else{
//                out.println("<script>alert('NOT ENOUGH BALANCE');</script>");
//                RequestDispatcher rd=request.getRequestDispatcher("withdraw.jsp");
//                rd.include(request, response);
//            }
////            }
//                }
//            }
//            
//            
//            
////            while(rs4.next()){
////                out.println("<tr><td>"+rs4.getInt("tid")+"</td>" );
////                   out.println("<td>"+rs4.getDate("date_time")+"</td>");
////                   out.println("<td>"+rs4.getTime("date_time")+"</td>");
////                   out.println("<td>"+rs4.getString("type")+"</td>");
////                   out.println("<td>"+rs4.getString("from_acc_no")+"</td>");
////                   out.println("<td>"+rs4.getString("to_acc_no")+"</td>");
////                   out.println("<td>"+rs4.getInt("amount")+"</td></tr>");
//            }
            
            }
            }
            
            catch(Exception e){
                out.println(e);
            }
            %>
        </table>
        <!--<h1>Hello World!</h1>-->
    </body>
</html>
