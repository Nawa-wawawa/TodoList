package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Optional;

import javax.naming.NamingException;

import beans.Login;
import utils.Db;

public class mkuserService {
	
	
		public ArrayList<Login> select() {
			ArrayList<Login> Users = new ArrayList<>();
			String sql = "select * from loglist ;";
			try (
					Connection use_connection = Db.open();
					PreparedStatement ps = use_connection.prepareStatement(sql);
					ResultSet rs = ps.executeQuery();) {
				while (rs.next()) {
					Login users = new Login(
							rs.getInt("id"),
							rs.getString("mail"),
							rs.getString("pass"),
							rs.getString("name"));
					Users.add(users);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (NamingException e1) {
				// TODO 自動生成された catch ブロック
				e1.printStackTrace();
			}
			return Users;
		}
	
	public void insert(Login user) {

		String sql = "INSERT INTO loglist (mail,pass,name) VALUES (?,?,?)";

		try (Connection use_connection = Db.open();
				PreparedStatement ps = use_connection.prepareStatement(sql,
						java.sql.Statement.RETURN_GENERATED_KEYS);) {

			ps.setString(1, user.getMail());
			ps.setString(2, user.getPass());
			ps.setString(3, user.getName());

			//			ResultSet res = ps.getGeneratedKeys();

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e1) {
			e1.printStackTrace();
		}
	}
	
	
	
	public int  retrunuserid(String mail ,String pass) {
		
		ArrayList<Login> Users = select(); 

		Optional<Login> matchedUser = Users.stream()
			    .filter(user -> user.getMail().equals(mail) && user.getPass().equals(pass))
			    .findFirst();

			if (matchedUser.isPresent()) {
			    int id = matchedUser.get().getId();
				return id;
			} else {
				return 0;
			}
	}
	
	public boolean Login(String mail ,String pass){
		
		boolean user_authentication = false;
		ArrayList<Login> Users = select(); 

		user_authentication = Users.stream()
		    .anyMatch(user -> user.getMail().equals(mail) && user.getPass().equals(pass));

		return user_authentication;

	}

}
