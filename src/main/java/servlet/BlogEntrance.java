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
import bean.Category;
import dao.ArticleDao;
import dao.CategoryDao;
import util.ArticleComparator;
import util.CommonValue;

/**
 * blog的入口，以前名叫CategoryAll，
 * 查询了所有的category
 */
@WebServlet("/BlogEntrance")
public class BlogEntrance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlogEntrance() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int atype = 0;
		if( request.getParameter("atype") != null ) {
			atype = Integer.parseInt( request.getParameter("atype") );
		}

		int pageNum = 1;	//需要显示哪一页
		if ( request.getParameter("pageNum") != null ) {
			pageNum = Integer.parseInt( request.getParameter("pageNum") );
		}


		CategoryDao categoryDao = new CategoryDao();
		List<Category> list = categoryDao.getAllCategory();	//查询所有category
		ArticleDao articleDao = new ArticleDao();
		List<Article> rankList = articleDao.getTopByType(atype, CommonValue.topArticleSize);	//查询所有排名前4的文章


		long articleNum = articleDao.getArticleNumByType(atype);		//获取当前分类有多少文章

		//查询某一页的几篇文章， 值在CommonValue这个类里面
		List<Article> articleList = articleDao.getLimitedArticleList(atype,pageNum,CommonValue.articleNumpPerPage);

		Category categoryInfo = categoryDao.getCategoryByType(atype);	//获取该分类下的category信息

		request.getSession().setAttribute("articleNum",articleNum);	//文章数量，该分类下所有文章数量
		request.getSession().setAttribute("categoryList", list);		//文章的分类list，用于blog中navBar
		request.getSession().setAttribute("rankList", rankList);		//该分类下 排名前几的文章
		request.getSession().setAttribute("categoryInfo",categoryInfo);	//该分类下的category信息
		request.getSession().setAttribute("articleList", articleList);	//文章列表（已分页）

		/*再将这两个数据传回去，方便操作*/
		request.getSession().setAttribute("atype",atype);
		request.getSession().setAttribute("pageNum",pageNum);	//需要展示哪一页

		//response.sendRedirect("blogIndex.jsp?atype="+atype+"&pageNum="+pageNum);

		request.getRequestDispatcher("blogIndex.jsp?atype="+atype+"&pageNum="+pageNum).forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
