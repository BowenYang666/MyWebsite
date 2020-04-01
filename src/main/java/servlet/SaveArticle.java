package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Article;
import dao.ArticleDao;
import dao.CategoryDao;
import util.ImgUtil;
import util.TimeUtil;

/**
 * Servlet implementation class SaveArticle
 */
@WebServlet("/SaveArticle")
public class SaveArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveArticle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArticleDao dao = new ArticleDao();
		
		String aid = dao.generateArticleId();
		String title = request.getParameter("title");
		String aurl = ImgUtil.getRandomImgName();	//这里的随机有点问题， 如果新加了图片，里面的数字要改
		
		int atype = Integer.valueOf( request.getParameter("atype") );
		String description = request.getParameter("description");
		
		String author="杨博文";			//HTML界面中没有填写作者的地方
		String acreationTime = TimeUtil.getCurrentTime();
		int pageView = 0,thumbUp = 0;
		
		String content = request.getParameter("content");
		String cname = new CategoryDao().getCategoryNameByType(atype);

		String keywords = request.getParameter("keywords");
		
		Article article = new Article(aid, aurl, title,atype, description, author, acreationTime, pageView, thumbUp, content, cname,keywords);
		dao.saveAnArticle(article);
		//System.out.println(article);
		//此处不跳转，由ajax请求success后进行跳转
		//request.getRequestDispatcher("blogIndex.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
