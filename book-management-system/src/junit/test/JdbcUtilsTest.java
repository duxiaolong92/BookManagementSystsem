package junit.test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import edu.jxsd.x3510.bean.Reader;
import edu.jxsd.x3510.dao.*;

import org.junit.Test;


public class JdbcUtilsTest {

	@Test
	public void test() throws Exception {
		Dbconnection dbc = new Dbconnection();
		ResultSet rs = null;
		try {
			String sql = "select * from reader_info where  readerPassword ='123456'";
			rs = dbc.executeQuery(sql);
			while(rs.next())
			{
				System.out.println(rs.getString("readerName"));
			}
			
		} finally {
			dbc.free(rs);
		}
	}

}
