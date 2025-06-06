package controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import services.mkuserService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		String mail = (request.getParameter("mail"));
		String pass = (request.getParameter("pass"));

		mkuserService user = new mkuserService();
		boolean judgement = false;
		judgement = user.Login(mail, pass);
		if (judgement) {
			int id = user.retrunuserid(mail,pass);
			
	        HttpSession session = request.getSession();
	        session.setAttribute("loginUserId", id); 
			
			response.sendRedirect(request.getContextPath() + "/ListServlet");

		} else {
			response.sendRedirect(request.getContextPath() + "/LoginServlet?error=1");

		}
	}

}
