<%-- 
    Document   : adminhome
    Created on : 29 Dec, 2022, 8:55:31 PM
    Author     : ARUN KUMAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="adminnav.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!--<h1>Admin Home Page</h1>-->
        <%
        String accno=session.getAttribute("accno").toString();
//        out.println(accno);
            
        %>
        <centre>
    <div class="row justify-content-md-center" style="margin-top:10%;">
        <div class="col-md-11" id="mainscreen" style="background-color:#BCCEF8;margin-top: 3%">

        
        <div class="row">
            <div class="col-md-3" style="float: left;padding-left: 5px;">
                <div class="buttons">
                    <ul class="buttons" style='list-style-type: none;' class="buttons"><li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white; text-decoration: none;font-weight: bolder;" class="lists" href="approve_users.jsp">Approve Users</a></li> 
                <li style="margin: 10px;padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="search_users.jsp">Search Users</a> </li>
                <li style=" margin: 10px;padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="block_request.jsp">Block Users</a></li>
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="unblock_request.jsp">Unblock Users</a></li>
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="transactions.jsp">Transactions</a></li>
                <li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="no_limit.jsp">Set Transaction Limit</a></li>
                <!--<li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="block.jsp">Request for Block</a></li>-->
                <!--<li style="margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;"><a style="color:white;text-decoration: none;font-weight: bolder;" class="lists" href="update_password.jsp">Password Update</a></li></ul>-->
                </div>  </div>
                <div class="col-md-9" style="float:right;">
                    <h2 class='headlines' style='color:black;padding-top:20px;'>Welcome Admin!<br></h2>
                     
                </div>
           
        </div>
        

</div>
</div>
</centre>
                
        
<!--        <a href="approve_users.jsp"><button>Approve Users</button></a><br><br>
        <a href="search_users.jsp"><button>Search and Update Users</button></a><br><br>
        <a href="block_request.jsp"><button>Block Request</button></a><br><br>
        <a href="unblock_request.jsp"><button>Unblock Request</button></a><br><br>
        <a href="transactions.jsp"><button>View Transaction</button></a><br><br>
        <a href="no_limit.jsp"><button>Set Transaction Limit</button></a><br><br><br>
        
        <a href="logout.jsp"><button>Logout</button></a><br><br>-->
    </body>
</html>
