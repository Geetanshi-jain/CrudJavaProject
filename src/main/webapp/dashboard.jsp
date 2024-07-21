<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql"  prefix="sql" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CRUD - dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>

</head>
<body>
<%@ include file="navbar.jsp" %>


<sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/student" user="root" password="password"/>
<sql:query var="rs" dataSource="${con}">s+elect * from student;</sql:query>


<%= session.getAttribute("success") %>

<div class="container mt-5">

<table class="table table-striped table-hover">
   <thead>
    <tr>
      <th scope="col">Enrollment</th>
      <th scope="col">Name</th>
      <th scope="col">Math </th>
      <th scope="col">Physics</th>
      <th scope="col">Chemistry</th>
      <th scope="col">Update</th>
      <th scope="col">Delete</th>
    </tr>
  </thead>
  
  <tbody>
    <c:forEach var="col" items="${rs.rows}">
    <tr>
      <th scope="row"><c:out value="${col.roll}"></c:out></th>
      <td><c:out value="${col.name}"></c:out></td>
      <td><c:out value="${col.math}"></c:out></td>
      <td><c:out value="${col.physics}"></c:out></td>
      <td><c:out value="${col.chemistry}"></c:out></td>
        <td> <a href="studentUpdateForm.jsp?id=${col.roll}"><button type="button" class="btn" style="background:gold;">edit</button></a></td>
    <td> <a href="deleteServlet?id=${col.roll}"><button type="button" class="btn btn-danger">delete</button></a></td>
    </tr>
    </c:forEach>
  </tbody>
</table>
</div>


</body>
</html>