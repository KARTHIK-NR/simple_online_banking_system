<%-- 
    Document   : usernavbar
    Created on : 2 Jan, 2023, 9:47:45 PM
    Author     : ARUN KUMAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css\main.css">

    <!--<link rel="stylesheet" href="bootstrap\css\bootstrap.min.css">-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    
        
        <body style="background-color: #DFF6FF;">
    <div class="col-md-12">
    <div class="nav-bar">
<div id="main-title">

<a href="adminhome.jsp">MYSORE BANK</a>
    
</div>
        <ul><li> <a href="approve_users.jsp">Approve</a>
        <li><a href="search_users.jsp">Search</a></li>
        <li><a href="block_request.jsp">Block</a></li>
        <li><a href="unblock_request.jsp">Unblock</a></li>
        <li><a id="btn1" style="border: 2px; border-radius: 10%; background-color: green;
    border-color:#25316D;" href="logout.jsp">Logout</a></li>
        </ul>
    </div>
    </div> <!--
    <centre>
<div class="row justify-content-md-center" id="balancerow">
    <div class="col-md-8 justify-content-md-center" id="balance" style="height: 200px;">
    </div>
    </div>
</centre>

<centre>
    <div class="row justify-content-md-center">
<div class="col-md-10" id="mainscreen" style="height: 100px;">
</div>
</div>
</centre>



 The Modal 

<div class="row justify-content-md-center"> 
  <div class="row1" style='background-color: black;
  height: 100px;z-index: 1;top: 0;'>
  </div>
  </div>

     The Modal 
    <div class="container" id="top">
      <centre>
    <div class="row justify-content-md-center">
      <div class="col-md-5">
    <div id="myModal" style="display:block;" class="myModal">
    
    
       Modal content 
      <div class="modalcontent">
        <h1>Hello</h1>
        <span class="close" onclick="closeModal()">&times;</span>
        <p>Some text in the Modal..</p>
      </div>
    </div>
    </div>
    </div>
    </centre>
    </div>
    <button id="myBtn" onclick="openModal()">Open Modal</button>

 <centre>
    <button id="myBtn">Open Modal</button>
<div id="myModal" class="modal">

   Modal content 
  <div class="modal-content">
    <span class="close">&times;</span>
    <p>Some text in the Modal..</p>
  </div>

</div>
</centre> -->
<script src="jquery/jquery.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>

    </body>
</html>
