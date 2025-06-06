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
import jakarta.servlet.http.HttpSession;

import beans.Todo;
import services.TodoService;
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
			
			HttpSession session = request.getSession();
			int user_id = (int) session.getAttribute("loginUserId");
		
			TodoService sv = new TodoService();
			String user_name =  sv.getUsername(user_id);
			
//			System.out.println(request.getParameter("status") + "servlet");
			
			Todo todo = new Todo(status, task, deadline, user_name);

			sv.insert(todo,user_id);

		} catch (SQLException | NamingException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath() + "/ListServlet");
	}

}
