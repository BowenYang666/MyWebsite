package servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ArticleDao;

/**
 * Servlet implementation class SetImgOneClick
 */
@WebServlet("/SetImgOneClick")
public class SetImgOneClick extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetImgOneClick() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String realPath = request.getSession().getServletContext().getRealPath("img/article");
		//System.out.println(realPath);
		File file = new File( realPath );
		File files[] = file.listFiles();
		List<String> nameList = new ArrayList<String>();
		
		for( File img:files )
		{
			String fileName = img.getName();
			if( fileName.endsWith("jpg") || fileName.endsWith("jpeg") )
			{	
				//System.out.println(img.getName() );
				nameList.add("img/article/"+fileName);
			}
		}
		ArticleDao dao = new ArticleDao();
		dao.setAllImgRandomly(nameList);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
