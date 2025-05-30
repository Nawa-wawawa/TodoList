package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.naming.NamingException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import beans.Todo;
import todoservices.TodoService;
import utils.Db;

/**
 * Servlet implementation class NewtaskServlet
 */
@WebServlet("/NewtaskServlet")
public class NewtaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NewtaskServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/newtask.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try (Connection con = Db.open()) {

			String status = (request.getParameter("status"));
			String task = (request.getParameter("task"));
			String dateStr = request.getParameter("deadline");
			LocalDate deadline = LocalDate.parse(dateStr.replace("年", "-").replace("月", "-").replace("日", ""));

			String name = (request.getParameter("name"));

			System.out.println(request.getParameter("status") + "servlet");

			Todo todo = new Todo(status, task, deadline, name);

			TodoService sv = new TodoService();

			sv.insert(todo);

		} catch (SQLException | NamingException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath() + "/ListServlet");
	}

}
