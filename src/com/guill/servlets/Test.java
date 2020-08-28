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

import com.guill.beans.Classroom;
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
			ConnexionBDD conn = new ConnexionBDD("C:\\Users\\33673\\git\\SchoolProject\\src\\SQL\\db.properties");
			conn.seConnecter();
			
			ResultSet rs = conn.getClassroom();

			List<Classroom> listeClasse = new ArrayList<Classroom>();
			
			Classroom c = new Classroom();
			
			while(rs.next()) {
				c.setClassName(rs.getString("name"));
				c.setClassName(rs.getString("name"));
			}
			
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		this.getServletContext().getRequestDispatcher( "/WEB-INF/Home.jsp" ).forward( req, res );		
	}
}
