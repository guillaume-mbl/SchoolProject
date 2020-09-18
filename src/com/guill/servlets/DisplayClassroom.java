package com.guill.servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guill.beans.Classroom;
import com.guill.beans.Student;
import com.guill.beans.Teacher;
import com.school.bdd.ConnexionBDD;

public class DisplayClassroom extends HttpServlet{

	public void doGet(HttpServletRequest req, HttpServletResponse res)
		      throws ServletException, IOException {	
		
		try {
		    Class.forName( "com.mysql.jdbc.Driver" );
		} catch ( ClassNotFoundException e ) {
		    /* Gérer les éventuelles erreurs ici. */
		}
		
		try {
			ConnexionBDD conn = new ConnexionBDD();
			conn.seConnecter();

			int idClass = Integer.parseInt(req.getParameter("id"));
			
			req.setAttribute("Teachers", conn.getTeachers());
			req.setAttribute("Classroom", conn.getClassroom(idClass));
			req.setAttribute("Students", conn.getStudents(idClass));
			req.setAttribute("Teacher", conn.getTeacherByClass(idClass));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("ok2");
		this.getServletContext().getRequestDispatcher("/WEB-INF/Classroom.jsp" ).forward( req, res );	

	}
	
	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
	
		
		if(request.getParameter("surname")!= null ) {
			Student s = new Student();
			
			s.setBirthdate(request.getParameter("birthdate"));
			s.setFirstname(request.getParameter("surname"));
			s.setLastname(request.getParameter("name"));
			s.setStudentNumber(Integer.parseInt(request.getParameter("studentNumber")));
			
			
			ConnexionBDD conn;
			try {
				conn = new ConnexionBDD();
				conn.seConnecter();
				
				conn.addStudent(s,Integer.parseInt(request.getParameter("id")));
				
				
			} catch (IOException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(request.getParameter("idPerson")!= null) {
			System.out.println(request.getParameter("idPerson"));
			System.out.println(request.getParameter("id"));
			
			ConnexionBDD conn;
			try {
				conn = new ConnexionBDD();
				conn.seConnecter();
				
				conn.updateTeacherClassroom(Integer.parseInt(request.getParameter("idPerson")),Integer.parseInt(request.getParameter("id")));
				
			} catch (IOException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		}else if(request.getParameter("idStud")!=null) {
			System.out.println(request.getParameter("idPerson"));
			System.out.println(request.getParameter("id"));
			
			ConnexionBDD conn;
			try {
				conn = new ConnexionBDD();
				conn.seConnecter();
				
				conn.deleteStudent(Integer.parseInt(request.getParameter("idStud")));
				
			} catch (IOException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}

		doGet(request,response);
	}
}