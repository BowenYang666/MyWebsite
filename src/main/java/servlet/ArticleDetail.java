package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Article;
import bean.Category;
import bean.Review;
import dao.ArticleDao;
import dao.CategoryDao;
import dao.ReviewDao;
import util.CommonValue;

/**
 * Servlet implementation class ArticleDetail
 */
@WebServlet("/ArticleDetail")
public class ArticleDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArticleDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String aid = request.getParameter("aid");
		
		ArticleDao dao = new ArticleDao();
		Article article = dao.getArticleById(aid);

		CategoryDao categoryDao = new CategoryDao();
		Category category = categoryDao.getCategoryByType(article.getAtype());


		//System.out.println(article.getAtpye() );
		List<Article> recommendList = dao.getTopByType( article.getAtype(), CommonValue.topArticleSize);	//相关推荐文章
		//System.out.println(recommendList.size() );
		request.setAttribute("recommendList", recommendList);

		ReviewDao reviewDao = new ReviewDao();
		List<Review> list = reviewDao.getReviewListById(aid);

		request.setAttribute("category",category);	//显示本分类的一些信息
		request.setAttribute("article", article);	//为显示文章做准备
		request.setAttribute("reviewList", list); 				//为显示评论做准备
		
		//文章浏览量+1
		dao.addPageView(1, aid);
		
		request.getRequestDispatcher("showArticle.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
