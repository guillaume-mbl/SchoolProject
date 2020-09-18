<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@page import="com.guill.beans.Classroom"%>
<%@page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- CSS only -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<!-- JS, Popper.js, and jQuery -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Home</title>
</head>
<body>

<div class="input-group">
	<h6> Classroom Informations </h6>
  <select class="custom-select" id="selectoption" name="liste" onchange="myFunction()">
  <%
 	List<Classroom> list = (ArrayList<Classroom>)request.getAttribute("classes");
  	for(Classroom c : list){
  		out.print("<option value= "+ c.getIdClassRoom() + ">" + c.getClassName() + "</option>");
  	}
  
  %>
  </select>
  <div class="input-group-append">
 	<a id="lien" href="">
    <button class="btn btn-outline-secondary" type="button">OK</button>
    
    </a>
  </div>

</div>

<div class="input-group-append">
	<a href="./teachers">
   		<button class="btn" type="button">Teachers Panel</button>
   	</a>
</div>
<div class="input-group-append">
	<a href="./books">
		<button class="btn" type="button">Books Panel</button>
   </a>
</div>
<div class="input-group-append">
	<a href="./materials">
		<button class="btn" type="button">Materials Panel</button>
   </a>
</div>
<div class="input-group-append">
	<a href="./students">
		<button class="btn" type="button">Students Panel</button>
   </a>
</div>



<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script type="text/javascript"> 
	
	myFunction();
	function myFunction() {
		var selectedOption = document.getElementById("selectoption");
		var currentSelected = selectedOption.options[selectedOption.selectedIndex].value;
		console.log(currentSelected);
		document.getElementById("lien").href="/schoolProject/class?id="+currentSelected;
	}

</script>
</body>
</html>
					