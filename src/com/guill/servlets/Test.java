package com.guill.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.school.bdd.ConnexionBDD;

public class Test extends HttpServlet{

	public void doGet(HttpServletRequest req, HttpServletResponse res)
		      throws ServletException, IOException {	
		try {
			/* Chargement du driver JDBC pour MySQL */
			try {
			    Class.forName( "com.mysql.jdbc.Driver" );
			} catch ( ClassNotFoundException e ) {
			    /* Gérer les éventuelles erreurs ici. */
			}
			ConnexionBDD conn = new ConnexionBDD("C:\\Users\\tarik\\git\\SchoolProject\\src\\SQL\\db.properties");
			conn.seConnecter();
			
			conn.getBooks(); 
			System.out.println("OK");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		this.getServletContext().getRequestDispatcher( "/WEB-INF/test.jsp" ).forward( req, res );		
	}
}
