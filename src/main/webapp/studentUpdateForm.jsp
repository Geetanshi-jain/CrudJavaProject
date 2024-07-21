<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql"  prefix="sql" %>
    
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>CRUD - student data update</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>

<style type="text/css"><%@ include file="style.css" %> </style>
</head>
<body >
<%@ include file="navbar.jsp" %>

<%  int roll_id =  Integer.parseInt( request.getParameter("id")) ; %>

<sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/student" user="root" password="password"/>
<sql:query var="rs" dataSource="${con}">select * from student where roll=<%= roll_id %>;</sql:query>




<h1 style="text-align:center;">Update the detail of Student.</h1>
<div class="container" style=" padding:10px 10px 10px 10px; margin-top:30px; border-radius:10px;" >

  <c:forEach var="col" items="${rs.rows}"> 	
  <form class="row g-3 mt-5" method="post" action="updateStudent">
  <div class="col-md-12">
    <label for="inputEmail4" class="form-label">Enrollment</label>
    <input type="hidden" name="enrol"  value=<c:out value="${col.roll}"></c:out> class="form-control" id="inputEmail4" placeholder="enter your enrollment number...">
  </div>
  <div class="col-md-12">
    <label for="inputPassword4" class="form-label">Name</label>
    <input type="text" name="name" value=<c:out value="${col.name}"></c:out> class="form-control" id="inputPassword4" placeholder="enter your name...">
  </div>
  <div class="col-12">
    <label for="inputAddress" class="form-label">Math</label>
    <input type="number" name="math" value=<c:out value="${col.math}"></c:out> class="form-control" id="inputAddress" placeholder="enter your math marks...">
  </div>
  <div class="col-12">
    <label for="inputAddress2" class="form-label">physics</label>
    <input type="number" name="phy" value=<c:out value="${col.physics}"></c:out> class="form-control" id="inputAddress2" placeholder="enter your physics marks...">
  </div>
  <div class="col-12">
    <label for="inputAddress2" class="form-label">chemistry</label>
    <input type="number" name="chem" value=<c:out value="${col.chemistry}"></c:out> class="form-control" id="inputAddress2" placeholder="enter your math marks...">
  </div>
 
  <div class="col-12">
    <button type="submit" class="btn" style="background:gold;">Edit</button>
  </div>
</form>
</c:forEach>
</div>

</body>
</html>