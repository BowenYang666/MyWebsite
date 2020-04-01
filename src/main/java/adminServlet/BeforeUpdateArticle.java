package adminServlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Article;
import dao.ArticleDao;
import dao.CategoryDao;

/**
 * Servlet implementation class BeforeUpdateArticle
 */
@WebServlet("/BeforeUpdateArticle")
public class BeforeUpdateArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BeforeUpdateArticle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String aid = request.getParameter("aid");
		if ( aid ==null ) {
			System.out.println("null value --- from BeforeUpdateArticle.java line 32");
			return;
		}
		
		ArticleDao articleDao =  new ArticleDao();
		Article article = articleDao.getArticleById(aid);
		request.setAttribute("article", article);
		//获取所有文章

		//再获取所有分类
		CategoryDao dao = new CategoryDao();
		List<String> nameList = dao.getAllNames();
		nameList.remove(0);	//0为全部分类
		request.setAttribute("nameList", nameList);
		
		request.getRequestDispatcher("admin/updateArticle.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
