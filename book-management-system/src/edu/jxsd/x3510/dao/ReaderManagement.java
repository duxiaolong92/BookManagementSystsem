package edu.jxsd.x3510.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;
import java.util.List;

import org.apache.catalina.connector.Request;



import edu.jxsd.x3510.bean.Admin;
import edu.jxsd.x3510.bean.Book;
import edu.jxsd.x3510.bean.BorrowBook;
import edu.jxsd.x3510.bean.Comment;
import edu.jxsd.x3510.bean.GiveBackBook;
import edu.jxsd.x3510.bean.Reader;
import edu.jxsd.x3510.bean.ReserveBook;
import edu.jxsd.x3510.dao.*;
import edu.jxsd.x3510.servlet.MailServlet.Email_Autherticator;

public class ReaderManagement {
	Dbconnection dbc = new Dbconnection();

	// 登录页面检查用户名和密码
	public Reader checkReader(String readerName, String readerPassword) {
		Reader reader = null;
		String sql = "";
		String truePassword = null;
		ResultSet rs = null;

		sql = "select * from reader_info where readerName ='" + readerName
				+ "'";

		rs = dbc.executeQuery(sql);
		try {
			while (rs.next()) {
				reader = new Reader();
				reader.setReaderID(Integer.parseInt(rs.getString("readerID")));
				truePassword = deciper(rs.getString("readerPassword"));
				reader.setReaderPassword(rs.getString("readerPassword"));
				reader.setReaderName(rs.getString("readerName"));
				reader.setAcademy(rs.getString("academy"));
				reader.setEmail(rs.getString("email"));
				reader.setClassName(rs.getString("className"));
				reader.setTel(rs.getString("tel"));
				reader.setSex(rs.getString("sex"));
				reader.setActivate(rs.getInt("activate"));
				break;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		dbc.free(rs);
		if (reader == null || reader.getActivate() == 0) {
			return null;
		}
		if (truePassword.equals(readerPassword)) {
			System.out.println(reader.getReaderPassword());
			return reader;
		} else {
			return null;
		}

	}

	// 注册页面检查用户名是否被注册
	public boolean checkReaderName(String readerName) throws SQLException {
		// TODO Auto-generated method stub
		Reader reader = null;
		String sql = "";
		ResultSet rs = null;
		sql = "select * from reader_info where readerName='" + readerName + "'";
		rs = dbc.executeQuery(sql);
		while (rs.next()) {
			reader = new Reader();
			reader.setReaderName(rs.getString("readerName"));
			break;
		}
		dbc.free(rs);
		if (reader != null) {
			return true;
		} else
			return false;
	}

	// 注册页面 检查email 是否被注册
	public boolean checkEmail(String email) throws SQLException {
		// TODO Auto-generated method stub
		Reader reader = null;
		String sql = "";
		ResultSet rs = null;
		sql = "select * from reader_info where email = '" + email + "'";
		rs = dbc.executeQuery(sql);
		while (rs.next()) {
			reader = new Reader();
			reader.setEmail(rs.getString("email"));
			break;
		}
		dbc.free(rs);
		if (reader != null) {
			return true;
		} else
			return false;
	}

	// 忘记密码后，通过email 找到reader
	public Reader checkEmailReset(String email) throws SQLException {
		// TODO Auto-generated method stub
		Reader reader = null;
		String sql = "";
		ResultSet rs = null;
		sql = "select * from reader_info where email = '" + email + "'";
		rs = dbc.executeQuery(sql);
		while (rs.next()) {
			reader = new Reader();
			reader.setEmail(rs.getString("email"));
			reader.setReaderName(rs.getString("readerName"));
			reader.setReaderID(rs.getInt("readerID"));
			break;
		}
		dbc.free(rs);
		return reader;
	}

	// 修改个人密码时通过传过来的readerID找到读者的信息
	public Reader checkReaderID(int readerID) throws SQLException {
		// TODO Auto-generated method stub
		Reader reader = null;
		String sql = "";
		ResultSet rs = null;
		sql = "select * from reader_info where readerID = " + readerID + "";
		rs = dbc.executeQuery(sql);
		while (rs.next()) {
			reader = new Reader();
			reader.setReaderName(rs.getString("readerName"));
			reader.setReaderID(rs.getInt("readerID"));
			reader.setAcademy(rs.getString("academy"));
			reader.setEmail(rs.getString("email"));
			reader.setSex(rs.getString("sex"));
			reader.setTel(rs.getString("tel"));
			reader.setClassName(rs.getString("className"));
			break;
		}
		dbc.free(rs);
		return reader;
	}

	// 通过邮箱验证activate

	public boolean readerActivate(Reader reader) {
		boolean bl = false;
		String sql = null;
		int result = 0;
		ResultSet rs = null;
		sql = "update reader_info set activate = " + reader.getActivate()
				+ " where email = '" + reader.getEmail() + "'";
		result = dbc.executeUpdate(sql);
		if (result != 0) {
			bl = true;
		}
		return bl;
	}

	// 取得当前借阅
	public ArrayList<BorrowBook> currentborrow(String readerName)
			throws SQLException {
		ArrayList<BorrowBook> borrowList = new ArrayList<BorrowBook>();
		String sql = "";
		ResultSet rs = null;
		sql = "select c.readerID,c.readerName,a.bookID, a.bookName,b.borrowTime,b.returnTime, a.readingRoomName from borrow_info b left join book_info  a  on a.bookID=b.bookID left join reader_info c on b.readerID=c.readerID where readerName='"
				+ readerName + "'";
		rs = dbc.executeQuery(sql);
		while (rs.next()) {
			BorrowBook borrowBook = new BorrowBook();
			borrowBook.setBookID(Integer.parseInt(rs.getString("bookID")));
			borrowBook.setBookName(rs.getString("bookName"));
			borrowBook.setBorrowTime(rs.getDate("borrowTime"));
			borrowBook.setReturnTime(rs.getDate("returnTime"));
			borrowBook.setReadingRoomName(rs.getString("readingRoomName"));
			borrowBook.setReaderID(rs.getString("readerID"));
			borrowList.add(borrowBook);
		}
		dbc.free(rs);
		return borrowList;
	}

	// 取得预约信息
	public ArrayList<ReserveBook> reserveBooks(String readerName) {
		ArrayList<ReserveBook> reserveList = new ArrayList<ReserveBook>();
		String sql = "";
		ResultSet rs = null;
		sql = "select a.readerName ,b.readerID,b.bookID,c.readingRoomName,c.bookName,b.reserveTime from reserve_info b  left join reader_info a on a.readerID=b.readerID left join book_info c on b.bookID=c.bookID where readerName='"
				+ readerName
				+ "'group by a.readerName,b.readerID,b.bookID,c.readingRoomName,c.bookName,b.reserveTime";
		rs = dbc.executeQuery(sql);
		System.out.print("+++++++++++++++++++++++++++");
		try {
			while (rs.next()) {
				ReserveBook reserveBook = new ReserveBook();
				reserveBook.setReaderID(Integer.parseInt(rs
						.getString("readerID")));
				reserveBook.setBookID(Integer.parseInt(rs.getString("bookID")));
				reserveBook.setBookName(rs.getString("bookName"));
				reserveBook.setReserveTime(rs.getString("reserveTime"));
				reserveBook.setReadingRoomName(rs.getString("readingRoomName"));
				reserveList.add(reserveBook);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbc.free(rs);
		return reserveList;

	}

	// 读者取得历史借阅
	public ArrayList<GiveBackBook> historyBorrow(String readerName) {
		ArrayList<GiveBackBook> giveBackList = new ArrayList<GiveBackBook>();
		String sql = "";
		sql = "select c.readerID,c.readerName,a.bookID,a.bookName,b.borrowTime,b.returnTime,a.readingRoomName from giveback_info b left join book_info a on a.bookID=b.bookID left join reader_info c on b.readerID=b.readerID  where readerName='"
				+ readerName
				+ "' group by c.readerID,c.readerName,a.bookID,a.bookName,b.borrowTime,b.returnTime,a.readingRoomName";
		ResultSet rs = null;
		rs = dbc.executeQuery(sql);

		try {
			while (rs.next()) {
				GiveBackBook giveBackBook = new GiveBackBook();
				giveBackBook
						.setBookID(Integer.parseInt(rs.getString("bookID")));
				giveBackBook.setBookName(rs.getString("bookName"));
				giveBackBook.setBorrowTime(rs.getDate("borrowTime"));
				giveBackBook.setReturnTime(rs.getDate("returnTime"));
				giveBackBook.setReadingRoomName(rs.getString("readingRoomName"));
				giveBackList.add(giveBackBook);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbc.free(rs);
		return giveBackList;
	}

	//管理员取得历史借阅
	public ArrayList<GiveBackBook> adminHistoryBorrow(String readerName) {
		ArrayList<GiveBackBook> giveBackList = new ArrayList<GiveBackBook>();
		String sql = "";
		sql = "select giveback_info.bookID,readerName,bookName,borrowTime,returnTime,fine " +
				"from giveback_info,reader_info,book_info " +
				"where giveback_info.readerID = reader_info.readerID and giveback_info.bookID = book_info.bookID and readerName = '"+readerName+"'";
		ResultSet rs = null;
		rs = dbc.executeQuery(sql);

		try {
			while (rs.next()) {
				GiveBackBook giveBackBook = new GiveBackBook();
				giveBackBook.setBookID(rs.getInt("bookID"));
				giveBackBook.setBookName(rs.getString("bookName"));
				giveBackBook.setBorrowTime(rs.getDate("borrowTime"));
				giveBackBook.setReturnTime(rs.getDate("returnTime"));
				giveBackBook.setReaderName(rs.getString("readerName"));
				giveBackBook.setFine(rs.getFloat("fine"));
				giveBackList.add(giveBackBook);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbc.free(rs);
		return giveBackList;
	}

	
	
	// 取得逾期罚款的书籍
	public ArrayList<GiveBackBook> fine(String readerName) {
		ArrayList<GiveBackBook> fineList = new ArrayList<GiveBackBook>();
		String sql = "";
		sql = "select a.bookID,b.bookName,b.author,a.borrowTime,a.returnTime,a.fine,c.readerName from giveback_info a left join book_info b on a.bookID=b.bookID left join reader_info c on a.readerID=c.readerID where fine !=null and readerName='"
				+ readerName + "'";
		ResultSet rs = null;
		rs = dbc.executeQuery(sql);
		try {
			while (rs.next()) {
				GiveBackBook fine = new GiveBackBook();
				fine.setBookID(Integer.parseInt(rs.getString("bookID")));
				fine.setBookName(rs.getString("bookName"));
				fine.setAuthor(rs.getString("author"));
				fine.setBorrowTime(rs.getDate("borrowTime"));
				fine.setReturnTime(rs.getDate("returnTime"));
				fine.setFine(rs.getFloat("fine"));
				fineList.add(fine);
			}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbc.free(rs);
		return fineList;
	}

	// 取得我的评论
	public ArrayList<Comment> myComments(String readerName) throws SQLException {
		ArrayList<Comment> commentList = new ArrayList<Comment>();
		String sql = "";
		sql = "select a.readerName,b.bookID,b.comment,b.commentTime,c.bookName,b.readerID from comment_info b left join reader_info a on a.readerID=b.readerID left join book_info c on  b.bookID=c.bookID where readerName='"
				+ readerName + "'";
		ResultSet rs = null;
		rs = dbc.executeQuery(sql);
		try {
			while (rs.next()) {
				Comment mycomment = new Comment();
				mycomment.setBookID(Integer.parseInt(rs.getString("bookID")));
				mycomment.setCommentTime(rs.getString("commentTime"));
				mycomment.setComment(rs.getString("comment"));
				mycomment.setBookName(rs.getString("bookName"));
				mycomment.setReaderID(rs.getInt("readerID"));
				commentList.add(mycomment);
			}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbc.free(rs);
		return commentList;
	}

	// 注册页面 往数据库写数据
	public boolean readerRegister(Reader reader) throws SQLException {
		boolean bl = false;
		ResultSet rs = null;
		int max = 0;

		String passwordEncryption = "";
		passwordEncryption = passwordEncryption(reader.getReaderPassword());
		String sql = "";

		sql = "select top 1 readerID from reader_info order by readerID desc ";
		rs = dbc.executeQuery(sql);
		try {
			if (!rs.next()) {
				max = 10000;
			} else {
				rs = dbc.executeQuery(sql);
				while (rs.next()) {
					max = rs.getInt("readerID");
					max++;

				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sql = "insert into reader_info values(" + max + ",'"
				+ reader.getReaderName() + "','" + passwordEncryption + "','"
				+ reader.getAcademy() + "','" + reader.getClassName() + "','"
				+ reader.getTel() + "','" + reader.getEmail() + "','"
				+ reader.getSex() + "'," + reader.getActivate() + ")";
		System.out.println(sql);
		if (dbc.executeUpdate(sql) != 0) {
			bl = true;
		}
		dbc.free(rs);
		return bl;
	}

	public int getRecordSize() {
		int count = 0;
		String sql = "select count(*) as count from reader_info";
		ResultSet rs = null;
		rs = dbc.executeQuery(sql);
		try {
			while (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	public ArrayList <Reader> getFirstPage(int pageNow, int pageSize) {
		ArrayList <Reader> readList = new ArrayList <Reader> ();
		String sql = "";
		ResultSet rs = null;
		sql = "select top " + pageSize + " * from reader_info";
		rs = dbc.executeQuery(sql);
		try {
			while (rs.next()) {
				Reader read = new Reader();
				read.setReaderID(rs.getInt("readerID"));
				read.setReaderName(rs.getString("readerName"));
				read.setReaderPassword(rs.getString("readerPassword"));
				read.setSex(rs.getString("sex"));
				read.setAcademy(rs.getString("academy"));
				read.setClassName(rs.getString("className"));
				read.setTel(rs.getString("tel"));
				read.setEmail(rs.getString("email"));
				readList.add(read);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return readList;
	}

	public List<Book> getAllReader() {
		// TODO Auto-generated method stub
		ArrayList readList = new ArrayList();
		String sql = "";
		ResultSet rs = null;
		sql = "select * from reader_info";
		rs = dbc.executeQuery(sql);
		try {
			while (rs.next()) {
				Reader read = new Reader();
				read.setReaderID(rs.getInt("readerID"));
				read.setReaderName(rs.getString("readerName"));
				read.setReaderPassword(rs.getString("readerPassword"));
				read.setSex(rs.getString("sex"));
				read.setAcademy(rs.getString("academy"));
				read.setClassName(rs.getString("className"));
				read.setTel(rs.getString("tel"));
				read.setEmail(rs.getString("email"));
				// book.setSummargNote(rs.getString("summaryNote"));
				// book.setBookImage(rs.getString("bookImage"));
				readList.add(read);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return readList;
	}

	// 重置密码时 根据邮箱 来获取用户reader的值
	public Reader resetPassword(String email) {
		Reader reader = null;
		String sql = "";
		ResultSet rs = null;
		sql = "select * from reader_info where email ='" + email + "' ";
		rs = dbc.executeQuery(sql);
		try {
			while (rs.next()) {
				reader = new Reader();
				System.out.println(reader.getReaderID());
				reader.setReaderName(rs.getString("readerName"));
				reader.setEmail(rs.getString("email"));
				break;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbc.free(rs);
		return reader;
	}

	// 忘记密码后 重置密码
	public void resetForm(Reader reader) {
		String sql = "";
		String passwordEncryption = "";
		passwordEncryption = passwordEncryption(reader.getReaderPassword());
		ResultSet rs = null;
		int result;
		sql = "update reader_info set readerPassword = '" + passwordEncryption
				+ "' where readerID = " + reader.getReaderID() + " ";
		System.out.println(sql);
		result = dbc.executeUpdate(sql);
		dbc.free(rs);
	}

	// 给一段字符串加密（加密规则为：根据字符串的长度随机生成两端相同长度的字符串，然后再根据ASCII码进行字符转换）
	public static String passwordEncryption(String password) {
		Random random = new Random();
		String passwordEncryption = "";
		int length = 0;
		int i = 0;
		int randomNum1[];// 随机数1
		int randomNum2[];// 随机数2
		int passwordInt[];// 用来保存转换密码后的ASCII码
		length = password.length();// 密码的长度
		randomNum1 = new int[length];
		randomNum2 = new int[length];
		passwordInt = new int[length * 3];
		for (i = 0; i < length; i++) {
			passwordInt[i] = password.charAt(i);
			randomNum1[i] = random.nextInt(10);
			randomNum2[i] = random.nextInt(10);
			passwordInt[i] = passwordInt[i] - randomNum1[i];
			if (passwordInt[i] == 38 || passwordInt[i] == 39) {
				passwordInt[i] = passwordInt[i] + randomNum1[i];
				randomNum1[i] = random.nextInt(10);
				passwordInt[i] = passwordInt[i] - randomNum1[i];
			}
			passwordInt[i] = passwordInt[i] - randomNum2[i];
			if (passwordInt[i] == 38 || passwordInt[i] == 39) {
				passwordInt[i] = passwordInt[i] + randomNum2[i];
				randomNum2[i] = random.nextInt(10);
				passwordInt[i] = passwordInt[i] - randomNum2[i];
			}
			passwordInt[i + length] = randomNum1[i] + 97;
			passwordInt[i + length * 2] = randomNum2[i] + 65;
			// System.out.println(a[i]);
		}
		for (i = 0; i < length * 3; i++) {
			System.out.println(passwordInt[i]);
			passwordEncryption += (char) passwordInt[i];
		}
		return passwordEncryption;
	}

	// 给一段字符串解密
	public static String deciper(String passwordEncryption) {
		String truePassword = "";
		int password[];
		int deciperNum1[];
		int deciperNum2[];
		int length = passwordEncryption.length() / 3;
		password = new int[length];
		deciperNum1 = new int[length];
		deciperNum2 = new int[length];
		for (int j = 0; j < length; j++) {
			password[j] = passwordEncryption.charAt(j);
			deciperNum1[j] = passwordEncryption.charAt(j + length) - 97;
			deciperNum2[j] = passwordEncryption.charAt(j + length * 2) - 65;
			password[j] = password[j] + deciperNum2[j] + deciperNum1[j];
			truePassword += (char) password[j];
		}
		return truePassword;
	}

	public ArrayList getCurrentPageReaders(int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		ArrayList readList = new ArrayList();
		String sql = "";
		ResultSet rs = null;
		System.out.println(pageNow);
		sql = "select top " + pageSize
				+ " * from reader_info where readerID not in " + "("
				+ " select top " + (pageNow - 1) * pageSize + " readerID "
				+ "from reader_info)";
		System.out.println(sql);
		rs = dbc.executeQuery(sql);
		try {
			while (rs.next()) {
				Reader read = new Reader();
				read.setReaderID(rs.getInt("readerID"));
				read.setReaderName(rs.getString("readerName"));
				read.setReaderPassword(rs.getString("readerPassword"));
				read.setSex(rs.getString("sex"));
				read.setAcademy(rs.getString("academy"));
				read.setClassName(rs.getString("className"));
				read.setTel(rs.getString("tel"));
				read.setEmail(rs.getString("email"));
				// book.setSummargNote(rs.getString("summaryNote"));
				// book.setBookImage(rs.getString("bookImage"));
				readList.add(read);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return readList;
	}

	public boolean readerDeleteByID(int readerID) {
		// TODO Auto-generated method stub
		boolean bl = false;
		String sql = "delete from reader_info where readerID=" + readerID;
		if (dbc.executeUpdate(sql) != 0) {
			bl = true;
		}
		return bl;
	}

	public Admin checkAdmin(String adminName, String password) {
		// TODO Auto-generated method stub
		Admin admin = null;
		String sql = "";
		String truePassword = null;
		ResultSet rs = null;

		sql = "select * from admin_info where adminName ='" + adminName + "'";

		rs = dbc.executeQuery(sql);
		try {
			while (rs.next()) {
				admin = new Admin();
				admin.setAdminId(Integer.parseInt(rs.getString("adminID")));
				truePassword = deciper(rs.getString("password"));
				admin.setPassword(rs.getString("password"));
				admin.setAdminName(rs.getString("adminName"));
				break;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		dbc.free(rs);
		if (admin == null) {
			return null;
		}
		if (truePassword.equals(password)) {
			System.out.println(admin.getPassword());
			return admin;
		} else {
			return null;
		}
	}

	public boolean resetTel(Reader reader) {
		boolean bl = false;
		String sql = "";
		sql = "update reader_info set tel='" + reader.getTel()
				+ "' where email='" + reader.getEmail() + "'";
		if (dbc.executeUpdate(sql) != 0) {
			bl = true;
		}
		return bl;
	}

	public boolean delCheckedReader(String str) {
		boolean bl = false;
		String sql = "delete from reader_info where readerID in (" + str + ")";
		if (dbc.executeUpdate(sql) != 0) {
			bl = true;
		}
		return bl;
	}

	public Reader ToReader(String adminName) {//将管理员（Admin）的身份转化为用户（Reader）
		Reader reader = null;
		String sql = "";
		String truePassword = null;
		ResultSet rs = null;
		sql = "select * from reader_info where readerName ='" + adminName + "'";
		rs = dbc.executeQuery(sql);
		try {
			while (rs.next()) {
				reader = new Reader();
				reader.setReaderID(Integer.parseInt(rs.getString("readerID")));
				truePassword = deciper(rs.getString("readerPassword"));
				reader.setReaderPassword(rs.getString("readerPassword"));
				reader.setReaderName(rs.getString("readerName"));
				reader.setAcademy(rs.getString("academy"));
				reader.setEmail(rs.getString("email"));
				reader.setClassName(rs.getString("className"));
				reader.setTel(rs.getString("tel"));
				reader.setSex(rs.getString("sex"));
				reader.setActivate(rs.getInt("activate"));
				break;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dbc.free(rs);
		if (reader == null || reader.getActivate() == 0) {
			return null;
		}
		return reader;
	}

	public boolean InsertBorrowInfo(int readerID, int bookID) {
		// TODO Auto-generated method stub
		boolean bl = false;
		BorrowBook borrow = null;
		ResultSet rs = null;
		int max = 0;
		String sql = null;
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String time = df.format(date);
		/*
		 * sql = "select top 1 bookID from book_info order by bookID desc"; rs =
		 * dbc.executeQuery(sql); try { if (!rs.next()) { max = 10000; } else {
		 * rs = dbc.executeQuery(sql); while (rs.next()) { max =
		 * rs.getInt("bookID"); max++;
		 * 
		 * } } } catch (SQLException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 */
		sql = "insert into borrow_info values('" + readerID + "','" + bookID
				+ "','" + time + "','" + time + "')";
		System.out.println(sql);
		if (dbc.executeUpdate(sql) != 0) {
			bl = true;
		}

		dbc.free(rs);
		return bl;
	}
	
	//根据readerID 获取读者所借图书的数目
	public int readerBorrowBook(int readerID){
		ResultSet rs = null;
		int bookNum = 0;
		String sql = "select count(*) bookNum from borrow_info where readerID="+readerID+"";
		System.out.println(sql);
		rs = dbc.executeQuery(sql);
		try {
			if(rs.next()){
				bookNum = rs.getInt("bookNum");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bookNum;
	}
	//根据bookID 判断该图书是否被预约
	public boolean booleanBookreserve(int bookID){
		boolean bl = false;
		ResultSet rs = null;
		String sql = "select * from reserve_info where bookID = "+bookID+"";
		rs = dbc.executeQuery(sql);
		try {
			if(rs.next()){
				bl = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bl;
	}

	public int getReaderID(String readerName) {
		// TODO Auto-generated method stub
		ResultSet rs = null;
		int readerID = 0;
		String sql = "select readerID from reader_info where readerName='"
				+ readerName + "'";
		rs = dbc.executeQuery(sql);
		try {
			while (rs.next()) {
				readerID = rs.getInt("readerID");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return readerID;
	}

	public boolean ReserveDeleteByID(int readerID, int bookID) {
		// TODO Auto-generated method stub
		boolean bl = false;
		String sql = "delete from reserve_info where readerID=" + readerID
				+ " and bookId=" + bookID + "";
		if (dbc.executeUpdate(sql) != 0) {
			bl = true;
		}
		return bl;
	}

	public int getGiveBackRecordSize() {
		// TODO Auto-generated method stub
		int count = 0;
		String sql = "select count(*) as count from giveback_info";
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

	public ArrayList<GiveBackBook> firstAdminHistoryBorrow(int pageNow,
			int pageSize) {
		// TODO Auto-generated method stub
		ArrayList <GiveBackBook> giveBackList = new ArrayList <GiveBackBook>();
		String sql = "";
		ResultSet rs = null;
		sql = "select top " + pageSize + " * from giveback_info";
		rs = dbc.executeQuery(sql);
		try {
			while (rs.next()) {
				GiveBackBook giveBackBook = new GiveBackBook();
				giveBackBook.setBookName(rs.getString("bookID"));
				giveBackBook.setBorrowTime(rs.getDate("borrowTime"));
				giveBackBook.setReturnTime(rs.getDate("returnTime"));
				giveBackBook.setReaderName(rs.getString("readerID"));
				giveBackBook.setFine(rs.getFloat("fine"));
				giveBackList.add(giveBackBook);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbc.free(rs);
		return giveBackList;
		
	}
}

/*
 * public BorrowBook getReaderBorrowInfo(String readerID) { // TODO
 * Auto-generated method stub BorrowBook borrow=null; String sql = ""; ResultSet
 * rs = null; sql ="select * from borrow_info where readerID ='"+ readerID+"'";
 * rs = dbc.executeQuery(sql); try { while (rs.next()) { borrow = new
 * BorrowBook(); borrow.setBookID(Integer.parseInt(rs.getString("bookID")));
 * borrow.setReaderID(rs.getString("readerID"));
 * borrow.setBookName(rs.getString("bookName"));
 * borrow.setBorrowTime(rs.getDate("borrowTime"));
 * borrow.setReturnTime(rs.getDate("returnTime"));
 * borrow.setReadingRoomName(rs.getString("readingRoomName")); break; } } catch
 * (SQLException e) { // TODO Auto-generated catch block e.printStackTrace(); }
 * 
 * dbc.free(rs); return borrow; }
 * 
 * }
 */

