<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@page import="com.guill.beans.Teacher"%>
<%@page import="java.util.*"%>


<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<title>Teacher</title>
	</head>
	<body>
<div class="modal fade" id="modalAddTeacher" tabindex="-1" role="dialog" aria-labelledby=""modal"" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    
      <form method="post">
         
	      <div class="modal-header">
	        <h5 class="modal-title" id="modalAddTeacher">Add Teacher</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">      	 
	      	 <div class="form-group">
		      	 <label for="surname">Surname</label>
		      	 <input type="text" class="form-control" id="surname" placeholder="SURNAME" required name="surname">
	      	 </div>
	      	 
	      	 <div class="form-group">
		      	 <label for="name">Name</label>
		      	 <input type="text" class="form-control" id="name" placeholder="NAME" required name="name">
	      	 </div>
	      	 
	      	 <div class="form-group">
		      	<label for="surname">birthdate (YYYY-mm-DD)</label>
	      	 	<input type="date" class="form-control" id="birthdate" placeholder="birthdate" required name="birthdate">
	      	 
	      	 </div>
      	</div>
		<div class="modal-footer">
	             <input type="submit" class="btn btn-success" name="submit" value="Create"/>
	   	</div>
	   </form>
    </div>
  </div>
</div>
</div>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalAddTeacher">
		 	 Add teacher
	</button>
    </div>
		<table class="table table-dark">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">Firstname</th>
					<th scope="col">Lastname</th>
				</tr>
			</thead>
			<tbody>
				<%
				List<Teacher> list = (ArrayList<Teacher>)request.getAttribute("teachers");
				for(Teacher s : list){
					out.print("<tr>");
					out.print("<td><form action=\"\" method=\"post\"></td>");
					out.print("<th scope=\"row\" required name=\"idPerson\">" + s.getId() + "</th>");
					out.print("<input type = \"hidden\" name = \"idPerson\" value = "+ s.getId() + " />");
					
					out.print("<td required id=\"firstname\" name=\"firstname\" value =\""+s.getFirstname()+"\">" + s.getFirstname() + "</td>");
					out.print("<input type = \"hidden\" name = \"firstname\" value = \""+ s.getFirstname() + "\" />");
					
					out.print("<td required id=\"lastname\" name=\"lastname\">" + s.getLastname() + "</td>");
					out.print("<input type = \"hidden\" name = \"lastname\" value = \""+ s.getFirstname() + "\" />");
					
					out.print("<td><input type=\"submit\" class=\"btn btn-success\" name=\"submit\" value=\"Delete\"/><td>");
					
					out.print("<td></form></td>");
					out.print("</tr>");
				}
				%>
			</tbody>
		</table>
		
			
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	</body>
</html>

	
				
					