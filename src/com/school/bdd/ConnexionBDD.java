package com.school.bdd;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.guill.beans.Classroom;
import com.guill.beans.Material;
import com.guill.beans.Student;
import com.guill.beans.Teacher;

public class ConnexionBDD {

    private Connection maConnexion;
    private String user;
    private String password;
    private String dbUrl;
    private String cheminFichierProperties;

    public ConnexionBDD() throws IOException, SQLException {
    this.cheminFichierProperties = "C:\\Users\\tarik\\git\\SchoolProject\\src\\SQL\\db.properties";
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
    
public String getClassRoomName(int idClass) throws SQLException {
	String query = "Select name from classroom where id = " + idClass;
	
	Statement st = maConnexion.createStatement();
    ResultSet rs = st.executeQuery(query);
	
    while(rs.next()) {

    	return rs.getString("name");
    }
    
    return "";
 
}

public Classroom getClassroom(int idClass) throws SQLException {
	
	String query = "Select * from classroom where id = " + idClass;
	
	Statement st = maConnexion.createStatement();
    ResultSet rs = st.executeQuery(query);
    

    while(rs.next()) {
    	Classroom c = new Classroom();
		c.setIdClassRoom(Integer.parseInt(rs.getString("id")));
		c.setClassName(rs.getString("name"));
		
		return c;
	}
    
    return null;
}
    
 public ResultSet getClassrooms() throws SQLException {
    	
    	String query = "Select * from classroom";
    	
    	Statement st = maConnexion.createStatement();
        ResultSet rs = st.executeQuery(query);
        
        
        return rs;
    }
 
 public ResultSet getBook() throws SQLException {
 	
 	String query = "Select * from book";
 	
 	Statement st = maConnexion.createStatement();
     ResultSet rs = st.executeQuery(query);
     
     
     return rs;
 }
 
 public List<Material> getMaterials() throws SQLException {
 	 String query = "Select * from material";
 	
 	 Statement st = maConnexion.createStatement();
	 ResultSet rs = st.executeQuery(query);
	 
	 List<Material> listMaterials = new ArrayList<Material>();
		
	 while(rs.next()) {
			Material m = new Material();
			m.setIdMaterial(Integer.parseInt((rs.getString("id"))));
			m.setTitle(rs.getString("title"));
			listMaterials.add(m);
		}
	
	 return listMaterials;
 }
 
 public Student getStudent(int idStudent) {
	 
	 String query = "SELECT * FROM person INNER JOIN student ON person.id=student.idPerson where student.idPerson = " + idStudent; 
	 
	 try {
		ResultSet rs = maConnexion.createStatement().executeQuery(query);
		
		if(rs.next()) {
			Student s = new Student();
			s.setStudentNumber(Integer.parseInt((rs.getString("studentNumber"))));
			s.setId(Integer.parseInt((rs.getString("id"))));
			s.setFirstname(rs.getString("firstname"));
			s.setLastname(rs.getString("lastname"));
			
			return s;
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 
	 return null;
	 
 }
 
 public ResultSet getStudent() throws SQLException {
 	String query = "SELECT * FROM person INNER JOIN student ON person.id=student.idPerson";
 	
 	Statement st = maConnexion.createStatement();
     ResultSet rs = st.executeQuery(query);
     
     return rs;
 }
 

 
 public List<Teacher> getTeachers() throws SQLException {
	 	String query = "SELECT person.id AS idPerson, firstname, lastname, birthdate, teacher.id AS idTeacher, email FROM person INNER JOIN teacher ON person.id=teacher.idPerson";
	 	
	 	Statement st = maConnexion.createStatement();
	    ResultSet rs = st.executeQuery(query);
	    
	    List<Teacher> listTeacher = new ArrayList<Teacher>();
	    
	    while(rs.next()){
		    Teacher t = new Teacher();
		    t.setId(rs.getInt("idPerson"));
		    t.setBirthdate(rs.getString("birthdate"));
		    t.setEmail(rs.getString("email"));
		    t.setIdTeacher(rs.getInt("idTeacher"));
		    t.setFirstname(rs.getString("firstname"));
		    t.setLastname(rs.getString("lastname"));
		    
		    listTeacher.add(t);
	    }
	    
	    return listTeacher;
	 }
 
 
 public Teacher getTeacherById(int idPerson) {
	 
	 String query = "SELECT * FROM person INNER JOIN teacher ON person.id=teacher.idPerson where teacher.idPerson = " + idPerson; 
	 
	 try {
		ResultSet rs = maConnexion.createStatement().executeQuery(query);
		
		if(rs.next()) {
			Teacher t = new Teacher();
			t.setIdTeacher(Integer.parseInt((rs.getString("id"))));
			t.setId(Integer.parseInt((rs.getString("idPerson"))));
			t.setFirstname(rs.getString("firstname"));
			t.setLastname(rs.getString("lastname"));
			
			return t;
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 
	 return null;
	 
 }

public List<Student> getStudents(int idClass) throws SQLException {
	// TODO Auto-generated method stub
	String query = "SELECT * FROM person INNER JOIN student ON person.id=student.idPerson "
			+ "inner join student_classroom on person.id = student_classroom.idStudent "
			+ "where student_classroom.idClassroom = " + idClass;

	Statement st = maConnexion.createStatement();
    ResultSet rs = st.executeQuery(query);
    
    List<Student> listStudents = new ArrayList<Student>();
	
	
	while(rs.next()) {
		Student s = new Student();
		s.setStudentNumber(Integer.parseInt((rs.getString("studentNumber"))));
		s.setId(Integer.parseInt((rs.getString("id"))));
		s.setFirstname(rs.getString("firstname"));
		s.setLastname(rs.getString("lastname"));
		s.setBirthdate(rs.getString("birthdate"));
		listStudents.add(s);
	}
	
	return listStudents;	

}

	public Teacher getTeacherByClass(int idClass) throws SQLException {
		// TODO Auto-generated method stub
		String query = "SELECT * FROM teacher inner join person on teacher.idPerson = Person.id "
				+ "inner join teaching on teaching.idTeacher = teacher.id "
				+ "WHERE teaching.idClassroom = " + idClass;

		Statement st = maConnexion.createStatement();
	    ResultSet rs = st.executeQuery(query);
	    
		while(rs.next()) {
			Teacher t = new Teacher();
			t.setId(Integer.parseInt(rs.getString("Person.id")));
			t.setFirstname(rs.getString("Person.firstname"));
			t.setLastname(rs.getString("Person.lastname"));
			return t;	
		}	
		return null;
	}
	
	public boolean addStudent(Student s,int idClass) throws SQLException {
		String queryPerson = "INSERT INTO PERSON (firstname,lastname,birthdate) VALUES ('"+s.getFirstname()+"','"+s.getLastname()+"','"+s.getBirthdate()+"')";
		
		Statement st = maConnexion.createStatement();
		st.executeUpdate(queryPerson);
		
		
		queryPerson = "SELECT id FROM PERSON WHERE firstname = '"+s.getFirstname()+"' AND lastname = '"+s.getLastname()+"' AND birthdate = '"+s.getBirthdate()+"'";		
		
		ResultSet rs = st.executeQuery(queryPerson);
		
		while(rs.next()) {

			String queryStudent = "INSERT INTO STUDENT (idPerson, StudentNumber) VALUES ("+ rs.getInt("id")+","+s.getStudentNumber()+")";
			maConnexion.createStatement().executeUpdate(queryStudent);
			
			queryStudent = "SELECT id FROM Student WHERE idPerson = "+ rs.getInt("id");		
		
			ResultSet rsSt = st.executeQuery(queryPerson);
			
			while(rsSt.next()){
				String queryStudentClassroom = "INSERT INTO student_classroom (idStudent,idClassroom) VALUES ("+rsSt.getInt("id")+","+idClass+")";
				maConnexion.createStatement().executeUpdate(queryStudentClassroom);
				rsSt.close();
				return true;
			}
			return false;
		}
		return false;
	}
	
	public boolean updateTeacherClassroom(int idTeacher, int idClass){
		
		String verifExiste = "SELECT * FROM teaching WHERE idClassroom = " + idClass;
		String queryUpdate = "UPDATE teaching SET idTeacher = " + idTeacher + " WHERE idClassroom = " + idClass +"";
		String queryAdd = "INSERT INTO teaching (idTeacher, idClassroom) VALUES (" + idTeacher + "," + idClass + ")";
		
		try {
			ResultSet rs = maConnexion.createStatement().executeQuery(verifExiste);
			
			if(rs.next() == false) {
				maConnexion.createStatement().execute(queryAdd);
			}else {
				maConnexion.createStatement().executeUpdate(queryUpdate);
			}
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean deleteStudent(int idStudent)  {
		
		String query = "DELETE FROM student where idPerson = " + idStudent;
		String queryPerson = "DELETE FROM person WHERE id = " + idStudent;
		Student s = getStudent(idStudent);

		try {
		if(s!= null) {
			
				maConnexion.createStatement().execute(query);
				maConnexion.createStatement().execute(queryPerson);
			
			return true;
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean deleteTeacher(int idPerson) {
		String query = "DELETE FROM teacher where idPerson = " + idPerson;
		String queryPerson = "DELETE FROM person WHERE id = " + idPerson;
		String queryTeaching = "DELETE FROM TEACHING WHERE idTeacher = ";
			
		Teacher t = getTeacherById(idPerson);
		try {
			if(t!= null) {
				
					maConnexion.createStatement().execute(query);
					maConnexion.createStatement().execute(queryPerson);
					maConnexion.createStatement().execute(queryTeaching + t.getIdTeacher());
				
				return true;
			}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return false;
	}
	
	public boolean addTeacher(Teacher t) {
		String queryPerson = "INSERT INTO PERSON (firstname,lastname,birthdate) VALUES ('" + t.getFirstname() + "','" + t.getLastname() + "','" + t.getBirthdate() + "')";
		
		try {
			maConnexion.createStatement().execute(queryPerson);
			
			ResultSet rs = maConnexion.createStatement().executeQuery("SELECT id FROM PERSON where firstname = '" + t.getFirstname() + "' and lastname = '" + t.getLastname() + "'");
			
			if(rs.next()) {
				t.setId(rs.getInt("id"));
			}else {
				return false;
			}
			
			String queryTeacher = "INSERT INTO teacher (idPerson,email) VALUES ("+t.getId()+",'"+t.getEmail() +"')";
			
			maConnexion.createStatement().execute(queryTeacher);
			
			return true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return false;
	}
}
