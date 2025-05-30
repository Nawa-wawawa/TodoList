package todoservices;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.naming.NamingException;

import beans.Todo;
import utils.Db;

public class TodoService {



	public ArrayList<Todo> select() {
		ArrayList<Todo> Todolist = new ArrayList<>();
		String sql = "select * from tasklist ;";
		try (
				Connection use_connection = Db.open();
				PreparedStatement ps = use_connection.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();) {
			while (rs.next()) {
				Todo todo = new Todo(
						rs.getInt("id"),
						rs.getString("status"),
						rs.getString("task"),
						LocalDate.parse(rs.getString("deadline")),
						rs.getString("name"));
				System.out.println(rs.getInt("id") +
						rs.getString("status") +
						rs.getString("task") +
						LocalDate.parse(rs.getString("deadline")) +
						rs.getString("name"));
				Todolist.add(todo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e1) {
			// TODO 自動生成された catch ブロック
			e1.printStackTrace();
		}
		return Todolist;
	}

	public void insert(Todo todo) {

		String sql = "INSERT INTO tasklist (status,task,deadline,name) VALUES (?,?,?,?)";
		//		int id = 0;

		try (Connection use_connection = Db.open();
				PreparedStatement ps = use_connection.prepareStatement(sql,
						java.sql.Statement.RETURN_GENERATED_KEYS);) {

			ps.setString(1, todo.getStatus());
			ps.setString(2, todo.getTask());
			ps.setDate(3, Date.valueOf(todo.getDeadline()));
			ps.setString(4, todo.getName());

			//			ResultSet res = ps.getGeneratedKeys();

			ps.executeUpdate();

			System.out.println(todo.getStatus() + "service");
			//			if (res.next()) {
			//				id = res.getInt(1);
			//			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e1) {
			// TODO 自動生成された catch ブロック
			e1.printStackTrace();
		}
		//return id;
	}

}
