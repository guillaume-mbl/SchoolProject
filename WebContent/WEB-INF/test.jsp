<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<p>Ceci est une page générée depuis une jsp</p>
	<p><% 
	com.guill.beans.Person notreBean = (com.guill.beans.Person) request.getAttribute("personne");
	out.println( notreBean.getPrenom() );
	out.println( notreBean.getNom() );
	
	%>
	</p>
</body>
</html>