package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import beans.Login;
import services.mkuserService;
import utils.Db;

/**
 * Servlet implementation class NewloginServlet
 */
@WebServlet("/MkuserServlet")
public class MkuserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MkuserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/newlogin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try (Connection con = Db.open()) {
			mkuserService mkuser = new mkuserService();
			String mail = (request.getParameter("mail"));
			String pass = (request.getParameter("pass"));
			String name = (request.getParameter("name"));
			
			
		//	System.out.println(mail+pass+name);
			
			Login New_acount = new Login(mail,pass,name);
			
			mkuser.insert(New_acount);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e1) {
			// TODO 自動生成された catch ブロック
			e1.printStackTrace();
		}

		response.sendRedirect(request.getContextPath() + "/LoginServlet");
	}

}
