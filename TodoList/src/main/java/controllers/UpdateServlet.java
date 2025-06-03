package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.naming.NamingException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import beans.Todo;
import services.TodoService;
import utils.Db;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		ArrayList<Todo> tasklist = null;
		HttpSession session = request.getSession();
		int user_id = (int) session.getAttribute("loginUserId");

		try (Connection con = Db.open()) {
			TodoService sv = new TodoService();
			
			tasklist = sv.select(user_id);

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e1) {
			// TODO 自動生成された catch ブロック
			e1.printStackTrace();
		}

		request.setAttribute("tasklist", tasklist);
		request.getRequestDispatcher("/updatetasks.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try (Connection con = Db.open()) {

			int id = Integer.parseInt(request.getParameter("id"));

			String status = (request.getParameter("status"));
			String task = (request.getParameter("task"));
			String dateStr = request.getParameter("deadline");
			LocalDate deadline = LocalDate.parse(dateStr.replace("年", "-").replace("月", "-").replace("日", ""));

		//	System.out.println(request.getParameter("status") + "servlet");

			Todo todo = new Todo(id, status, task, deadline);

			TodoService sv = new TodoService();
			HttpSession session = request.getSession();
			int user_id = (int) session.getAttribute("loginUserId");

			sv.update(todo,user_id);

		} catch (SQLException | NamingException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath() + "/ListServlet");
	}

}
