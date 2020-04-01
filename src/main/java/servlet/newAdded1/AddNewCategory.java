package servlet.newAdded1;

import bean.Category;
import dao.ArticleDao;
import dao.CategoryDao;
import util.TimeUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 添加一个新的分类
 * from adminIndex.jsp 过来
 */
@WebServlet("/AddNewCategory")
public class AddNewCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNewCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf8");

		String categoryName = request.getParameter("categoryName");
		String description = request.getParameter("description");
		if ( categoryName == null || description == null || categoryName.isEmpty() || description.isEmpty() ) {
			return;
		}
		CategoryDao categoryDao = new CategoryDao();
		int size = categoryDao.getAllCategory().size();
		//新category的 id 是size
		int newID = size;
		String author = "杨博文";
		Category category = new Category(String.valueOf(newID),categoryName,TimeUtil.getCurrentTime(),author,0,description,size);
		categoryDao.addCategory(category);		//将新的category信息添加到数据库
		request.getRequestDispatcher("BlogEntrance").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
