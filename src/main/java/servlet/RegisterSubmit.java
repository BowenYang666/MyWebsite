package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;

/**
 * Servlet implementation class RegisterSubmit
 * 用来处理 点击注册按钮的事件
 */
@WebServlet("/RegisterSubmit")
public class RegisterSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterSubmit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json");	//设置 响应头为 json
		
		UserDao userDao = new UserDao();
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String ans = "{\"finish\":-}";
		
		if ( userName == null || password == null ) {	//这里，返回字段 finish = 0，表示注册失败
			ans = ans.replace("-", String.valueOf(0) );
			response.getWriter().append(ans);
			System.out.println("oh no");
		}
		boolean isExist = userDao.judgeUserExist(userName);
		if ( isExist ) {
			ans = ans.replace("-", String.valueOf(0) );
			response.getWriter().append(ans);
		}
		else{
			userDao.addUser(userName, password);
			ans = ans.replace("-", String.valueOf(1) );
			response.getWriter().append(ans);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
