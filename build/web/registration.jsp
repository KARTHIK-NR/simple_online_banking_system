<%-- 
    Document   : registration
    Created on : 27 Dec, 2022, 10:37:32 PM
    Author     : ARUN KUMAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="regisnav.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <script>
            function trimString(){
                var name=document.getElementById("name").value.toString();
                document.getElementById("name").value=name.replace(/\s+/g," ").trim();
            }
            
            function random(){
            var text=document.getElementById("accno");
            var x="MYS"+Math.floor(Math.random()*100000)+1;
            text.value=x;
            var div=document.getElementById("t");
            div.innerHTML="Please Note Your Acc No is <br> "+x;
            
        }
        
            function checkDigit(){
                var ch=document.getElementById("contact").value.toString();
                var last=ch.slice(-1);
                
                if(!last.match(/[0-9]/)) {
//                    var d=document.getElementById("digit").innerHTML;
              document.getElementById("digit").innerHTML=last+" is not a number";
             
           }
           else{
               document.getElementById("digit").innerHTML="";
           }
          
            }
        
        </script>
    <center>
        <div class="row justify-content-md-center" style="margin-top: 8%;">
        <div class="col-md-6" id="mainscreen" style="background-color:#BCCEF8;">
        <h1>User Registration</h1>
        <form method="post" action="registration_db.jsp">
            Name:<input type="text" id="name" style="margin-top: 10px;" name="name" onblur="trimString()" required><br><br>
            Password:<input type="password" name="password"><br><br>
            Contact No:<input type="text" id="contact" name="contact" maxlength="10" min="10" pattern="[6-9]{1}[0-9]{9}" onkeyup="checkDigit()"><br><br>
            <div id="digit" style=" color:red"></div>
            Address:<input type="text" id="address" name="address"><br><br>
<!--            Password Recovery:<select name="passrecovery">
                <option>What was the name of your first pet</option>
                <option>What was your childhood nickname</option>
            </select><br><br> -->
            <input type="text" name="accno" id="accno" hidden>
<!--            hint:<input type="text" name="hint"><br><br>-->
<input type="submit" style="background-color:green;color:white;padding:8px;margin-bottom:35px;border-radius:5px;" onclick="random()" value="Register" >
    
            
<!--            <div  id="div-msg" style="background-color: green;top:-1150px; height: 200px;width: 300px;">
                <span id="t"> </span>
            </div>-->
            
            
        </form>
        </div>
        </div>
    </center>
    </body>
</html>
