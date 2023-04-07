<%-- 
    Document   : transfer_db
    Created on : 28 Dec, 2022, 9:25:06 PM
    Author     : ARUN KUMAR
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
        <%
            try{
            
            String accno=session.getAttribute("accno").toString();
            String credit_acc=request.getParameter("credit_acc");
            int withdrawamt=Integer.parseInt(request.getParameter("amt"));
//            int amt=Integer.parseInt(request.getParameter("amt"));
            if(withdrawamt<0){
                out.println("<script>alert(' Negative Amount ');</script>");
//                out.println("<script>open("+depositamt+");</script>");
                RequestDispatcher rd=request.getRequestDispatcher("transfer.jsp");
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
//            int balance=Integer.parseInt(rs.getString("balance"));
            int w_limit=rs.getInt("withdraw_limit");
            int debit_balance=Integer.parseInt(rs.getString("balance"));
           
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
                    
                    if(withdrawamt<debit_balance){
                        String query2="UPDATE account SET balance=? WHERE account_no=?";
            PreparedStatement ps2=con.prepareStatement(query2);
            debit_balance=debit_balance-withdrawamt;
           
            ps2.setInt(1, debit_balance);
            ps2.setString(2, accno);
            int rs2=ps2.executeUpdate();
            
            String query_to="select balance from account where account_no=?";
            PreparedStatement ps_to=con.prepareStatement(query_to);
            ps_to.setString(1, credit_acc);
            ResultSet rs_to=ps_to.executeQuery();
            rs_to.next();
            int credit_balance=Integer.parseInt(rs_to.getString("balance"));
            
             String query7="UPDATE account SET balance=? WHERE account_no=?";
            PreparedStatement ps7=con.prepareStatement(query7);
            credit_balance=credit_balance+withdrawamt;
           
            ps7.setInt(1, credit_balance);
            ps7.setString(2, credit_acc);
            int rs7=ps7.executeUpdate();
            
             String query3="INSERT INTO transactions(type,from_acc_no, to_acc_no, amount) VALUES (?,?,?,?)";
            PreparedStatement ps3=con.prepareStatement(query3);
            ps3.setString(1,"transfer");
            ps3.setString(2,accno);
            ps3.setString(3, credit_acc);
            ps3.setInt(4, withdrawamt);
            int rs3=ps3.executeUpdate();
            
           if((rs2==1) && (rs7==1)){
                out.println("<script>alert('"+withdrawamt+" Amount Transfered Successfully');</script>");
                RequestDispatcher rd=request.getRequestDispatcher("transfer.jsp");
                rd.include(request, response);
                
            }
            }
            else{
                out.println("<script>alert('NOT ENOUGH BALANCE');</script>");
                RequestDispatcher rd=request.getRequestDispatcher("transfer.jsp");
                rd.include(request, response);
            }
        }
                else{
                
                out.println("<script>alert('Daily Withdraw Limit exceeded');</script>");
                RequestDispatcher rd=request.getRequestDispatcher("transfer.jsp");
                rd.include(request, response);
                
                }
            }
            else{
            out.println("<script>alert('Daily transactions Limit Exceeded');</script>");
                RequestDispatcher rd=request.getRequestDispatcher("transfer.jsp");
                rd.include(request, response);
            }
                
                
                        
                        
