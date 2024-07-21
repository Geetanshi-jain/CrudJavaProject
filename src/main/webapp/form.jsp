<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>CRUD - student data</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>

<style type="text/css"><%@ include file="style.css" %> </style>
</head>
<body >

<div class="container" style=" padding:10px 10px 10px 10px; margin-top:30px; border-radius:10px;" >
	<form class="row g-3 mt-5" method="post" action="studentData">
  <div class="col-md-6">
    <label for="inputEmail4" class="form-label">Enrollment</label>
    <input type="text" name="enrol" class="form-control" id="inputEmail4" placeholder="enter your enrollment number...">
  </div>
  <div class="col-md-6">
    <label for="inputPassword4" class="form-label">Name</label>
    <input type="text" name="name" class="form-control" id="inputPassword4" placeholder="enter your name...">
  </div>
  <div class="col-12">
    <label for="inputAddress" class="form-label">Math</label>
    <input type="number" name="math" class="form-control" id="inputAddress" placeholder="enter your math marks...">
  </div>
  <div class="col-12">
    <label for="inputAddress2" class="form-label">physics</label>
    <input type="number" name="phy" class="form-control" id="inputAddress2" placeholder="enter your physics marks...">
  </div>
  <div class="col-12">
    <label for="inputAddress2" class="form-label">chemistry</label>
    <input type="number" name="chem" class="form-control" id="inputAddress2" placeholder="enter your math marks...">
  </div>
 
  <div class="col-12">
    <button type="submit" class="btn" style="background:gold;">Add</button>
  </div>
</form>
	
</div>

</body>
</html>