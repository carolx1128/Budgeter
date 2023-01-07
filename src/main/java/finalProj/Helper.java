package finalProj;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;

public class Helper {
	private String conn = "jdbc:mysql://us-cdbr-east-05.cleardb.net/heroku_98fbc899c66fe0b?useSSL=false";
	private String username = "b764fe1630b005";
	private String password = "c1062c1a";
	private Connection connection;
	
	public void connectDB() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
    	connection = DriverManager.getConnection(conn, username, password);
    	// return connection;
	}

	// serach groupId by groupName
	// if groupName not registered, throw exception
	public Integer getGroup(String groupName) throws SQLException, Exception {
		this.connectDB();
		String sql = "SELECT id FROM groups WHERE name = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, groupName);
        ResultSet re = statement.executeQuery();
     
        if(!re.next()) {
        	connection.close();
            statement.close();
            re.close();
        	throw new Exception("This group is not registered.");
        }
        Integer result = re.getInt("id");
        connection.close();
        statement.close();
        re.close();
        return result;
	}

	// search userId by user-name
	public Integer searchIdbyName(String username) throws Exception {
		this.connectDB();
		String sql = "SELECT idUser FROM user WHERE userName = ?";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, username);
		ResultSet re = statement.executeQuery();
		if(!re.next()) {
			connection.close();
            statement.close();
            re.close();
			throw new Exception("This user is not registered.");
		}
		Integer result = re.getInt("idUser");
		connection.close();
        statement.close();
        re.close();
		return result;
	}


	public ArrayList<Expenditure> searchByDate(String date, String name) throws SQLException, Exception{
		ArrayList<Expenditure> result = new ArrayList<Expenditure>();

		Integer myID = searchIdbyName(name);
		
		this.connectDB();
		String sql2 = "SELECT * FROM expenditures WHERE user_id = ? AND date = ?";
		PreparedStatement statement2 = connection.prepareStatement(sql2);
        statement2.setInt(1, myID);
        statement2.setString(2, date);
        ResultSet re2 = statement2.executeQuery();
        while(re2.next()){
        	Expenditure temp = new Expenditure(re2.getInt("id"), re2.getInt("user_id"), re2.getString("description"),
					re2.getString("date"), re2.getInt("genre_id"), re2.getDouble("amount"));
			result.add(temp);
        }
        connection.close();
        statement2.close();
        re2.close();
		return result;
	}

	public ArrayList<Expenditure> searchByCategory(String category, String name) throws Exception {
		ArrayList<Expenditure> result = new ArrayList<Expenditure>();

		Integer UserID = searchIdbyName(name);

		this.connectDB();
		String sql2 = "SELECT id FROM genre WHERE name = ?";
		PreparedStatement statement2 = connection.prepareStatement(sql2);
		statement2.setString(1, category);
		ResultSet re2 = statement2.executeQuery();
		if(!re2.next()) {
			connection.close();
            statement2.close();
            re2.close();
			throw new Exception("There's no this category.");
		}
		Integer CateID = re2.getInt("id");
		statement2.close();
        re2.close();

		String sql3 = "SELECT * FROM expenditures WHERE user_id = ? AND genre_id = ?";
		PreparedStatement statement3 = connection.prepareStatement(sql3);
		statement3.setInt(1, UserID);
		statement3.setInt(2, CateID);
		ResultSet re3 = statement3.executeQuery();
		while(re3.next()){
			Expenditure temp = new Expenditure(re3.getInt("id"), re3.getInt("user_id"), re3.getString("description"),
					re3.getString("date"), re3.getInt("genre_id"), re3.getDouble("amount"));
			result.add(temp);
		}
		connection.close();
		statement3.close();
        re3.close();
        
		return result;
	}
	
	// add expenditure to database
	public void addExpenditure(Double amount, Integer type, String date, Integer userId, String description) throws Exception{
		this.connectDB();
		String sql = "INSERT INTO expenditures (user_id, description, date, genre_id, amount) " +
				"VALUES (?,?,?,?,?)";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setInt(1,userId);
		statement.setString(2,description);
		statement.setString(3, date);
		statement.setInt(4, type);
		statement.setDouble(5, amount);
		statement.execute();
		connection.close();
		statement.close();
	}

	// set groupId in Users table
	public void setGroupId(Integer groupId, String username) throws Exception {
		this.connectDB();
		String sql2 = "SELECT * FROM user WHERE userName = ? AND groupID = ?";
		PreparedStatement statement2 = connection.prepareStatement(sql2);
		statement2.setString(1,username);
		statement2.setInt(2, groupId);
		ResultSet re2 = statement2.executeQuery();
		if (re2.next()){
			statement2.close();
			re2.close();
			connection.close();
			throw new Exception("Same group already been joined");
		}
		statement2.close();
		re2.close();
		String sql = "UPDATE user SET groupID = ? WHERE userName = ?";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setInt(1,groupId);
		statement.setString(2,username);
		statement.executeUpdate();
		connection.close();
		statement.close();
	}
	
	// create a new group in the database
	public void createGroup(String groupName) throws Exception{
		this.connectDB();
		String sql2 = "SELECT * FROM groups WHERE name = ?";
		PreparedStatement statement2 = connection.prepareStatement(sql2);
		statement2.setString(1,groupName);
		ResultSet re2 = statement2.executeQuery();
		if (re2.next()){
			statement2.close();
			re2.close();
			connection.close();
			throw new Exception("Group name already been used");
		}
		statement2.close();
		re2.close();
		String sql = "INSERT INTO groups (name) VALUES (?)";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1,groupName);
		statement.execute();
		connection.close();
		statement.close();
	}
	
	//fixed
	public ArrayList<String> getGroupMembers(String groupName) {
		  ArrayList<String> res = new ArrayList<String>();
		  try{
			  Class.forName("com.mysql.jdbc.Driver");
		  } 
		  catch (ClassNotFoundException e) {
			  e.printStackTrace();
		  }
		  final String DB_URL = "jdbc:mysql://us-cdbr-east-05.cleardb.net/heroku_98fbc899c66fe0b?useSSL=false";
		  try (Connection conn = DriverManager.getConnection(DB_URL,"b764fe1630b005", "c1062c1a");){
		       PreparedStatement selectUsers = conn.prepareStatement("SELECT * FROM user join groups on user.groupID = groups.id where groups.name = ?", Statement.RETURN_GENERATED_KEYS);
			   selectUsers.setString(1, groupName);
			   ResultSet catset = selectUsers.executeQuery();
			   
			   while(catset.next()) {
				    String c_name = catset.getString(2);
				    res.add(c_name);
			   }
			   selectUsers.close();
			   catset.close();
		  }
		  catch(SQLException se){
		            se.printStackTrace();
		        }
		  return res;
		 }
		 
	//fixed
		 public Double getGroupBudget(String groupName) {
			  double res = 0;
			  try{
				  Class.forName("com.mysql.jdbc.Driver");
			  } 
			  catch (ClassNotFoundException e) {
				  e.printStackTrace();
			  }
			  final String DB_URL = "jdbc:mysql://us-cdbr-east-05.cleardb.net/heroku_98fbc899c66fe0b?useSSL=false";
			  try (Connection conn = DriverManager.getConnection(DB_URL,"b764fe1630b005", "c1062c1a");){
			         PreparedStatement selectUsers = conn.prepareStatement("SELECT * FROM user join groups on user.groupID = groups.id where groups.name = ?", Statement.RETURN_GENERATED_KEYS);
			         selectUsers.setString(1, groupName);
			         ResultSet catset = selectUsers.executeQuery();
			         //selectUsers.close();
					 while(catset.next()) {
					    double c_budget = catset.getDouble(6);
					    res += c_budget;
					 }
					 selectUsers.close();
					   catset.close();
			  }
			  catch(SQLException se){
			            se.printStackTrace();
			        }
			  return res;
		 }
		  
		 
		 //fixed
		 public Double getGroupExpenditure(String groupName) {
			  double res = 0;
			  try{
				  Class.forName("com.mysql.jdbc.Driver");
			  } 
			  catch (ClassNotFoundException e) {
				  e.printStackTrace();
			  }
			  final String DB_URL = "jdbc:mysql://us-cdbr-east-05.cleardb.net/heroku_98fbc899c66fe0b?useSSL=false";
			  try (Connection conn = DriverManager.getConnection(DB_URL,"b764fe1630b005", "c1062c1a");){
				   PreparedStatement selectUsers = conn.prepareStatement("SELECT * FROM user join groups on user.groupID = groups.id join expenditures on user.idUser = expenditures.user_id where groups.name = ?", Statement.RETURN_GENERATED_KEYS);
				   selectUsers.setString(1, groupName);
				   ResultSet catset = selectUsers.executeQuery();
				   //selectUsers.close();
				   while(catset.next()) {
					    double c_budget = catset.getDouble(14);
					    res += c_budget;
				   }
				   selectUsers.close();
				   catset.close();
			  }
			  catch(SQLException se){
			      se.printStackTrace();
			  }
			  return res;
		 }
		 
		 //fixed
		 public Double getPersonalBudget(String username) {
			  double res = 0;
			  try{
			   Class.forName("com.mysql.jdbc.Driver");
			  } 
			  catch (ClassNotFoundException e) {
			   e.printStackTrace();
			  }
			  final String DB_URL = "jdbc:mysql://us-cdbr-east-05.cleardb.net/heroku_98fbc899c66fe0b?useSSL=false";
			  try(Connection conn = DriverManager.getConnection(DB_URL,"b764fe1630b005", "c1062c1a");) {
			         PreparedStatement selectUsers = conn.prepareStatement("SELECT * FROM user join groups where user.userName = ?", Statement.RETURN_GENERATED_KEYS);
			   selectUsers.setString(1, username);
			   ResultSet catset = selectUsers.executeQuery();
			   //selectUsers.close();
			   if(catset.next()) {
			    double c_budget = catset.getDouble(6);
			    res += c_budget;
			   }
			   selectUsers.close();
			   catset.close();
			  }
			  catch(SQLException se){
			            se.printStackTrace();
			        }
			  return res;
			 }
			 
		 //fixed
			 public Double getPersonalExpenditure(String username) {
			  double res = 0;
			  try{
			   Class.forName("com.mysql.jdbc.Driver");
			  } 
			  catch (ClassNotFoundException e) {
			   e.printStackTrace();
			  }
			  final String DB_URL = "jdbc:mysql://us-cdbr-east-05.cleardb.net/heroku_98fbc899c66fe0b?useSSL=false";
			  try (Connection conn = DriverManager.getConnection(DB_URL,"b764fe1630b005", "c1062c1a");){
			   PreparedStatement selectUsers = conn.prepareStatement("SELECT expenditures.amount FROM user\n"
			   		+ "join expenditures on user.idUser = expenditures.user_id\n"
			   		+ "where userName = ?", Statement.RETURN_GENERATED_KEYS);
			   selectUsers.setString(1, username);
			   ResultSet catset = selectUsers.executeQuery();
			   //selectUsers.close();
			   while(catset.next()) {
			    double c_expenditure = catset.getDouble(1);
			    res += c_expenditure;
			   }
			   selectUsers.close();
			   catset.close();
			  }
			  catch(SQLException se){
			            se.printStackTrace();
			        }
			  return res;
			 }
			 
			 public String getGroupName(String username) {
				  double res = 0;
				  try{
					  Class.forName("com.mysql.jdbc.Driver");
				  } 
				  catch (ClassNotFoundException e) {
				   e.printStackTrace();
				  }
				  final String DB_URL = "jdbc:mysql://us-cdbr-east-05.cleardb.net/heroku_98fbc899c66fe0b?useSSL=false";
				  try (Connection conn = DriverManager.getConnection(DB_URL,"b764fe1630b005", "c1062c1a");){
				   PreparedStatement selectUsers = conn.prepareStatement("SELECT groups.name FROM user join groups on groups.id = user.groupID where userName = ?;", Statement.RETURN_GENERATED_KEYS);
				   selectUsers.setString(1, username);
				   ResultSet catset = selectUsers.executeQuery();
				   //selectUsers.close();
				   if(catset.next()) {
				    String c_name = catset.getString(1);
				    return c_name;
				   }
				   selectUsers.close();
				   catset.close();
				  }
				  catch(SQLException se){
				            se.printStackTrace();
				        }
				  return null;
				 }
			 
			 public void changeBudget(String name, double newBudget) throws Exception{
				  this.connectDB();
				  String sql = "UPDATE user SET budget = ? WHERE userName = ?";
				  PreparedStatement statement = connection.prepareStatement(sql);
				  statement.setDouble(1,newBudget);
				  statement.setString(2,name);
				  statement.execute();
				  connection.close();
				  statement.close();
			}
			
			 public boolean checkGroupName(String Name) {
				 try{
					 Class.forName("com.mysql.jdbc.Driver");
				 } 
				 catch (ClassNotFoundException e) {
					 e.printStackTrace();
				 }
				 final String DB_URL = "jdbc:mysql://us-cdbr-east-05.cleardb.net/heroku_98fbc899c66fe0b?useSSL=false";
				 try (Connection conn = DriverManager.getConnection(DB_URL,"b764fe1630b005", "c1062c1a");){
					 PreparedStatement selectUsers = conn.prepareStatement("select count(groups.name) from groups where groups.name = ?;", Statement.RETURN_GENERATED_KEYS);
					 selectUsers.setString(1, Name);
					 ResultSet catset = selectUsers.executeQuery();
					 boolean result=true;
					 //selectUsers.close();
					 int count = 0;
					 if(catset.next()) {
						 count = catset.getInt(1);
					 }
					 if(count != 0) {
						 result = false;
					 }
				   
					 selectUsers.close();
					 catset.close();
					 return result;
				 }
				 catch(SQLException se){
					 se.printStackTrace();
				 }
				 return true;
			}
			 
}