//                    }
//            
//            if(t_count-1>daily_limit){
//                out.println("<script>alert('Daily transactions Limit Exceeded');</script>");
//                RequestDispatcher rd=request.getRequestDispatcher("transfer.jsp");
//                rd.include(request, response);
//            }
//           
//            else{
//                if(t_sum>w_limit){
//                out.println("<script>alert('Daily Withdraw Limit exceeded');</script>");
//                RequestDispatcher rd=request.getRequestDispatcher("transfer.jsp");
//                rd.include(request, response);
//                }
//                else{
////                    if((t_count<daily_limit) && (t_sum<w_limit)){
//            if(withdrawamt<debit_balance){
//                String query2="UPDATE account SET balance=? WHERE account_no=?";
//            PreparedStatement ps2=con.prepareStatement(query2);
//            debit_balance=debit_balance-withdrawamt;
//           
//            ps2.setInt(1, debit_balance);
//            ps2.setString(2, accno);
//            int rs2=ps2.executeUpdate();
//            
//            String query_to="select balance from account where account_no=?";
//            PreparedStatement ps_to=con.prepareStatement(query_to);
//            ps_to.setString(1, credit_acc);
//            ResultSet rs_to=ps_to.executeQuery();
//            rs_to.next();
//            int credit_balance=Integer.parseInt(rs_to.getString("balance"));
//            
////            String query7="UPDATE account SET balance=? WHERE account_no=?";
////            PreparedStatement ps7=con.prepareStatement(query7);
////            debit_balance=debit_balance-withdrawamt;
////           
////            ps4.setInt(1, debit_balance);
////            ps4.setString(2, accno);
////            int rs4=ps4.executeUpdate();
//
//            
//            String query7="UPDATE account SET balance=? WHERE account_no=?";
//            PreparedStatement ps7=con.prepareStatement(query7);
//            credit_balance=credit_balance+withdrawamt;
//           
//            ps7.setInt(1, credit_balance);
//            ps7.setString(2, credit_acc);
//            int rs7=ps7.executeUpdate();
//            
//             String query3="INSERT INTO transactions(type,from_acc_no, to_acc_no, amount) VALUES (?,?,?,?)";
//            PreparedStatement ps3=con.prepareStatement(query3);
//            ps3.setString(1,"transfer");
//            ps3.setString(2,accno);
//            ps3.setString(3, credit_acc);
//            ps3.setInt(4, withdrawamt);
//            int rs3=ps3.executeUpdate();
//            
//           if((rs2==1) && (rs7==1)){
//                out.println("<script>alert('"+withdrawamt+" Amount Transfered Successfully');</script>");
//                RequestDispatcher rd=request.getRequestDispatcher("transfer.jsp");
//                rd.include(request, response);
//                
//            }
//            
////            String query3="INSERT INTO transactions(type,from_acc_no, to_acc_no, amount) VALUES (?,?,?,?)";
////            PreparedStatement ps3=con.prepareStatement(query3);
////            ps3.setString(1,"withdraw");
////            ps3.setString(2,accno);
////            ps3.setString(3, accno);
////            ps3.setInt(4, withdrawamt);
////            int rs3=ps3.executeUpdate();
////            if((rs2==1) && (rs3==1)){
////                out.println("<script>alert('"+withdrawamt+" Amount Withdraw Succedful');</script>");
////                RequestDispatcher rd=request.getRequestDispatcher("withdraw.jsp");
////                rd.include(request, response);
////                
////            }
//            }
//            else{
//                out.println("<script>alert('NOT ENOUGH BALANCE');</script>");
//                RequestDispatcher rd=request.getRequestDispatcher("transfer.jsp");
//                rd.include(request, response);
//            }
////            }
//                }
//            }
//            
//            
////            if(amt>debit_balance)
////            {
////                out.println("NOT ENOUGH BALANCE");
////                RequestDispatcher rd=request.getRequestDispatcher("transfer.jsp");
////                rd.include(request, response);
////            }
////            
////            String query_to="select balance from account where account_no=?";
////            PreparedStatement ps_to=con.prepareStatement(query_to);
////            ps_to.setString(1, credit_acc);
////            ResultSet rs_to=ps_to.executeQuery();
////            rs_to.next();
////            int credit_balance=Integer.parseInt(rs_to.getString("balance"));
////            
////            String query4="UPDATE account SET balance=? WHERE account_no=?";
////            PreparedStatement ps4=con.prepareStatement(query4);
////            debit_balance=debit_balance-amt;
////           
////            ps4.setInt(1, debit_balance);
////            ps4.setString(2, accno);
////            int rs4=ps4.executeUpdate();
////
////            
////            String query2="UPDATE account SET balance=? WHERE account_no=?";
////            PreparedStatement ps2=con.prepareStatement(query2);
////            credit_balance=credit_balance+amt;
////           
////            ps2.setInt(1, credit_balance);
////            ps2.setString(2, credit_acc);
////            int rs2=ps2.executeUpdate();
////            
////            String query3="INSERT INTO transactions(type,from_acc_no, to_acc_no, amount) VALUES (?,?,?,?)";
////            PreparedStatement ps3=con.prepareStatement(query3);
////            ps3.setString(1,"transfer");
////            ps3.setString(2,accno);
////            ps3.setString(3, credit_acc);
////            ps3.setInt(4, amt);
////            int rs3=ps3.executeUpdate();
////            
////            String query6="INSERT INTO transactions(type,from_acc_no, to_acc_no, amount) VALUES (?,?,?,?)";
////            PreparedStatement ps6=con.prepareStatement(query6);
////            ps6.setString(1,"credit");
////            ps6.setString(2,accno);
////            ps6.setString(3, credit_acc);
////            ps6.setInt(4, amt);
////            int rs6=ps6.executeUpdate();
////            if((rs2==1) && (rs4==1)){
////                out.println("Amount Withdrawen Succedfully");
////                
////            }
            }
            }
            catch(Exception e){
                    out.println(e);
                    }

            
            %>
        <!--<h1>Hello World!</h1>-->
    </body>
</html>
