package edu.jxsd.x3510.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

public final class Dbconnection {
	private static String url = "jdbc:sqlserver://localhost:1433;DatabaseName=BookManagementSystem";
	private static String user = "sa";
	private static String password = "123";
	private Connection conn = null;
    private Statement stmt = null;
	private ResultSet rs = null;
	public Dbconnection() {
	}

	static {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (ClassNotFoundException e) {
			throw new ExceptionInInitializerError(e);
		}
	}

	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(url, user, password);
	}

	public ResultSet executeQuery(String sql)
	  {
		  try {
			conn = DriverManager.getConnection(url,user,password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  return rs;
	  }
	  
	  
	  public int executeUpdate(String sql)
	  {
		  int result = 0;
		  try {
			conn = DriverManager.getConnection(url,user,password);
			stmt = conn.createStatement();
		    result = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  return result;	  
	  }
		public boolean closeRs(ResultSet rs){
			boolean bl=false;
			if(rs!=null)
				try {
					rs.close();
					bl=true;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}else
					bl=true;
			return bl;
			
		}
		
		public boolean closeRs(){
			boolean bl=false;
			if(rs!=null)
				try {
					rs.close();
					bl=true;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}else
					bl=true;
			return bl;
			
		}
		
		
		
		public boolean closeStmt(){
			boolean bl=false;
			if(stmt!=null)
				try {
					stmt.close();
					bl=true;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}else
					bl=true;
			return bl;
			
		}
		public boolean closeConn(){
			boolean bl=false;
			if(conn!=null)
				try {
					conn.close();
					bl=true;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}else
					bl=true;
			return bl;
			
		}	
		
		public void free(ResultSet rs){
			this.closeRs();
			this.closeRs(rs);
			this.closeConn();
			this.closeStmt();
		}
		public void free(){
			this.closeRs();
			this.closeConn();
			this.closeStmt();
		}
}
