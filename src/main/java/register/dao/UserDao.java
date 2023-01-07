package register.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import register.model.User;

public class UserDao {

	public int registerUser(User user) throws ClassNotFoundException {
		String INSERT_USERS_SQL = "INSERT INTO user (userEmail, userName, userPassword) VALUES (?, ?, ?)";
		
		int result = 0;
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try (Connection connection = DriverManager
				.getConnection("jdbc:mysql://us-cdbr-east-05.cleardb.net/heroku_98fbc899c66fe0b?useSSL=false", "b764fe1630b005", "c1062c1a");
			
			PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)){
				preparedStatement.setString(1, user.getEmail());
				preparedStatement.setString(2, user.getName());
				preparedStatement.setString(3, user.getPassword());
				
				result = preparedStatement.executeUpdate();
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
}
