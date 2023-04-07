<%-- 
    Document   : test
    Created on : Dec 30, 2022, 10:13:38 AM
    Author     : Admin
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <script>
        function print(){
            var string=document.getElementById("text").value;
            
    
         document.getElementById("text").value=string.replace(/\s+/g," ").trim();
     }   
    
    </script>
    <body>
        
        <div id="h1">Hello World!</div><br>
        <input type="text" id="text" onblur="print()" pattern="[A-Za-z]"><br>
        <input type="submit" onclick="" value="submit">
        
    </body>
</html>
