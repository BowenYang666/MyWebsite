package servlet;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Article;
import dao.ArticleDao;
import util.ArticleComparator;

/**
 * Servlet implementation class ArticleAll
 * 把数据库中的文章存到request里面，然后跳转到显示文章列表的界面articleList.jsp
 * 在用户点进进入博客之后，一定会调用这里面的方法
 */
@WebServlet("/ArticleAll")
public class ArticleAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArticleAll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int atype = 0;
		if( request.getParameter("atype") != null )
			atype = Integer.parseInt( request.getParameter("atype") );
		ArticleDao articleDao = new	 ArticleDao();
		List<Article> list;
		if( atype == 0 )
			list = articleDao.getAllArticles();
		else list = articleDao.getArticleByType(atype);
		
		//根据访问量排序
		Collections.sort(list,new ArticleComparator());
		//System.out.println("asd");
		

		request.getSession().setAttribute("articleList", list);
		
		response.sendRedirect("articleList.jsp");
		
	//	request.getRequestDispatcher("articleList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
