package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import bean.Article;
import util.C3P0Util;
import util.TimeUtil;

public class ArticleDao 
{
	static QueryRunner queryRunner = new QueryRunner( C3P0Util.getDataSource() );
	
	//选择某一类型的article，返回值是list
	public List<Article> getArticleByType( int type )	
	{
		BeanListHandler<Article> handler = new BeanListHandler<Article>(Article.class);
		String sql = "select * from article where atype = ?";
		Object paramters[] = {type};
		
		try {
			List<Article> list = queryRunner.query(sql, handler,paramters);
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Article> getAllArticles()
	{
		BeanListHandler<Article> handler = new BeanListHandler<Article>(Article.class);
		String sql = "select * from article;";
		
		try {
			List<Article> list = queryRunner.query(sql, handler);
			return list;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	//选择某一类型排名靠前的文章，根据文章浏览量
	public List<Article> getTopByType( int atype,int size )
	{
		if ( atype == 0 )
			return this.dealTopforAtype0(size);

		BeanListHandler<Article> handler = new BeanListHandler<Article>(Article.class);
		String sql="select * from article where atype = ? order by apageView desc limit ?";
		try {
			List<Article> list = queryRunner.query(sql, handler,atype,size);
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	private List<Article> dealTopforAtype0( int size )	 //找到分类为全部的 top文章  服务于上一个方法
	{
		BeanListHandler<Article> handler = new BeanListHandler<Article>(Article.class);
		String sql="select * from article order by apageView desc limit ?";
		try {
			List<Article> t = queryRunner.query(sql, handler,size);
			return t;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	
	public Article getArticleById( String aid )
	{
		BeanHandler<Article> handler = new BeanHandler<Article>(Article.class);
		String sql = "select * from article where aid = ?";
		try {
			Article article = queryRunner.query(sql, handler,aid);
			return article;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public String generateArticleId()
	{
		String id = TimeUtil.getTimeIncludingMinute();
		id = id.replace(" ", "A");
		
		
		Random random = new Random();
		int add = random.nextInt(10);

		return id.concat( String.valueOf(add) );
		
	}
	public void saveAnArticle( Article article )
	{
		
		String sql = "insert into article values(?,?,?,?,?,?,?,?,?,?,?)";
		Object parameters[] =
		{
			article.getAid(),article.getaURL(),article.getAtitle(),article.getAtype(),
			article.getAdescription(),article.getAauthor(),article.getAcreationTime(),
			article.getApageView(),article.getAthumbUp(),article.getPassageContent(),article.getKeywords()
		};
		try {
			queryRunner.update(sql,parameters);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void setAllImgRandomly( List<String> nameList )
	{
		String sql = "select aid from article;";
		List<Object[]> list = null;
		List<String> idList = new ArrayList<String>();
		Random random = new Random();
		try {
			list = queryRunner.query(sql, new ArrayListHandler() );
			for( Object o[]:list )
			{
				String aid =  (String)o[0];
				idList.add(aid);
				//System.out.println(aid);
			}
			sql = "update article set aURL = ? where aid = ?;";
			for( String aid:idList )
			{
				int pos = random.nextInt(nameList.size() );
				queryRunner.update(sql,nameList.get(pos),aid);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void addPageView( int num,String aid )
	{
		ScalarHandler<Integer> handler = new ScalarHandler<Integer>();
		String sql = "select apageView from article where aid = ?;";
		
		try {
			int pageView = queryRunner.query(sql, handler,aid);
			pageView++;
			sql = "update article set apageView = ? where aid = ?;";
			queryRunner.update(sql,pageView,aid);
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void addThumbUp( int num,String aid )
	{
		ScalarHandler<Integer> handler = new ScalarHandler<Integer>();
		String sql = "select athumbUp from article where aid = ?;";
		
		try {
			int thumbUp = queryRunner.query(sql, handler,aid);
			thumbUp+=num;
			sql = "update article set athumbUp = ? where aid = ?;";
			queryRunner.update(sql,thumbUp,aid);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void changeAllID()
	{
		ReviewDao reviewDao = new ReviewDao();
		reviewDao.deleteAll();
		
		BeanListHandler<Article> handler = new BeanListHandler<Article>(Article.class);
		String sql = "select * from article;";
		
		try {
			List<Article> artileList = queryRunner.query(sql, handler);
			
			for( Article a:artileList )
			{
				String newID = this.getNewID( a.getAid() );
				sql = "update article set aid = ? where aid = ?;";
				
				queryRunner.update(sql,newID,a.getAid() );
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public String getNewID( String id )
	{
		id = id.replace("/", "A");
		id = id.replace(" ", "A");
		return id;
	}
	
	public void updateArticle(String title,String description,String content,int type,String aid){
		
		String sql="update article SET atitle = ?, adescription = ?, passageContent=? , atype=? "
				+ " WHERE aid = ? ;";
		Object params[] ={title,description,content,type,aid};
		try {
			queryRunner.update(sql,params);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public long getArticleNumByType(int type){
		String sql = "select count(aid) from article where atype=? ";
		ScalarHandler<Long> handler = new ScalarHandler<Long>();

		if( type == 0 ) {    //如果是全部分类，则sql语句不一样
			sql = "select count(aid) from article";
			long articleNum = 0;
			try {
				articleNum = queryRunner.query(sql, handler);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return articleNum;
		}
		//否则就是某一个分类
		try {
			long articleNum = queryRunner.query(sql, handler, type);
			return articleNum;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	//通过atype和pageNum来查询一页的文章,pageSize表示一页需要多少文章,pageNum表示当前需要显示哪一页
	public List<Article> getLimitedArticleList(int atype,int pageNum,int pageSize){
		if ( atype == 0 )		//如果是全部文章这个分类，sql语句不一样
			return this.processType0(pageNum,pageSize);

		int startIndex = (pageNum-1)*pageSize;
		String sql = "select * from article where atype = ? order by apageview desc , athumbup desc " +
				" limit ?,? ;";
		//这里选取了某个type中的几篇文章，按照访问量，点赞数降序排列

		BeanListHandler<Article> handler = new BeanListHandler<Article>(Article.class);
		try {
			List<Article> articleList = queryRunner.query(sql, handler, atype, startIndex, pageSize);
			return articleList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	//获取atype=0的一页文章,服务于上一个函数
	private List<Article> processType0(int pageNum,int pageSize){
		int startIndex = (pageNum-1)*pageSize;
		String sql = "select * from article order by apageview desc , athumbup desc " +
				" limit ?,? ;";
		//这里选取了某个type中的几篇文章，按照访问量降序排列

		BeanListHandler<Article> handler = new BeanListHandler<Article>(Article.class);
		try {
			List<Article> articleList = queryRunner.query(sql, handler, startIndex, pageSize);
			return articleList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	//删除一篇文章
	public void deleteArticleByAid(String aid){
		String sql = "DELETE FROM `mywebsite`.`article` WHERE (`aid` = ?); ";
		try {
			queryRunner.update(sql,aid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
