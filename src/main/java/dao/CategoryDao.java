package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import bean.Category;
import util.C3P0Util;

public class CategoryDao 
{
	static QueryRunner queryRunner = new QueryRunner( C3P0Util.getDataSource() );
	public List<String> getAllNames()
	{
		BeanListHandler<Category> handler = new BeanListHandler<Category>(Category.class);
		String sql = "select * from category";
		List<String> ansList = new ArrayList<String>();
		try {
			List<Category> list = queryRunner.query(sql, handler);

			for( Category c:list )
				ansList.add( c.getCname() );
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ansList;
		
	}
	public List<Category> getAllCategory()
	{
		BeanListHandler<Category> handler = new BeanListHandler<Category>(Category.class);
		String sql = "select * from category";
		
		try {
			List<Category> list = queryRunner.query(sql, handler);
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public Category getCategoryByType( int atype )
	{
		BeanHandler<Category> handler = new BeanHandler<Category>(Category.class);
		String sql = "select *from category where cid=?";
		
		try {
			Category category = queryRunner.query(sql, handler,atype);
			return category;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public String getCategoryNameByType( int atype )
	{
		String cname = this.getCategoryByType(atype).getCname();
		return cname;
	}

	public void addCategory(Category category){
		String sql = "INSERT INTO category " +
				" (`cid`, `cname`, `ccreationTime`, `cauthor`, `cpageView`, `cdescription`, `ctype`) VALUES " +
				" (?, ?, ? , ?, ?, ?, ?); ";
		Object params[] = { category.getCid(),category.getCname(),category.getCcreationTime()
							,category.getCauthor(), category.getCpageView(),category.getCdescription(),
							category.getCtype() };
		try {
			queryRunner.update(sql,params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
