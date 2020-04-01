package servlet;

import java.io.IOException;
import java.util.Calendar;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;

import bean.Review;
import dao.ReviewDao;
import util.TimeUtil;

/**
 * Servlet implementation class SaveReview
 */
@WebServlet("/SaveReview")
public class SaveReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveReview() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		String names[]={"大王叫我来巡山","你好吗","66123","想你不知依林阿根廷",
//				"挪威的夜晚","程序猿","1024","Hello","Tim","蔡","一个人的寂寞","我很好"};
//		已转为 JavaScript生成，并传递到这里
		
		ReviewDao dao = new ReviewDao();
		
		String userName = request.getParameter("userName");
		String photoURL = request.getParameter("photoURL");
		
		
		String reviewContent = request.getParameter("review");
		String aid = request.getParameter("aid");
		int rid = dao.generateReviewId();
		String time = TimeUtil.getCurrentTime();	//获取时间
		
		Review review = new Review();
		review.setCommentatorName( userName );
		review.setHtmlCode(reviewContent);
		review.setPhotoURL(photoURL);
		review.setRtime(time);
		review.setThumbUp(0);
		review.setAid(aid);
		review.setRid(rid);
		
		dao.saveReview(review);		//把评论存到数据库
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}
