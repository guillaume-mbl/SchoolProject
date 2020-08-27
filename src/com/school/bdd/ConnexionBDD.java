package com.school.bdd;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;

public class ConnexionBDD {

    private Connection maConnexion;
    private String user;
    private String password;
    private String dbUrl;
    private String cheminFichierProperties;

    public ConnexionBDD(String cheminFichierProperties) throws IOException, SQLException {
    this.cheminFichierProperties = cheminFichierProperties;
    }

    public void seConnecter() throws SQLException, IOException {
        Properties props = new Properties();
        props.load(new FileInputStream(cheminFichierProperties));
        user = props.getProperty("user");
        password = props.getProperty("password");
        dbUrl = props.getProperty("dburl");
        
        maConnexion = DriverManager.getConnection(dbUrl, user, password);
        
    }

    public Connection getMaConnexion() {
        return maConnexion;
    }
    
    public void getBooks() throws SQLException {
    	
    	String query = "Select * from book";
    	
    	Statement st = maConnexion.createStatement();
        ResultSet rs = st.executeQuery(query);
        while (rs.next()) {
            System.out.format("titre : %s\n", rs.getString("title"));
        }
        
    	
    }

}
