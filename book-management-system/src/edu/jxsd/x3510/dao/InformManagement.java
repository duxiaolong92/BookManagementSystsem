package edu.jxsd.x3510.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.catalina.connector.Request;

import edu.jxsd.x3510.bean.Book;
import edu.jxsd.x3510.bean.Comment;
import edu.jxsd.x3510.bean.Inform;

public class InformManagement {
	Dbconnection dbc = new Dbconnection();

	public ArrayList<Inform> getinform() throws SQLException {
		// TODO Auto-generated method stub
		ArrayList<Inform> informList=new ArrayList<Inform>();
		ResultSet rs=null;
		String sql="";
		sql="select top 5 * from inform_info where informType='通知公告'";
		System.out.println(sql);
		rs=dbc.executeQuery(sql);
		while(rs.next()){
			Inform inform = new Inform();
			inform.setInformID(rs.getInt("informID"));
			inform.setInformTime(rs.getString("informTime"));
			inform.setTitle(rs.getString("title"));
			inform.setInform(rs.getString("inform"));
			inform.setInformType(rs.getString("informType"));
			informList.add(inform);
		}
		dbc.free(rs);
		return informList;
	}

	public ArrayList<Inform> getsource() throws SQLException {
		// TODO Auto-generated method stub
		ArrayList<Inform> informList=new ArrayList<Inform>();
		ResultSet rs=null;
		String sql="";
		sql="select top 5 * from inform_info where informType='资源动态'";
		rs=dbc.executeQuery(sql);
		while(rs.next()){
			Inform inform = new Inform();
			inform.setInformID(rs.getInt("informID"));
			inform.setInformTime(rs.getString("informTime"));
			inform.setTitle(rs.getString("title"));
			inform.setInform(rs.getString("inform"));
			inform.setInformType(rs.getString("informType"));
			informList.add(inform);
		}
		dbc.free(rs);
		return informList;
	}

	public ArrayList<Inform> getnews() throws SQLException {
		// TODO Auto-generated method stub
		ArrayList<Inform> informList=new ArrayList<Inform>();
		ResultSet rs=null;
		String sql="";
		sql="select top 5 *from inform_info where informType='新闻'";
		rs=dbc.executeQuery(sql);
		while(rs.next()){
			Inform inform = new Inform();
			inform.setInformID(rs.getInt("informID"));
			inform.setInformTime(rs.getString("informTime"));
			inform.setTitle(rs.getString("title"));
			inform.setInform(rs.getString("inform"));
			inform.setInformType(rs.getString("informType"));
			informList.add(inform);
		}
		dbc.free(rs);
		return informList;
	}
//取得对应类型的通知的具体内容
	public Inform getinformContent(int informID) throws SQLException {
		// TODO Auto-generated method stub
		Inform inform=null;
		ResultSet rs=null;
		String sql="";
		sql="select * from inform_info where informID ="+informID ;
		rs=dbc.executeQuery(sql);
		while(rs.next()){
		    inform = new Inform();
			inform.setInformID(rs.getInt("informID"));
			inform.setInformTime(rs.getString("informTime"));
			inform.setTitle(rs.getString("title"));
			inform.setInformType(rs.getString("informType"));
			inform.setInform(rs.getString("inform"));
	        break;  	
		}
		dbc.free(rs);
		return inform;
	}
//取得对应类型的通知的通知总条数
	public int getInformRecord(String informType) {
		// TODO Auto-generated method stub
		int count = 0;
		String sql = "select count(*) as count from inform_info where informType='"+informType+"'";
		ResultSet rs = null;
		rs = dbc.executeQuery(sql);
		try {
			while (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
//取得对应的页码的对应的通知类型的通知列表的内容
		public ArrayList<Inform> getCurrentInform(int pageNow, int pageSize,String informType) {
			// TODO Auto-generated method stub
			ArrayList<Inform> informList = new ArrayList<Inform>();
			String sql = "";
			ResultSet rs = null;
			sql = "select top " + pageSize
					+ " * from inform_info where informID not in " + "("
					+ " select top " + (pageNow - 1) * pageSize + " informID "
					+ "from inform_info where informType='"+informType+"') and informType='"+informType+"'";
			rs = dbc.executeQuery(sql);
			try {
				while (rs.next()) {
					Inform inform = new Inform();
					inform.setInformID(rs.getInt("informID"));
					inform.setTitle(rs.getString("title"));
					inform.setInformTime(rs.getString("informTime"));
					inform.setInform(rs.getString("inform"));
					inform.setInformType(rs.getString("informType"));
					informList.add(inform);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return informList;
		}
//取得对应的通知类型的第一页的列表信息
		public ArrayList<Inform> getFirstInform(int pageNow, int pageSize,String informType) {
			// TODO Auto-generated method stub
				ArrayList<Inform> informList = new ArrayList<Inform>();
				String sql = "";
				ResultSet rs = null;
				sql = "select top " + pageSize + " * from inform_info where informType='"+informType+"'";
				rs = dbc.executeQuery(sql);
				try {
					while (rs.next()) {
						Inform inform = new Inform();
						inform.setInformID(rs.getInt("informID"));
						inform.setTitle(rs.getString("title"));
						inform.setInformTime(rs.getString("informTime"));
						inform.setInform(rs.getString("inform"));
						inform.setInformType(rs.getString("informType"));
						informList.add(inform);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return informList;

			}

		public boolean informAdd(Inform inform) {
			// TODO Auto-generated method stub
			boolean bl = false;
			ResultSet rs = null;
			int max = 0;
			String sql = null;
			sql = "select top 1 informID from inform_info order by informID desc";
			rs = dbc.executeQuery(sql);
			try {
				if (!rs.next()) {
					max = 10000;
				} else {
					rs = dbc.executeQuery(sql);
					while (rs.next()) {
						max = rs.getInt("informID");
						max++;

					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			sql = "insert into inform_info values('" + max + "','" + inform.getTitle()
					+ "','" + inform.getInformTime() + "','" + inform.getInform() + "','"
					+ inform.getInformType() + "')";
			System.out.println(sql);
			if (dbc.executeUpdate(sql) != 0) {
				bl = true;
			}
			dbc.free(rs);
			return bl;
		}

		public int getInformRecord() {
			// TODO Auto-generated method stub
			int count = 0;
			String sql = "select count(*) as count from inform_info";
			ResultSet rs = null;
			rs = dbc.executeQuery(sql);
			try {
				while (rs.next()) {
					count = rs.getInt("count");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return count;
		}

		public ArrayList getFirstInform(int pageNow, int pageSize) {
			// TODO Auto-generated method stub
			ArrayList informList = new ArrayList();
			String sql = "";
			ResultSet rs = null;
			sql = "select top " + pageSize + " * from inform_info";
			rs = dbc.executeQuery(sql);
			try {
				while (rs.next()) {
					Inform inform = new Inform();
					inform.setInformID(rs.getInt("informID"));
					inform.setTitle(rs.getString("title"));
					inform.setInformTime(rs.getString("informTime"));
					inform.setInform(rs.getString("inform"));
					inform.setInformType(rs.getString("informType"));
					informList.add(inform);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return informList;
		}

		public boolean informDeleteByID(int informID) {
			// TODO Auto-generated method stub
			boolean bl = false;
			String sql = "delete from inform_info where informID=" + informID;
			if (dbc.executeUpdate(sql) != 0) {
				bl = true;
			}
			return bl;
		}
		}
	

