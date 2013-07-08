package edu.jxsd.x3510.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.swing.plaf.basic.BasicInternalFrameTitlePane.RestoreAction;

import edu.jxsd.x3510.bean.Book;
import edu.jxsd.x3510.bean.Comment;
import edu.jxsd.x3510.bean.Inform;
import edu.jxsd.x3510.bean.ReserveBook;

public class BookManagement {
	Dbconnection dbc = new Dbconnection();

	/*
	 * public static void main(String[] args) { BookManagement bm = new
	 * BookManagement(); String bookType = "文学"; ArrayList<Book> hotBookList;
	 * hotBookList = bm.getHotBookList(bookType);
	 * System.out.println(hotBookList.get(0).getBookName());
	 * System.out.println(hotBookList.get(0).getISBN());
	 * 
	 * }
	 */

	// 根据 存入时间 来获取 最新图书
	public ArrayList<Book> getNewBookList() {
		ArrayList<Book> newBookList = new ArrayList<Book>();

		ResultSet rs = null;
		String sql = "select top 50 a.bookID,a.ISBN,a.bookName,a.press,a.bookTypeName,a.readingRoomName,count(b.bookID) as borrowedTimes  "
				+ "from book_info a  left join giveback_info b on a.bookID = b.bookID group by a.bookID,a.ISBN,a.bookName,a.press,a.bookTypeName,a.readingRoomName ,a.storageTime "
				+ "order by a.storageTime desc ";
		rs = dbc.executeQuery(sql);
		try {
			while (rs.next()) {
				Book book = new Book();
				book.setBookID(Integer.parseInt(rs.getString("bookID")));
				book.setISBN(rs.getString("ISBN"));
				book.setBookName(rs.getString("bookName"));
				book.setPress(rs.getString("press"));
				book.setBookTypeName(rs.getString("bookTypeName"));
				book.setReadingRoomName(rs.getString("readingRoomName"));
				book.setBorrowedTimes(Integer.parseInt(rs
						.getString("borrowedTimes")));
				newBookList.add(book);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbc.free(rs);
		return newBookList;
	}

	// 根据总体的借阅次数 来排序
	public ArrayList<Book> getAllHotBookList() {
		ArrayList<Book> allHotBookList = new ArrayList<Book>();
		ResultSet rs = null;
		String sql = "select top 28 CONVERT(NVARCHAR(255),a.summaryNote , 112) as summaryNote, a.author,a.bookImage,a.bookID,a.ISBN,a.bookName,a.press,a.bookTypeName,a.readingRoomName,a.storageTime,count(b.bookID) as borrowedTimes  "
				+ "from book_info a  left join giveback_info b on a.bookID = b.bookID group by CONVERT(NVARCHAR(255),a.summaryNote , 112),a.author,a.bookImage,a.bookID,a.ISBN,a.bookName,a.press,a.bookTypeName,a.readingRoomName ,a.storageTime "
				+ "order by borrowedTimes  desc ";

		rs = dbc.executeQuery(sql);
		try {
			while (rs.next()) {
				Book book = new Book();
				book.setBookID(Integer.parseInt(rs.getString("bookID")));
				book.setISBN(rs.getString("ISBN"));
				book.setBookName(rs.getString("bookName"));
				book.setPress(rs.getString("press"));
				book.setBookTypeName(rs.getString("bookTypeName"));
				book.setReadingRoomName(rs.getString("readingRoomName"));
				book.setBorrowedTimes(Integer.parseInt(rs
						.getString("borrowedTimes")));
				book.setSummargNote(rs.getString("summaryNote"));
				book.setAuthor(rs.getString("author"));
				allHotBookList.add(book);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbc.free(rs);
		return allHotBookList;
	}

	// 根据 图书类型 来获取 热门图书 借阅次数最少为1 此 的书 才会显示
	public ArrayList<Book> getHotBookList(String bookType) {
		ArrayList<Book> hotBookList = new ArrayList<Book>();
		ResultSet rs = null;
		String sql = "select top 28 CONVERT(NVARCHAR(255),a.summaryNote , 112) as summaryNote,a.bookID,a.price,a.ISBN,a.bookName,a.author,a.bookImage,a.press,a.bookTypeName,a.readingRoomName,count(b.bookID) as borrowedTimes "
				+ "from book_info a  left join giveback_info b on a.bookID = b.bookID group by CONVERT(NVARCHAR(255),a.summaryNote , 112),a.bookID,a.ISBN,a.author,a.bookImage,a.price,a.bookName,a.press,a.bookTypeName,a.readingRoomName "
				+ "having a.bookTypeName = '"
				+ bookType
				+ "'order by borrowedTimes desc";
		rs = dbc.executeQuery(sql);
		try {
			while (rs.next()) {
				Book book = new Book();
				book.setBookID(Integer.parseInt(rs.getString("bookID")));
				book.setISBN(rs.getString("ISBN"));
				book.setBookName(rs.getString("bookName"));
				book.setPress(rs.getString("press"));
				book.setBookTypeName(rs.getString("bookTypeName"));
				book.setReadingRoomName(rs.getString("readingRoomName"));
				book.setBorrowedTimes(Integer.parseInt(rs
						.getString("borrowedTimes")));
				book.setPrice(rs.getFloat("price"));
				book.setSummargNote(rs.getString("summaryNote"));
				book.setBookImage(rs.getString("bookImage"));
				book.setAuthor(rs.getString("author"));
				hotBookList.add(book);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbc.free(rs);
		return hotBookList;
	}

	public Book getBookById(int bookID) {// 通过ID获得书的信息
		Book book = null;
		String sql = "";
		ResultSet rs = null;
		sql = "select * from book_info where bookID=" + bookID;
		rs = dbc.executeQuery(sql);
		try {
			while (rs.next()) {
				book = new Book();
				book.setBookID(rs.getInt("bookID"));
				book.setISBN(rs.getString("ISBN"));
				book.setBookName(rs.getString("bookName"));
				book.setPress(rs.getString("press"));
				book.setAuthor(rs.getString("author"));
				book.setPrice(rs.getFloat("price"));
				book.setStorageTime(rs.getString("storageTime"));
				book.setBookTypeName(rs.getString("bookTypeName"));
				book.setReadingRoomName(rs.getString("readingRoomName"));
				book.setSummargNote(rs.getString("summaryNote"));
				book.setBookImage(rs.getString("bookImage"));
				break;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbc.closeRs();
		dbc.closeStmt();
		dbc.closeConn();
		return book;
	}

	public ArrayList getAllBook() {// 获得所有图书信息
		// TODO Auto-generated method stub
		ArrayList bookList = new ArrayList();
		String sql = "";
		ResultSet rs = null;
		sql = "select * from book_info";
		rs = dbc.executeQuery(sql);
		try {
			while (rs.next()) {
				Book book = new Book();
				book.setISBN(rs.getString("ISBN"));
				book.setBookName(rs.getString("bookName"));
				book.setPress(rs.getString("press"));
				book.setAuthor(rs.getString("author"));
				book.setPrice(rs.getFloat("price"));
				book.setStorageTime(rs.getString("storageTime"));
				book.setBookTypeName(rs.getString("bookTypeName"));
				book.setReadingRoomName(rs.getString("readingRoomName"));
				// book.setSummargNote(rs.getString("summaryNote"));
				// book.setBookImage(rs.getString("bookImage"));
				book.setBookID(rs.getInt("bookID"));
				bookList.add(book);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bookList;
	}

	// 根据ISBN判断图书是否存在
	public boolean checkBookByISBN(String ISBN) {
		boolean bl = false;
		ResultSet rs = null;
		String sql = null;
		sql = "select * from book_info where ISBN = " + ISBN + "";
		rs = dbc.executeQuery(sql);
		try {
			if (rs.next()) {
				bl = false;
			} else {
				bl = true;
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return bl;
	}

	public boolean bookAdd(Book book) {// 增加图书信息
		// TODO Auto-generated method stub
		boolean bl = false;
		ResultSet rs = null;
		int max = 0;
		String sql = null;
		sql = "select top 1 bookID from book_info order by bookID desc";
		rs = dbc.executeQuery(sql);
		try {
			if (!rs.next()) {
				max = 10000;
			} else {
				rs = dbc.executeQuery(sql);
				while (rs.next()) {
					max = rs.getInt("bookID");
					max++;

				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sql = "insert into book_info values('" + max + "','" + book.getISBN()
				+ "','" + book.getBookName() + "','" + book.getAuthor() + "','"
				+ book.getPress() + "','" + book.getPrice() + "','"
				+ book.getStorageTime() + "','" + book.getBookTypeName()
				+ "','" + book.getReadingRoomName() + "','"
				+ book.getSummargNote() + "','" + book.getBookImage() + "')";
		System.out.println(sql);
		if (dbc.executeUpdate(sql) != 0) {
			bl = true;
		}
		dbc.free(rs);
		return bl;
	}

	public boolean bookDeleteByID(int bookID) {// 通过ID删除图书
		// TODO Auto-generated method stub
		boolean bl = false;
		 int rs; 
		String sql = "delete from book_info where bookID=" + bookID;
/*		String nsql = "update book_info set bookID=bookID-1 where bookID>"
				+ bookID;*/
		/* rs=dbc.executeUpdate(nsql); */
		if (dbc.executeUpdate(sql) != 0) {
			bl = true;
		}
		return bl;
	}

	public boolean bookModify(Book book, String str) {
		// TODO Auto-generated method stub
		boolean bl = false;
		String sql = "";
		sql = "update book_info set ISBN='" + book.getISBN() + "', bookName='"
				+ book.getBookName() + "',press='" + book.getPress()
				+ "', author='" + book.getAuthor() + "',price="
				+ book.getPrice() + ",storageTime='" + str + "',bookTypeName='"
				+ book.getBookTypeName() + "',readingRoomName='"
				+ book.getReadingRoomName() + "' where bookID="
				+ book.getBookID();
		System.out.println(sql);
		if (dbc.executeUpdate(sql) != 0) {
			bl = true;
		}
		System.out.println(bl);
		return bl;
	}

	public int getRecordSize() {
		// TODO Auto-generated method stub
		int count = 0;
		String sql = "select count(*) as count from book_info";
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

	public ArrayList getFirstPage(int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		ArrayList bookList = new ArrayList();
		String sql = "";
		ResultSet rs = null;
		sql = "select top " + pageSize + " * from book_info";
		rs = dbc.executeQuery(sql);
		try {
			while (rs.next()) {
				Book book = new Book();
				book.setBookID(rs.getInt("bookID"));
				book.setISBN(rs.getString("ISBN"));
				book.setBookName(rs.getString("bookName"));
				book.setPress(rs.getString("press"));
				book.setAuthor(rs.getString("author"));
				book.setPrice(rs.getFloat("price"));
				book.setStorageTime(rs.getString("storageTime"));
				book.setBookTypeName(rs.getString("bookTypeName"));
				book.setReadingRoomName(rs.getString("readingRoomName"));
				// book.setSummargNote(rs.getString("summaryNote"));
				// book.setBookImage(rs.getString("bookImage"));
				bookList.add(book);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bookList;

	}

	public ArrayList getCurrentPageBooks(int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		ArrayList bookList = new ArrayList();
		String sql = "";
		ResultSet rs = null;
		sql = "select top " + pageSize
				+ " * from book_info where bookID not in " + "("
				+ " select top " + (pageNow - 1) * pageSize + " bookID "
				+ "from book_info)";
		// System.out.println(sql);
		rs = dbc.executeQuery(sql);
		try {
			while (rs.next()) {
				Book book = new Book();
				book.setBookID(rs.getInt("bookID"));
				book.setISBN(rs.getString("ISBN"));
				book.setBookName(rs.getString("bookName"));
				book.setPress(rs.getString("press"));
				book.setAuthor(rs.getString("author"));
				book.setPrice(rs.getFloat("price"));
				book.setStorageTime(rs.getString("storageTime"));
				book.setBookTypeName(rs.getString("bookTypeName"));
				book.setReadingRoomName(rs.getString("readingRoomName"));
				// book.setSummargNote(rs.getString("summaryNote"));
				// book.setBookImage(rs.getString("bookImage"));
				bookList.add(book);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bookList;
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

	public ArrayList getCurrentInform(int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		ArrayList informList = new ArrayList();
		String sql = "";
		ResultSet rs = null;
		sql = "select top " + pageSize
				+ " * from inform_info where informID not in " + "("
				+ " select top " + (pageNow - 1) * pageSize + " informID "
				+ "from inform_info)";
		// System.out.println(sql);
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

	public List<Inform> getAllInform() {
		// TODO Auto-generated method stub
		ArrayList<Inform> informList = new ArrayList();
		String sql = "";
		ResultSet rs = null;
		sql = "select * from inform_info";
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
	
	//读者给图书评论
	public boolean bookComment(Comment comment){
		boolean bl = false;
		String sql = null;
		int result = 0;
		sql = "insert comment_info values("+comment.getReaderID()+","+comment.getBookID()+",'"+comment.getComment()+"','"+comment.getCommentTime()+"')";
		System.out.println(sql);
		result = dbc.executeUpdate(sql);
		if(result == 0){
			bl = false;
		}else{
			bl = true;
		}
		dbc.free();
		return bl;
	}
	
	//删除评论 
	public boolean delBookComment(int readerID,int bookID){
		boolean bl = false;
		String sql = null;
		int result = 0;
		sql = "delete from comment_info where readerID="+readerID+" and bookID = "+bookID+"";
		System.out.println(sql);
		result = dbc.executeUpdate(sql);
		if(result == 0){
			bl = false;
		}else{
			bl = true;
		}
		dbc.free();
		return bl;
	}
	
	//根据图书ID和读者ID获得读者自己的评论
	public Comment getReaderComment(int bookID,int readerID){
		Comment comment = null;
		String sql = null;
		sql = "select  comment_info.readerID,comment,reader_info.readerName as readerName,comment_info.bookID,book_info.bookName as bookName,commentTime from comment_info,book_info,reader_info where comment_info.bookID = book_info.bookID and comment_info.readerID = reader_info.readerID and comment_info.bookID="+bookID+" and comment_info.readerID = "+readerID+"";
		ResultSet rs = null;
		rs = dbc.executeQuery(sql);
		try {
			while (rs.next()) {
				comment = new Comment();
				comment.setBookID(rs.getInt("bookID"));
				comment.setReaderID(rs.getInt("readerID"));
				comment.setComment(rs.getString("comment"));
				comment.setCommentTime(rs.getString("commentTime"));
				comment.setBookName(rs.getString("bookName"));
				comment.setReaderName(rs.getString("readerName"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return comment;
	}
	
	//根据作者 和 图书类型 获取 相关 借阅
	public String[] getRelateBook(int bookID){
		BookManagement bm = new BookManagement();
		Book book = null;
		book = bm.getBookById(bookID);
		String author = book.getAuthor().substring(0, 1);
		String bookType = book.getBookTypeName();
		String[] relateBookName = new String[16];//单数放bookID 偶数放bookName
		int SIZE = 8;
		int i = 0;
		String sql = null;	
		sql = "select top 8 bookName,bookID from book_info where summaryNote like '%"+author+"%' ";	ResultSet rs = null;
		rs = dbc.executeQuery(sql);
		try {
			while (rs.next()) {
				if(i < 16){
					relateBookName[i++] = rs.getString("bookID"); 
					relateBookName[i++] = rs.getString("bookName"); 
				}else{
					break;
				}
			}
			if(i < 16){
				sql = "select bookName,bookID from book_info where bookTypeName = '"+bookType+"'";
				rs = dbc.executeQuery(sql);
				while (rs.next()) {
					if(i < 16){
						relateBookName[i++] = rs.getString("bookID"); 
						relateBookName[i++] = rs.getString("bookName"); 
					}else{
						break;
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return relateBookName;
	}
	
	//根据图书ID获得 图书的评论
	public ArrayList<Comment> getBookComment(int bookID){
		ArrayList<Comment> bookAllComment = new ArrayList<Comment>();
		String sql = null;
		sql = "select  comment_info.readerID,comment,reader_info.readerName as readerName,comment_info.bookID,book_info.bookName as bookName,commentTime from comment_info,book_info,reader_info where comment_info.bookID = book_info.bookID and comment_info.readerID = reader_info.readerID and comment_info.bookID="+bookID+"";
		ResultSet rs = null;
		rs = dbc.executeQuery(sql);
		try {
			while (rs.next()) {
				Comment comment = new Comment();
				comment.setBookID(rs.getInt("bookID"));
				comment.setReaderID(rs.getInt("readerID"));
				comment.setComment(rs.getString("comment"));
				comment.setCommentTime(rs.getString("commentTime"));
				comment.setBookName(rs.getString("bookName"));
				comment.setReaderName(rs.getString("readerName"));
				bookAllComment.add(comment);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bookAllComment;
	}

	public boolean delCheckedInform(String str) {
		// TODO Auto-generated method stub
		boolean bl = false;
		int rs;
		String sql = "delete from inform_info where informID in (" + str + ")";

		if (dbc.executeUpdate(sql) != 0) {
			/*
			 * String
			 * nsql="update book_info set bookID=bookID-1 where bookID>"+bookID;
			 * rs=dbc.executeUpdate(nsql);
			 */
			bl = true;
		}
		return bl;
	}
//从数据库中将hotComment表中的数据取出
	public ArrayList<Comment> getHotComment() throws SQLException {
		// TODO Auto-generated method stub
		System.out.print("hello");
		ArrayList< Comment> commentList=new ArrayList<Comment>();
		ResultSet rs=null;
		String sql="";
		sql="select top 8 a.readerID,a.readerName,b.bookID,b.bookName,b.bookImage,c.comment,c.commentTime " +
				"from comment_info c " +
				"left join reader_info a on a.readerID=c.readerID " +
				"left join book_info b on b.bookID=c.bookID";
		rs=dbc.executeQuery(sql);
		while(rs.next()){
			Comment comment=new Comment();
			comment.setBookID(rs.getInt("bookID"));
			comment.setReaderID(rs.getInt("readerID"));
			comment.setReaderName(rs.getString("readerName"));
			comment.setBookName(rs.getString("bookName"));
			comment.setComment(rs.getString("comment"));
			comment.setCommentTime(rs.getString("commentTime"));
			comment.setBookImage(rs.getString("bookImage"));
			commentList.add(comment);
		}
		dbc.free(rs);
		return commentList;
	}

	
	public boolean delCheckedBook(String str) {
		// TODO Auto-generated method stub
		boolean bl = false;
		int rs;
		String sql = "delete from book_info where bookID in (" + str + ")";
	
		if (dbc.executeUpdate(sql) != 0) {
			/*
			 * String
			 * nsql="update book_info set bookID=bookID-1 where bookID>"+bookID;
			 * rs=dbc.executeUpdate(nsql);
			 */
			bl = true;
		}
	
		return bl;
	
		/*
		 * int rs; String sql="delete from book_info where bookID in ("+str+")";
		 * rs=dbc.executeUpdate(sql);
		 * 
		 * String nsql="update book_info set bookID=bookID-1 where bookID>"+str;
		 * rs=dbc.executeUpdate(nsql);
		 * 
		 * return rs;
		 */
	}

	//根据图书ID 判断 图书的状态（是否被借，是否预约） 0：代表未被借出和可预约 1：代表 已借出 2：代表 已预约
	public int checkBookStatus(int readerID){
		int bookStatus = 0;
		String sql = null;
		sql = "select * from borrow_info where bookID = "+readerID+"";
		ResultSet rs = null;
		rs = dbc.executeQuery(sql);
		try {
			if(rs.next()){
				bookStatus = 1;
			}else{
				sql = "select * from reserve_info where bookID = "+readerID+"";
				rs = dbc.executeQuery(sql);
				if(rs.next()){
					bookStatus = 2;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bookStatus;
	}
	
	//图书的预约
	public boolean bookReserve(ReserveBook reserveBook) {
		// TODO Auto-generated method stub
		boolean bl = false;
		int rs;
		String sql = "insert reserve_info values("+reserveBook.getReaderID()+","+reserveBook.getBookID()+",'"+reserveBook.getReserveTime()+"')";
		if (dbc.executeUpdate(sql) != 0) {
			bl = true;
		}
		return bl;
	}
	
	//根据readerID  bookID查看是否被评论
	public boolean checkReaderComment(int readerID,int bookID) {
		// TODO Auto-generated method stub
		boolean bl = false;
		ResultSet rs = null;
		String sql = "select * from comment_info where readerID = "+readerID+" and bookID = "+bookID+"";
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
	
	//根据关键字来搜索的结果数目
		public int  getBookListSize(String keywords,int type){
			ArrayList<Book> bookList = new ArrayList<Book>();
			String sql = null;
			int bookListSize = 0;
			ResultSet rs = null;
			switch (type) {
			case 0:			
				sql = "select count(*) as bookListSize from book_info where bookName like '%"+keywords+"%'";//0 bookName
				break;
			case 1:
				sql = "select count(*) as bookListSize from book_info where bookID = "+keywords;//1 bookID
				break;	
			case 2:
				sql = "select count(*) as bookListSize from book_info where ISBN = '"+keywords+"'";//2 ISBN
				break;
			case 3:
				sql = "select count(*) as bookListSize from book_info where bookTypeName = '"+keywords+"'";//3 bookType
				break;
			case 4:
				sql = "select count(*) as bookListSize from book_info where author = '"+keywords+"'";//4 author
				break;
			case 5:
				sql = "select count(*) as bookListSize from book_info where summaryNote  like '%"+keywords+"%'";//5 summaryNote
				break;
			default:
				break;
			}
			System.out.println("search sql"+sql);
			rs = dbc.executeQuery(sql);
			try {
				while (rs.next()) {
					bookListSize = rs.getInt("bookListSize");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
			return bookListSize;
		}

	//根据关键字来搜索
	public ArrayList<Book> search(String keywords,int type,int pageSize,int pageNow){
		BookManagement bm = new BookManagement();
		ArrayList<Book> bookList = new ArrayList<Book>();
		String sql = null;
		ResultSet rs = null;
		switch (type) {
		case 0:			
			sql = "select top "+pageSize+" * from book_info where bookName like '%"+keywords+"%' and bookID not in (select top "+pageSize*pageNow+" bookID from book_info where bookName like '%"+keywords+"%')";//0 bookName
			break;
		case 1:
			sql = "select top "+pageSize+" * from book_info where bookID like '%"+keywords+"%' and bookID not in (select top "+pageSize*pageNow+" bookID from book_info where bookID like '%"+keywords+"%')";//1 bookID
			break;	
		case 2:
			sql = "select top "+pageSize+" * from book_info where ISBN like '%"+keywords+"%' and bookID not in (select top "+pageSize*pageNow+" bookID from book_info where ISBN like '%"+keywords+"%')";//2 ISBN
			break;
		case 3:
			sql = "select top "+pageSize+" * from book_info where bookTypeName like '%"+keywords+"%' and bookID not in (select top "+pageSize*pageNow+" bookID from book_info where bookTypeName like '%"+keywords+"%')";//3 bookType
			break;
		case 4:
			sql = "select top "+pageSize+" * from book_info where author like '%"+keywords+"%' and bookID not in (select top "+pageSize*pageNow+" bookID from book_info where author like '%"+keywords+"%')";//4 author
			break;
		case 5:
			sql = "select top "+pageSize+" * from book_info where summaryNote like '%"+keywords+"%' and bookID not in (select top "+pageSize*pageNow+" bookID from book_info where summaryNote like '%"+keywords+"%')";//5 summaryNote
			break;
		default:
			break;
		}
		System.out.println("search sql"+sql);
		rs = dbc.executeQuery(sql);
		try {
			while (rs.next()) {
				Book book = new Book();
				book.setISBN(rs.getString("ISBN"));
				book.setBookName(rs.getString("bookName"));
				book.setPress(rs.getString("press"));
				book.setAuthor(rs.getString("author"));
				book.setPrice(rs.getFloat("price"));
				book.setStorageTime(rs.getString("storageTime"));
				book.setBookTypeName(rs.getString("bookTypeName"));
				book.setReadingRoomName(rs.getString("readingRoomName"));
				book.setSummargNote(rs.getString("summaryNote"));
				book.setBookImage(rs.getString("bookImage"));
				book.setBookID(rs.getInt("bookID"));
				if(bm.checkBookStatus(book.getBookID())==0){
					book.setStatus("可借");
				}else if(bm.checkBookStatus(book.getBookID())==1){
					book.setStatus("借出");
				}else if(bm.checkBookStatus(book.getBookID())==2){
					book.setStatus("已预约");
				}
				bookList.add(book);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return bookList;
	}


	public boolean bookBackByID(int bookID) {
		// TODO Auto-generated method stub
		boolean bl = false;
		 ResultSet rs = null;
		 String sql = null;
		sql = "delete from borrow_info where bookID=" + bookID;
		if (dbc.executeUpdate(sql) != 0) {
			bl = true;
		}
		sql = "";
		return bl;
	}
	
	//如果预约的时间超过24小时则预约自动失效
	public void reserveOverTime(){
		Date   curDate   =   new   Date(System.currentTimeMillis());
		Date reserveTime = new Date();
		ResultSet rs = null;
		String sql = "select *from reserve_info";
		int bookID = 0;
		int readerID = 0;
		rs = dbc.executeQuery(sql);
		try {
			while(rs.next()){
				reserveTime = rs.getDate("reserveTime");				
				long between = (reserveTime.getTime() - curDate.getTime());
				long day = between / (24 * 60 * 60 * 1000);
				long hour = (between / (60 * 60 * 1000) - day * 24);
				if(hour >= 24){
					bookID = rs.getInt("bookID");
					readerID = rs.getInt("readerID");
					sql = "delete reserve_info where bookID = "+bookID+" and readerID = "+readerID+"";
					dbc.executeUpdate(sql);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

}
