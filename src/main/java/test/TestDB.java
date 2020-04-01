package test;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;


import bean.Article;
import bean.Review;
import dao.ArticleDao;
import dao.CategoryDao;
import dao.ReviewDao;
import dao.UserDao;
import util.ArticleComparator;
import util.C3P0Util;
import util.ImgUtil;


public class TestDB {

	static QueryRunner queryRunner = new QueryRunner( C3P0Util.getDataSource() );
	
	//main函数
	public static void main(String[] args) {
		
		for( int i = 1 ; i <= 10 ; i++ ){
			String name = ImgUtil.getRandomImgName();
			System.out.println(name);
		}
		
	}
	static void test2()
	{
		BeanListHandler<Article> handler = new BeanListHandler<Article>(Article.class);
		String sql = "select * from article where aid = 1;";
		
		try {
			List<Article> list = queryRunner.query(sql, handler);
			System.out.println( list.get(0).getPassageContent() );
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
	private static void test1() {
		BeanHandler<Article> handler = new BeanHandler<Article>(Article.class);
		String sql = "select * from article where aid = ?";
		Object parameters[] = {1};
		
		try {
			Article article = queryRunner.query(sql, handler,parameters);
			
			System.out.println(article.getPassageContent() );
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//return null;
		}
	}

}
