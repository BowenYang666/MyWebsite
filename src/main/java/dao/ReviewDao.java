package dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import bean.Review;
import util.C3P0Util;

public class ReviewDao 
{
	static QueryRunner queryRunner = new QueryRunner( C3P0Util.getDataSource() );
	
	public List<Review> getReviewListById( String aid )
	{
		BeanListHandler<Review> handler = new BeanListHandler<Review>(Review.class);
		String sql = "select * from review where aid = ? ;";
		try {
			List<Review> list = queryRunner.query(sql, handler,aid);
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public void saveReview( Review review )
	{
		String sql = "insert into review values(?,?,?,?,?,?,?)";
		Object parameters[] = 
		{
			review.getRid(),review.getAid(),review.getPhotoURL(),review.getCommentatorName(),
			review.getHtmlCode(),review.getThumbUp(),review.getRtime()
		};
		try {
			queryRunner.update(sql,parameters);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int generateReviewId()
	{
		String sql = "select max(rid) from review;";
		ScalarHandler<Integer> handler = new ScalarHandler<Integer>();
		try {
			if( queryRunner.query(sql, handler) == null )
				return 0;
			int maxAid = queryRunner.query(sql, handler);
			
			return maxAid+1;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 999;
	}
	public void deleteAll()
	{
		String sql = "truncate table review;";
		
		try {
			queryRunner.update(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
