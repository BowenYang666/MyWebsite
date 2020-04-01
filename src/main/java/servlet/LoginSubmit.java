package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.UserDao;

/**
 * Servlet implementation class LoginStatusCheck
 */
@WebServlet("/LoginSubmit")
public class LoginSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginSubmit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		long result = 0;
		UserDao userDao = new UserDao();
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		if (userName == null || password == null) {
			result = 0;
		}
		else result = userDao.checkPassword(userName, password);
		
		String ans = "{\"result\":-}";
		ans = ans.replace("-", String.valueOf(result) );
		response.setContentType("application/json");	//设置 响应头为 json
		response.getWriter().append(ans);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}
