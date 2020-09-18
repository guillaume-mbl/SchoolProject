<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.guill.beans.*"%>
<%@page import="java.util.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Classroom</title>
<!-- CSS only -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<!-- JS, Popper.js, and jQuery -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<div class="container">
    <nav class="navbar navbar-light bg-light justify-content-center" style="margin-bottom: 20px;">
        <div class="row" style="text-align:center;">
          <p class="text-center">Classroom :</p><p class="font-weight-bold">&nbsp;
          <%
	      	 Classroom c = (Classroom) request.getAttribute("Classroom");
	      	 out.print(c.getClassName());
	      	 
	      %>
          </p>
        </div>
    </nav>
    
 <div class="modal fade" id="modalStudent" tabindex="-1" role="dialog" aria-labelledby=""modal"" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    
      <form method="post">
         
	      <div class="modal-header">
	        <h5 class="modal-title" id="modalStudent">Add Student</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      
	      	 <div class="form-group">
		      	 <label for="labelSurname"> Classroom ID </label>
		      	 <input type="text" class="form-control" id="idClass" placeholder="ID" name="id" value="<%
		      			out.print(c.getIdClassRoom());
		      	 %>" readonly>
	      	 </div>
	      	 
	      	 <div class="form-group">
		      	 <label for="surname">Surname</label>
		      	 <input type="text" class="form-control" id="surname" placeholder="SURNAME" required name="surname">
	      	 </div>
	      	 
	      	 <div class="form-group">
		      	 <label for="surname">Name</label>
		      	 <input type="text" class="form-control" id="name" placeholder="" required name="name">
	      	 </div>
	      	 
	      	 <div class="form-group">
		      	<label for="surname">birthdate (YYYY-mm-DD)</label>
	      	 	<input type="date" class="form-control" id="birthdate" placeholder="" required name="birthdate">
	      	 
	      	 </div>
	      	 
	      	 <div class="form-group">
		      	 <label for="surname">StudentNumber</label>
		      	 <input type="number" class="form-control" id="studentNumber" placeholder="" required name="studentNumber">
	      	 </div>
      	</div>
		<div class="modal-footer">
	             <input type="submit" class="btn btn-success" name="submit" value="Create"/>
	   	</div>
	   </form>
    </div>
  </div>
</div>

<div class="modal fade" id="modalTeacher" tabindex="-1" role="dialog" aria-labelledby=""modal"" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    
      <form method="post">
         
	      <div class="modal-header">
	        <h5 class="modal-title" id="modalTeacher">Change Teacher</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	 <div class="form-group">
		      	 <label for="labelSurname"> Classroom ID </label>
		      	 <input type="text" class="form-control" id="idClass" placeholder="ID" name="id" value="<%
		      			out.print(c.getIdClassRoom());
		      	 %>" readonly>
	      	 </div>
	      	<select class="browser-default custom-select" required name="idPerson">
			  <option selected >Open this select menu</option>
			    <%
			    
			    List<Teacher> listeProf = (ArrayList<Teacher>)request.getAttribute("Teachers");

	    		System.out.println("okT");	
			  	for(Teacher t : listeProf){
			  		out.print("<option value= \""+ t.getIdTeacher()+"\">"+t.getFirstname() + " " + t.getLastname() + "</option>");
			  	}
			    
			    
			    %>
			  </select>	      	 
	     </div>
		<div class="modal-footer">
	             <input type="submit" class="btn btn-success" name="submit" value="Modify"/>
	   	</div>
	   </form>
    </div>
  </div>
</div>

<div class="modal fade" id="modalStudentErase" tabindex="-1" role="dialog" aria-labelledby=""modal"" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    
      <form method="post">
         
	      <div class="modal-header">
	        <h5 class="modal-title" id="modalStudentErase">Erase Student</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	 <div class="form-group">
		      	 <label for="labelSurname"> Classroom ID </label>
		      	 <input type="text" class="form-control" id="idClass" placeholder="ID" name="id" value="<%
		      			out.print(c.getIdClassRoom());
		      	 %>" readonly>
	      	 </div>
	      	<select class="browser-default custom-select" required name="idStud">
			  <option selected >Open this select menu</option>
			    <%
			    
			    List<Student> listeS = (ArrayList<Student>)request.getAttribute("Students");

	    		System.out.println("okT");	
			  	for(Student s : listeS){
			  		out.print("<option value= \""+ s.getId()+"\">"+s.getFirstname() + " " + s.getLastname() + "</option>");
			  	}
			    
			    
			    %>
			  </select>	      	 
	     </div>
		<div class="modal-footer">
	             <input type="submit" class="btn btn-success" name="submit" value="Erase"/>
	   	</div>
	   </form>
    </div>
  </div>
</div>

  <div class="row">
    <div class="col">
        <div class="row"><p class="text-center">Teacher : </p>&nbsp;<p class="font-weight-bold"><a href="">
        <% 
		
        Teacher t = (Teacher)request.getAttribute("Teacher");
        
        if (t != null) {
            System.out.println(t.getFirstname());
        	out.print(t.getFirstname() + " " + t.getLastname());
        }
        %>
        </a></p>
       
    </div>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalTeacher">
		 	 Modify Teacher
	</button>
    </div>
    
  </div>
  	<div class="col">
        <div class="col">
        <ul class="list-group">
        <% 
		
        List<Student> list = (ArrayList<Student>)request.getAttribute("Students");
        
        for(Student s : list){
        	out.print("<li class=\"list-group-item\">"+s.getFirstname() + " " + s.getLastname()+"</li>");
        }
        %>
       </ul>
       </div>
    </div>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalStudent">
		 	 Add Student
	</button>
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalStudentErase">
		 	 Delete Student
	</button>
    </div>
    
  </div>
</div>
</body>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</html>