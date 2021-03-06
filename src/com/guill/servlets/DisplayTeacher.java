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
import com.guill.beans.Teacher;
import com.school.bdd.ConnexionBDD;

public class DisplayTeacher extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
		      throws ServletException, IOException {	
		try {
			/* Chargement du driver JDBC pour MySQL */
			try {
			    Class.forName( "com.mysql.jdbc.Driver" );
			} catch ( ClassNotFoundException e ) {
			    /* G�rer les �ventuelles erreurs ici. */
			}
			ConnexionBDD conn = new ConnexionBDD();
			conn.seConnecter();
			
			List<Teacher> listTeachers = conn.getTeachers();
						
			req.setAttribute("teachers", listTeachers);	
						
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		this.getServletContext().getRequestDispatcher( "/WEB-INF/Teacher.jsp" ).forward( req, res );	

	}
	
	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("firstname") != null) {
			ConnexionBDD conn;
			try {
				conn = new ConnexionBDD();
				conn.seConnecter();
				
				conn.deleteTeacher(Integer.parseInt(request.getParameter("idPerson")));
				
			} catch (IOException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}else if(request.getParameter("surname") != null) {
			
			Teacher t = new Teacher();
			
			t.setBirthdate(request.getParameter("birthdate"));
			t.setFirstname(request.getParameter("surname"));
			t.setLastname(request.getParameter("name"));;
			
			
			ConnexionBDD conn;
			try {
				conn = new ConnexionBDD();
				conn.seConnecter();
				
				conn.addTeacher(t);
				
				
			} catch (IOException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	
		doGet(request,response);
	}
}