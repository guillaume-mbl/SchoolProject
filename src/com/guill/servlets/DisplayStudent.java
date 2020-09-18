package com.guill.servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guill.beans.Student;
import com.school.bdd.ConnexionBDD;

public class DisplayStudent extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
		      throws ServletException, IOException {	
		try {
			/* Chargement du driver JDBC pour MySQL */
			try {
			    Class.forName( "com.mysql.jdbc.Driver" );
			} catch ( ClassNotFoundException e ) {
			    /* Gérer les éventuelles erreurs ici. */
			}
			ConnexionBDD conn = new ConnexionBDD();
			conn.seConnecter();
			
			ResultSet rs = conn.getStudent();

			List<Student> listStudents = new ArrayList<Student>();
			
			
			while(rs.next()) {
				Student s = new Student();
				s.setStudentNumber(Integer.parseInt((rs.getString("studentNumber"))));
				s.setId(Integer.parseInt((rs.getString("id"))));
				s.setFirstname(rs.getString("firstname"));
				s.setLastname(rs.getString("lastname"));
				listStudents.add(s);
			}
		
			
			req.setAttribute("students", listStudents);	
			
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		this.getServletContext().getRequestDispatcher( "/WEB-INF/Student.jsp" ).forward( req, res );	

	}
}