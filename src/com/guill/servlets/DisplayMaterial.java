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

import com.guill.beans.Material;
import com.school.bdd.ConnexionBDD;

public class DisplayMaterial extends HttpServlet{

	public void doGet(HttpServletRequest req, HttpServletResponse res)
		      throws ServletException, IOException {	
		try {
			/* Chargement du driver JDBC pour MySQL */
			try {
			    Class.forName( "com.mysql.jdbc.Driver" );
			} catch ( ClassNotFoundException e ) {
			    /* G�rer les �ventuelles erreurs ici. */
			}
			ConnexionBDD conn = new ConnexionBDD("C:\\Users\\33673\\git\\SchoolProject\\src\\SQL\\db.properties");
			conn.seConnecter();
			
			ResultSet rs = conn.getMaterial();

			List<Material> listMaterials = new ArrayList<Material>();
			
			
			while(rs.next()) {
				Material m = new Material();
				m.setIdMaterial(Integer.parseInt((rs.getString("id"))));
				m.setTitle(rs.getString("title"));
				listMaterials.add(m);
			}
		
			
			req.setAttribute("materials", listMaterials);	
			
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		this.getServletContext().getRequestDispatcher( "/WEB-INF/Material.jsp" ).forward( req, res );	

	}
}