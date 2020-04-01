package dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import util.C3P0Util;

public class UserDao {
	static QueryRunner queryRunner = new QueryRunner( C3P0Util.getDataSource() );
	
	public Long checkPassword(String userName,String password){
		
		String sql = "select count(*) from user where userName = ? and password = ? ";
		ScalarHandler<Long> handler = new ScalarHandler<Long>();
		
		try {
			Long ans =  queryRunner.query(sql, handler,userName,password);
			if (ans == 1) {
				return 1l;
			}
			return 0l;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0l;
	}
	
	public boolean judgeUserExist( String userName ){
	
		String sql = "select count(*) from user where userName = ?";
		ScalarHandler<Long> handler = new ScalarHandler<Long>();
		try {
			long num = queryRunner.query(sql, handler,userName);
			if ( num == 1 ) {
				return true;
			}
			return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public void addUser( String userName,String password ){
		
		String sql = "insert into user values(?,?)";
		try {
			queryRunner.update(sql,userName,password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
