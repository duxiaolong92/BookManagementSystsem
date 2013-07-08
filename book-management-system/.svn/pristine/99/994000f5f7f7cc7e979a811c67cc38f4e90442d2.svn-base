package edu.jxsd.x3510.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.client.ClientProtocolException;
import org.lxh.smart.File;
import org.lxh.smart.SmartUpload;

import com.jspsmart.upload.SmartUploadException;

import edu.jxsd.x3510.bean.Book;
import edu.jxsd.x3510.bean.Comment;
import edu.jxsd.x3510.bean.Inform;
import edu.jxsd.x3510.bean.ReserveBook;
import edu.jxsd.x3510.dao.BookManagement;
import edu.jxsd.x3510.dao.InformManagement;
import edu.jxsd.x3510.spider.GetBookBySpider;


public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    static  int BOOKPAGESIZE=10; 
    static  int READERPAGESIZE=15;
    static  int INFORMPAGESIZE=15;
	public BookServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String actionType;
		actionType = request.getParameter("actionType");
		if (actionType.equals("bookView")) {
			this.bookView(request, response);
		} else if (actionType.equals("bookAdd")) {
			try {
				this.bookAdd(request, response);
			} catch (org.lxh.smart.SmartUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (actionType.equals("bookDelete")) {
			this.bookDelete(request, response);
		} else if (actionType.equals("bookViewDetail")) {
			this.bookViewDetail(request, response);
		} else if (actionType.equalsIgnoreCase("bookModify")) {
			this.bookModify(request, response);
		} else if (actionType.equals("bookUpdate")) {
			this.bookUpdate(request, response);
		} else if (actionType.equals("bookPage")) {
			this.bookPage(request, response);
		}else if(actionType.equals("bookIntroduce")){
			this.bookIntroduce(request,response);
		}else if (actionType.equals("getHotBorrow")) {
			this.getHotBorrow(request, response);
		}else if(actionType.equals("informView")){
			this.informView(request,response);
		}else if(actionType.equals("informPage")){
			this.informPage(request,response);
		}else if(actionType.equals("spider")){
			this.spider(request,response);
		}else if(actionType.equals("informDelete")){
			this.informDelete(request,response);
		}else if(actionType.equals("delCheckedBook")){
			this.delCheckedBook(request,response);
		}else if(actionType.equals("delCheckedInform")){
			this.delCheckedInform(request,response);
		}else if(actionType.equals("comment")){
			this.comment(request,response);
		}else if(actionType.equals("delComment")){
			this.delComment(request,response);
		}
		else if(actionType.equals("reserve")){
			this.reserve(request,response);
		}else if(actionType.equals("getHotBorrowIndexAjax")){
			this.getHotBorrowIndexAjax(request, response);
		}else if(actionType.equals("search")){
			this.search(request,response);
		}else if(actionType.equals("search2")){
			this.search2(request,response);
		}
		else if(actionType.equals("getHotComment")){
			try {
				this.getHotComment(request,response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(actionType.equals("indexDirectHotBorrow")){
			this.indexDirectHotBorrow(request,response);
		}
		
	}
	
	private void delComment(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		BookManagement bm = new BookManagement();
		int bookID = 0;
		int readerID = 0;
		bookID = Integer.parseInt(request.getParameter("bookID").toString());
		readerID = Integer.parseInt(request.getParameter("readerID").toString());
		if(bm.delBookComment(readerID, bookID)){
			System.out.println("删除评论成功");
			response.sendRedirect("/book-management-system/ReaderServlet?actionType=myLibrary");
		}else{
			System.out.println("删除评论失败");
		}
		
	}

	private void indexDirectHotBorrow(HttpServletRequest request,
			HttpServletResponse response) {
		BookManagement bm = new BookManagement();
		bm.reserveOverTime();//一进入页面 就开始 检查 预约有没有 超时
		String i = request.getParameter("i");
		HttpSession session=request.getSession();
		session.setAttribute("i", i);
		try {
			response.sendRedirect("/book-management-system/jsp/hotborrow.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	//首页 搜索 
	private void search(HttpServletRequest request, HttpServletResponse response) {
		int PAGESIZE = 15;
		int bookListSize = 0;
		int pageNow = 0;
		BookManagement bm=new BookManagement();
		HttpSession session=request.getSession();
		String keywords = request.getParameter("search_text");
		System.out.println("keywords"+keywords);
		int type = Integer.parseInt(request.getParameter("form_select"));
		pageNow = Integer.parseInt(request.getParameter("pageNow"));
		System.out.println(pageNow);
		bookListSize = bm.getBookListSize(keywords, type);
		if(pageNow < 0)pageNow = 0;	
		else if(pageNow > bookListSize/PAGESIZE){
			pageNow = bookListSize/PAGESIZE;
		}	
		System.out.println("type"+type);
		ArrayList<Book> searchBookList = bm.search(keywords, type,PAGESIZE,pageNow);
		session.setAttribute("searchBookList",searchBookList);
		session.setAttribute("bookListSize", bookListSize);
		session.setAttribute("pageNow", pageNow);
		session.setAttribute("keywords", keywords);
		session.setAttribute("type", type);
		try {
			response.sendRedirect("/book-management-system/jsp/search.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 搜索 分页
		private void search2(HttpServletRequest request, HttpServletResponse response) {
			System.out.println("search");
			int PAGESIZE = 15;
			int bookListSize = 0;
			int pageNow = 0;
			BookManagement bm=new BookManagement();
			HttpSession session=request.getSession();
			String keywords = (String) session.getAttribute("keywords");
			System.out.println("keywords"+keywords);
			int type = Integer.parseInt(session.getAttribute("type").toString());
			pageNow = Integer.parseInt(request.getParameter("pageNow"));
			System.out.println(pageNow);
			bookListSize = bm.getBookListSize(keywords, type);
			if(pageNow < 0)pageNow = 0;	
			else if(pageNow > bookListSize/PAGESIZE){
				pageNow = bookListSize/PAGESIZE;
			}	
			System.out.println("type"+type);
			ArrayList<Book> searchBookList = bm.search(keywords, type,PAGESIZE,pageNow);
			session.setAttribute("searchBookList",searchBookList);
			session.setAttribute("bookListSize", bookListSize);
			session.setAttribute("pageNow", pageNow);
			session.setAttribute("keywords", keywords);
			session.setAttribute("type", type);
			try {
				response.sendRedirect("/book-management-system/jsp/search.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
	
	//取得热门借阅的所有数据
	private void getHotComment(HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
		// TODO Auto-generated method stub
		BookManagement bm=new BookManagement();
		HttpSession session=request.getSession();
		ArrayList<Comment> commentList;
		commentList=bm.getHotComment();
		session.setAttribute("commentList", commentList);
		try {
			response.sendRedirect("/book-management-system/jsp/hotcomment.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
	}

	private void reserve(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("GB2312");
		response.setContentType("text/html;charset=GB2312");
		PrintWriter out = response.getWriter();
		BookManagement bm=new BookManagement();
		ReserveBook reserveBook = new ReserveBook();
		int readerID = Integer.parseInt(request.getParameter("readerID"));
		int bookID = Integer.parseInt(request.getParameter("bookID"));
		Date date=new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String time=df.format(date);
		reserveBook.setBookID(bookID);
		reserveBook.setReaderID(readerID);
		reserveBook.setReserveTime(time);
		if(bm.bookReserve(reserveBook)){
			System.out.println("预约成功");
			out.print("预约成功");
		}else{
			System.out.println("预约失败");
			out.print("你预约的书已经超过5本啦！");
		}
	}

	private void delCheckedInform(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		ArrayList <Inform> al = new ArrayList <Inform> ();
		HttpSession session = request.getSession();
		String str1=request.getParameter("ID");
		String ID[]=str1.split(",");
		String str="";
		for(int i=0;i<ID.length;i++){
			str+="'"+ID[i]+"'";
			if(i!=ID.length-1){
				str+=",";
			}
		}
		BookManagement bm=new BookManagement();
		InformManagement im=new InformManagement();
		boolean rs=bm.delCheckedInform(str);
		if(rs){
			try {
				int pageCount = 0;
				int pageNow = 1;
				int recordSize = 0;
				int pageSize = 3;
				recordSize = im.getInformRecord();
				if (recordSize % pageSize == 0) {
					pageCount = recordSize / pageSize;
				} else {
					pageCount = recordSize / pageSize + 1;
				}
				// Book book=new Book();
				// if(book!=null){
				al = im.getFirstInform(pageNow, pageSize);
				// al = bm.getAllBook();
				session.setAttribute("informList", al);
				session.setAttribute("pageCount", pageCount);
				session.setAttribute("pageNow", pageNow);
				response.sendRedirect("/book-management-system/jsp/informManage.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			/*response.setHeader("refresh","1;url=/book-management-system/jsp/booktable.jsp");*/
		}
	}

	private void delCheckedBook(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		    ArrayList <Book> al = new ArrayList <Book> ();
		    HttpSession session = request.getSession();
			String str1=request.getParameter("ID");
			String ID[]=str1.split(",");
			String str="";
			for(int i=0;i<ID.length;i++){
				str+="'"+ID[i]+"'";
				if(i!=ID.length-1){
					str+=",";
				}
			}
			BookManagement bm=new BookManagement();
			boolean rs=bm.delCheckedBook(str);
			if(rs){
				try {
					int pageCount = 0;
					int pageNow = 1;
					int recordSize = 0;
					int pageSize = BOOKPAGESIZE;
					recordSize = bm.getRecordSize();
					if (recordSize % pageSize == 0) {
						pageCount = recordSize / pageSize;
					} else {
						pageCount = recordSize / pageSize + 1;
					}
					// Book book=new Book();
					// if(book!=null){
					al = bm.getFirstPage(pageNow, pageSize);
					// al = bm.getAllBook();
					session.setAttribute("bookList", al);
					session.setAttribute("pageCount", pageCount);
					session.setAttribute("pageNow", pageNow);
					response.sendRedirect("/book-management-system/jsp/booktable.jsp");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				/*response.setHeader("refresh","1;url=/book-management-system/jsp/booktable.jsp");*/
			}
		}

	
	//ajax send 转码问题
	public static String unescape(String src) {
		StringBuffer tmp = new StringBuffer();
		tmp.ensureCapacity(src.length());
		int lastPos = 0, pos = 0;
		char ch;
		while (lastPos < src.length()) {
			pos = src.indexOf("%", lastPos);
			if (pos == lastPos) {
				if (src.charAt(pos + 1) == 'u') {
					ch = (char) Integer.parseInt(
							src.substring(pos + 2, pos + 6), 16);
					tmp.append(ch);
					lastPos = pos + 6;
				} else {
					ch = (char) Integer.parseInt(
							src.substring(pos + 1, pos + 3), 16);
					tmp.append(ch);
					lastPos = pos + 3;
				}
			} else {
				if (pos == -1) {
					tmp.append(src.substring(lastPos));
					lastPos = src.length();
				} else {
					tmp.append(src.substring(lastPos, pos));
					lastPos = pos;
				}
			}
		}
		return tmp.toString();
	}

	private void comment(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("GB2312");
		response.setContentType("text/html;charset=GB2312");
		String data = null;
		BookManagement bm = new BookManagement();
		Comment comment = new Comment();
		comment.setReaderID(Integer.parseInt(request.getParameter("readerID")));
		comment.setBookID(Integer.parseInt(request.getParameter("bookID")));
		PrintWriter out = response.getWriter();
		if(bm.checkReaderComment(comment.getReaderID(),comment.getBookID())==true){
			out.print("您已评论过了");
		}else{
			comment.setBookID(Integer.parseInt(request.getParameter("bookID")));
			String comm = unescape(request.getParameter("comment")); 
			/*//comment.setComment(request.getParameter("comment"));
			//String mm =  java.net.URLDecoder.decode(v, "UTF-8");
			String comm = request.getParameter("comment");
			byte a[]=comm.getBytes("ISO-8859-1");
			comm = new String(a);
			title=new String(title.getBytes("iso-8859-1"),"utf-8");
			title=URLDecoder.decode(title,"UTF-8");*/
			System.out.println(comm);
			comment.setComment(comm);
			Date date=new Date();
			SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String time=df.format(date);
			comment.setCommentTime(time);		
			if(bm.bookComment(comment)){
				System.out.println("评论成功");
				comment = bm.getReaderComment(comment.getBookID(),comment.getReaderID());
				data = "{readerID:"+comment.getReaderID()+",readerName:'"+comment.getReaderName()+"',bookID:"+comment.getBookID()+",bookName:'"+comment.getBookName()+"',comment:'"+comment.getComment()+"',commentTime:'"+comment.getCommentTime()+"'}";
				out.print(data);
			}else{
				System.out.println("评论失败");
			}
		}
	}

	private void informDelete(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		int informID = Integer.parseInt(request.getParameter("informID"));
		BookManagement bm = new BookManagement();
		HttpSession session = request.getSession();
		if (bm.informDeleteByID(informID)) {
			this.informList(request, response);
		} else {
			try {
				response.sendRedirect("/book-management-system/jsp/informDeleteError.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	private void informList(HttpServletRequest request,// 所有图书的列表函数
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		List<Inform> informList = new ArrayList();
		BookManagement bm = new BookManagement();
		HttpSession session = request.getSession();
		informList = bm.getAllInform();
		session.setAttribute("informList", informList);
		try {
			response.sendRedirect("/book-management-system/jsp/informManage.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	//spider根据ISBN取得图书信息
	private void spider(HttpServletRequest request, HttpServletResponse response) throws ClientProtocolException, IOException {
		String jsonBook = null;
		request.setCharacterEncoding("GB2312");
		response.setContentType("text/html;charset=GB2312");
		PrintWriter out = response.getWriter();
		BookManagement bm = new BookManagement();
		GetBookBySpider getBookBySpider = new GetBookBySpider();
		ArrayList<Book> bookList = null;
		String search = null;
		String bookTypeName = "文学";
		search = request.getParameter("search");
		System.out.println("search"+search);
		bookList = getBookBySpider.setBook(search, bookTypeName);
		HttpSession session = request.getSession();
		session.setAttribute("bookList", bookList);
		if(bookList == null){
			System.out.println("spider没有取到图书");
		}else{
			for(int i=0;i<bookList.size();i++){
				Book book = new Book();
				book = bookList.get(i);
				jsonBook = "{book:[{bookID:"+book.getBookID()+",storageTime:'"+book.getStorageTime()+"',bookType:'"+book.getBookTypeName()+"',readingRoom:'"+book.getReadingRoomName()+"',ISBN:'"+book.getISBN()+"',bookName:'"+book.getBookName()+"',press:'"+book.getPress()+"',price:"+book.getPrice()+",bookImage:'"+book.getBookImage()+"',author:'"+book.getAuthor()+"',summaryNote:'"+book.getSummargNote()+"'}]}";
				System.out.println(jsonBook);
				System.out.println("成功根据ISBN取得图书信息");
				
			}
		}
		out.print(jsonBook);
		/*else{
			for(int size = 0;size < bookList.size();size++){
				if(bm.checkBookByISBN(bookList.get(size).getISBN())){
					bm.bookAdd(bookList.get(size));
				}else{
					System.out.println("图书已存在");
				}
			}
			System.out.println("spider取到的图书已经全部存入数据库");
		}*/	
	}

	private void informPage(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		int pageCount = 0;// 总页数
		int pageNow = Integer.parseInt(request.getParameter("pageNow"));// 当前页
		int recordSize = 0;// 总的记录条数
		int pageSize = 3;// 每页条数
		ArrayList informList = new ArrayList();
		BookManagement bm = new BookManagement();
		recordSize = bm.getInformRecord();
		if (recordSize % pageSize == 0) {
			pageCount = recordSize / pageSize;
		} else {
			pageCount = recordSize / pageSize + 1;
		}
		informList = bm.getCurrentInform(pageNow, pageSize);
		HttpSession session = request.getSession();
		session.setAttribute("informList", informList);
		session.setAttribute("pageCount", pageCount);
		session.setAttribute("pageNow", pageNow);
		try {
			response.sendRedirect("/book-management-system/jsp/informManage.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void informView(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		ArrayList al = new ArrayList();
		BookManagement bm = new BookManagement();
		HttpSession session = request.getSession();
		int pageCount = 0;
		int pageNow = 1;
		int recordSize = 0;
		int pageSize = 3;
		recordSize = bm.getInformRecord();
		if (recordSize % pageSize == 0) {
			pageCount = recordSize / pageSize;
		} else {
			pageCount = recordSize / pageSize + 1;
		}
		// Book book=new Book();
		// if(book!=null){
		al = bm.getFirstInform(pageNow, pageSize);
		// al = bm.getAllBook();
		session.setAttribute("informList", al);
		session.setAttribute("pageCount", pageCount);
		session.setAttribute("pageNow", pageNow);
		try {
			response.sendRedirect("/book-management-system/jsp/informManage.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void getHotBorrow(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		BookManagement bm = new BookManagement();
		HttpSession session = request.getSession();
		ArrayList<Book> newBookList;
		ArrayList<Book> allHotBookList;
		ArrayList<Book> hotLiteratureBookList;
		ArrayList<Book> hotTechBookList;
		ArrayList<Book> hotLifeBookList;
		ArrayList<Book> hotEconomyBookList;
		ArrayList<Book> hotHistoryBookList;
		ArrayList<Book> hotPopularBookList;
		newBookList = bm.getNewBookList();
		allHotBookList = bm.getAllHotBookList();
		hotLiteratureBookList = bm.getHotBookList("文学");
		hotTechBookList = bm.getHotBookList("科技");
		hotLifeBookList = bm.getHotBookList("生活");
		hotEconomyBookList = bm.getHotBookList("经管");
		hotHistoryBookList = bm.getHotBookList("历史");
		hotPopularBookList = bm.getHotBookList("流行");
		session.setAttribute("newBookList", newBookList);
		session.setAttribute("allHotBookList", allHotBookList);
		session.setAttribute("hotLiteratureBookList",hotLiteratureBookList);
		session.setAttribute("hotTechBookList",hotTechBookList);
		session.setAttribute("hotLifeBookList",hotLifeBookList);
		session.setAttribute("hotEconomyBookList",hotEconomyBookList);
		session.setAttribute("hotHistoryBookList",hotHistoryBookList);
		session.setAttribute("hotPopularBookList",hotPopularBookList);
		response.sendRedirect("/book-management-system/jsp/hotborrow.jsp");
	}
	

	private void getHotBorrowIndexAjax(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("GB2312");
		response.setContentType("text/html;charset=GB2312");
		BookManagement bm = new BookManagement();
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		String jsonBook = "{bookList:[";
		ArrayList<Book> hotLiteratureBookList;
		ArrayList<Book> hotTechBookList;
		ArrayList<Book> hotLifeBookList;
		ArrayList<Book> hotEconomyBookList;
		ArrayList<Book> hotHistoryBookList;
		ArrayList<Book> hotPopularBookList;
		hotLiteratureBookList = bm.getHotBookList("文学");
		for(int i = 0;i < hotLiteratureBookList.size();i++ ){
			Book book = hotLiteratureBookList.get(i);
			jsonBook = jsonBook + "{bookID:"+book.getBookID()+",ISBN:'"+book.getISBN()+"',bookName:'"+book.getBookName()+"',press:'"+book.getPress()+"',price:"+book.getPrice()+",bookImage:'"+book.getBookImage()+"',author:'"+book.getAuthor()+"',summaryNote:'"+book.getSummargNote()+"'},";		
		}
		hotTechBookList = bm.getHotBookList("科技");
		for(int i = 0;i < hotTechBookList.size();i++ ){
			Book book = hotTechBookList.get(i);
			jsonBook = jsonBook + "{bookID:"+book.getBookID()+",ISBN:'"+book.getISBN()+"',bookName:'"+book.getBookName()+"',press:'"+book.getPress()+"',price:"+book.getPrice()+",bookImage:'"+book.getBookImage()+"',author:'"+book.getAuthor()+"',summaryNote:'"+book.getSummargNote()+"'},";		
		}	
		hotLifeBookList = bm.getHotBookList("生活");
		for(int i = 0;i < hotLifeBookList.size();i++ ){
			Book book = hotLifeBookList.get(i);
			jsonBook = jsonBook + "{bookID:"+book.getBookID()+",ISBN:'"+book.getISBN()+"',bookName:'"+book.getBookName()+"',press:'"+book.getPress()+"',price:"+book.getPrice()+",bookImage:'"+book.getBookImage()+"',author:'"+book.getAuthor()+"',summaryNote:'"+book.getSummargNote()+"'},";		
		}
		hotEconomyBookList = bm.getHotBookList("经管");
		for(int i = 0;i < hotEconomyBookList.size();i++ ){
			Book book = hotEconomyBookList.get(i);
			jsonBook = jsonBook + "{bookID:"+book.getBookID()+",ISBN:'"+book.getISBN()+"',bookName:'"+book.getBookName()+"',press:'"+book.getPress()+"',price:"+book.getPrice()+",bookImage:'"+book.getBookImage()+"',author:'"+book.getAuthor()+"',summaryNote:'"+book.getSummargNote()+"'},";		
		}
		hotHistoryBookList = bm.getHotBookList("历史");
		for(int i = 0;i < hotHistoryBookList.size();i++ ){
			Book book = hotHistoryBookList.get(i);
			jsonBook = jsonBook + "{bookID:"+book.getBookID()+",ISBN:'"+book.getISBN()+"',bookName:'"+book.getBookName()+"',press:'"+book.getPress()+"',price:"+book.getPrice()+",bookImage:'"+book.getBookImage()+"',author:'"+book.getAuthor()+"',summaryNote:'"+book.getSummargNote()+"'},";		
		}
		hotPopularBookList = bm.getHotBookList("流行");
		for(int i = 0;i < hotPopularBookList.size();i++ ){
			Book book = hotPopularBookList.get(i);
			jsonBook = jsonBook + "{bookID:"+book.getBookID()+",ISBN:'"+book.getISBN()+"',bookName:'"+book.getBookName()+"',press:'"+book.getPress()+"',price:"+book.getPrice()+",bookImage:'"+book.getBookImage()+"',author:'"+book.getAuthor()+"',summaryNote:'"+book.getSummargNote()+"'},";		
		}
		jsonBook = jsonBook + "]}";
		out.print(jsonBook);
		System.out.println("index  ajax  取得图书");
	}
	
	private void bookIntroduce(HttpServletRequest request,
			HttpServletResponse response) {
		String bookStatus = "0"; // 0：代表未被借出和预约 1：代表 已借出 2：代表 已预约
		int bookID = 0;
		bookID = Integer.parseInt(request.getParameter("bookID"));
		BookManagement bm = new BookManagement();
		HttpSession session = request.getSession();
		Book book = new Book();
		ArrayList<Comment> bookCommentList = null;//获取图书的评论 
		String[] relateBookName = new String[8]; 
		book = bm.getBookById(bookID);
		bookCommentList = bm.getBookComment(bookID);
		relateBookName = bm.getRelateBook(bookID);
		bookStatus = String.valueOf(bm.checkBookStatus(bookID));
		if (book != null) {
			session.setAttribute("book", book);
			session.setAttribute("bookCommentList", bookCommentList);
			session.setAttribute("relateBookName", relateBookName);
			session.setAttribute("bookStatus", bookStatus);
			try {
				response.sendRedirect("/book-management-system/jsp/introduce.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				response.sendRedirect("/book-management-system/jsp/informError.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	private void bookPage(HttpServletRequest request,
			HttpServletResponse response) {
		int pageCount = 0;// 总页数
		int pageNow = Integer.parseInt(request.getParameter("pageNow"));// 当前页
		int recordSize = 0;// 总的记录条数
		int pageSize = BOOKPAGESIZE;// 每页条数
		ArrayList bookList = new ArrayList();
		BookManagement bm = new BookManagement();
		recordSize = bm.getRecordSize();
		if (recordSize % pageSize == 0) {
			pageCount = recordSize / pageSize;
		} else {
			pageCount = recordSize / pageSize + 1;
		}
		bookList = bm.getCurrentPageBooks(pageNow, pageSize);
		HttpSession session = request.getSession();
		session.setAttribute("bookList", bookList);
		session.setAttribute("pageCount", pageCount);
		session.setAttribute("pageNow", pageNow);
		try {
			response.sendRedirect("/book-management-system/jsp/booktable.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private void bookUpdate(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		Book book = new Book();
		int pageNow=Integer.parseInt(request.getParameter("pageNow"));
		book.setPrice(Float.parseFloat(request.getParameter("price")));
		HttpSession session = request.getSession();
		book.setBookID(Integer.parseInt(request.getParameter("bookID")));
		book.setISBN(request.getParameter("ISBN"));
		book.setBookName(request.getParameter("bookName"));
		book.setPress(request.getParameter("press"));
		book.setAuthor(request.getParameter("author"));
		String str = request.getParameter("storageTime");
		/*
		 * try { book.setStorageTime((Date) new
		 * SimpleDateFormat("yyyy-MM-dd").parse
		 * (request.getParameter("storageTime"))); } catch (ParseException e2) {
		 * // TODO Auto-generated catch block e2.printStackTrace(); }
		 */
		/*
		 * SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		 * try { book.setStorageTime((Date) sim.parse(request
		 * .getParameter("storageTime"))); } catch (ParseException e1) { // TODO
		 * Auto-generated catch block e1.printStackTrace(); }
		 */
		book.setBookTypeName(request.getParameter("bookTypeName"));
		book.setReadingRoomName(request.getParameter("readingRoomName"));
		book.setSummargNote(request.getParameter("summaryNote"));
		book.setBookID(Integer.parseInt(request.getParameter("bookID")));
		BookManagement bm = new BookManagement();
		ArrayList bookList=new ArrayList();
		if (bm.bookModify(book, str)) {
			        int pageCount = 0;
			        /*int pageNow = 1;*/
					int recordSize = 0;
					int pageSize = BOOKPAGESIZE;
					recordSize = bm.getRecordSize();
					if (recordSize % pageSize == 0) {
						pageCount = recordSize / pageSize;
					} else {
						pageCount = recordSize / pageSize + 1;
					}
					bookList = bm.getCurrentPageBooks(pageNow, pageSize);/*bm.getAllBook();*/
					session.setAttribute("bookList", bookList);
					session.setAttribute("pageCount", pageCount);
					session.setAttribute("pageNow", pageNow);
					try {
						response.sendRedirect("/book-management-system/jsp/booktable.jsp");
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		} else {
			try {
				response.sendRedirect("/book-management-system/jsp/admin.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	private void bookModify(HttpServletRequest request,// 图书修改
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		int bookID = Integer.parseInt(request.getParameter("bookID"));
		int pageNow=Integer.parseInt(request.getParameter("pageNow"));
		System.out.println(bookID);
		BookManagement bm = new BookManagement();
		HttpSession session = request.getSession();
		Book book = new Book();
		book = bm.getBookById(bookID);
		if (book != null) {
			session.setAttribute("book", book);
			try {
				session.setAttribute("pageNow", pageNow);
				response.sendRedirect("/book-management-system/jsp/bookmodify.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			try {
				response.sendRedirect("/book-management-system/jsp/admin.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	private void bookViewDetail(HttpServletRequest request,// 图书的详细信息
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		int bookID = Integer.parseInt(request.getParameter("bookID"));
		BookManagement bm = new BookManagement();
		HttpSession session = request.getSession();
		Book book = new Book();
		book = bm.getBookById(bookID);
		if (book != null) {
			session.setAttribute("book", book);
			try {
				response.sendRedirect("/book-management-system/jsp/inform.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			try {
				response.sendRedirect("/book-management-system/jsp/informError.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	private void bookDelete(HttpServletRequest request,// 图书删除
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		int bookID = Integer.parseInt(request.getParameter("bookID"));
		BookManagement bm = new BookManagement();
		HttpSession session = request.getSession();
		if (bm.bookDeleteByID(bookID)) {
			this.bookList(request, response);
		} else {
			try {
				response.sendRedirect("/book-management-system/jsp/bookDeleteError.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	private void bookAdd(HttpServletRequest request,// 图书的增加
			HttpServletResponse response)throws ServletException,IOException, org.lxh.smart.SmartUploadException {
		// TODO Auto-generated method stub
		ArrayList <Book> al = new ArrayList <Book> ();
		Book book = new Book();
		HttpSession session = request.getSession();
	    //book.setBookID(Integer.parseInt(request.getParameter("bookID")));
		
		//String str = request.getParameter("storageTime");
		Date date=new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String time=df.format(date);
		book.setStorageTime(time);
		//book.setStorageTime(request.getParameter("storageTime"));
		/*try {
			book.setStorageTime((Date) new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("storageTime")));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}*/

		/*
		 * SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		 * try { book.setStorageTime((Date) sim.parse(request
		 * .getParameter("storageTime")));
		 * System.out.println(book.getStorageTime()); } catch (ParseException
		 * e1) { // TODO Auto-generated catch block e1.printStackTrace(); }
		 */

		book.setBookTypeName(request.getParameter("bookTypeName"));
		book.setReadingRoomName(request.getParameter("readingRoomName"));
		book.setSummargNote(request.getParameter("textarea"));		

		String m="";
		//book.setBookImage(request.getParameter("bookImage"));
		
		PrintWriter out = response.getWriter();
		String messages="";
		String forward="";
		long maxsize=2*1024*1024;
		String allowedFileList="doc,txt,xls,jpg";

		// 新建一个SmartUpload对象
		SmartUpload su = new SmartUpload();
		
		String paths="";
		// 上传初始化
		try {
		su.initialize(this.getServletConfig(), request, response);
		// 设定上传限制
		// 1.限制每个上传文件的最大长度。
		// su.setMaxFileSize(10000);
		// 2.限制总上传数据的长度。
		// su.setTotalMaxFileSize(20000);
		// 3.设定允许上传的文件（通过扩展名限制）,仅允许doc,txt文件。
		 su.setAllowedFilesList(allowedFileList);
		// 4.设定禁止上传的文件（通过扩展名限制）,禁止上传带有exe,bat,
		//jsp,htm,html扩展名的文件和没有扩展名的文件。
		su.setDeniedFilesList("exe,bat,jsp,htm,html,,");
		// 上传文件
		su.upload();
		// 将上传文件全部保存到指定目录
		book.setISBN(su.getRequest().getParameter("ISBN"));
		book.setBookName(su.getRequest().getParameter("bookName"));
		book.setPress(su.getRequest().getParameter("press"));
		book.setAuthor(su.getRequest().getParameter("author"));
		book.setPrice(Float.parseFloat(su.getRequest().getParameter("price")));
		System.out.println("hghjhj"+Float.parseFloat(su.getRequest().getParameter("price")));
		book.setBookTypeName(su.getRequest().getParameter("bookTypeName"));
		book.setReadingRoomName(su.getRequest().getParameter("readingRoomName"));
		book.setSummargNote(su.getRequest().getParameter("textarea"));
        String photo=su.getRequest().getParameter("bookImage");
		su.save("/images/book");
		
		
        // 逐一提取上传文件信息，同时可保存文件。
		for (int i=0;i<su.getFiles().getCount();i++)
		{
			File file = su.getFiles().getFile(i);
			
			// 若文件不存在则继续
			if (file.isMissing()) 
				continue;
                
			// 显示当前文件信息
			/*out.println("<TABLE BORDER=1>");
			out.println("<TR><TD>表单项名（FieldName）</TD><TD>"
			+ file.getFieldName() + "</TD></TR>");
			out.println("<TR><TD>文件长度（Size）</TD><TD>" + 
			file.getSize() + "</TD></TR>");*/
			/*out.println("<TR><TD>文件名（FileName）</TD><TD>" 
			+ file.getFileName() + "</TD></TR>");
			out.println("<TR><TD>文件扩展名（FileExt）</TD><TD>" 
			+ file.getFileExt() + "</TD></TR>");
			out.println("<TR><TD>文件全名（FilePathName）</TD><TD>"
			+ file.getFilePathName() + "</TD></TR>");
			out.println("</TABLE><BR>");*/
            paths="http://localhost:8080/book-management-system/images/book/"+file.getFileName();
			// 将文件另存
			// file.saveAs("/upload/" + myFile.getFileName());
			// 另存到以WEB应用程序的根目录为文件根目录的目录下
			// file.saveAs("/upload/" + myFile.getFileName();
		//	su.SAVE_VIRTUAL;
			// 另存到操作系统的根目录为文件根目录的目录下
			// file.saveAs("c:\\temp\\" + myFile.getFileName(), 
//			su.SAVE_PHYSICAL;
            book.setBookImage(paths);
		}
		 }catch(java.lang.SecurityException e){
	            messages="<li>上传文件失败！上传的文件类型只允许为：doc,txt,xls,jpg</li>";
	            forward="/jsp/fileupload/error.jsp";   
	            request.setAttribute("messages",messages);        
		        request.getRequestDispatcher(forward).forward(request, response);
	        }catch (SQLException e) {
	            e.printStackTrace();
	        }
		BookManagement bm = new BookManagement();
		if (bm.bookAdd(book)) {
			try {
				int pageCount = 0;
				int pageNow = 1;
				int recordSize = 0;
				int pageSize = BOOKPAGESIZE;
				recordSize = bm.getRecordSize();
				if (recordSize % pageSize == 0) {
					pageCount = recordSize / pageSize;
				} else {
					pageCount = recordSize / pageSize + 1;
				}
				// Book book=new Book();
				// if(book!=null){
				al = bm.getFirstPage(pageNow, pageSize);
				// al = bm.getAllBook();
				session.setAttribute("bookList", al);
				session.setAttribute("pageCount", pageCount);
				session.setAttribute("pageNow", pageNow);
				response.sendRedirect("/book-management-system/jsp/booktable.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}/*this.bookList(request, response);*/
		} else {
			try {
				response.sendRedirect("/book-management-system/jsp/bookadd.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
		private void bookList(HttpServletRequest request,// 所有图书的列表函数
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		List<Book> bookList = new ArrayList();
		BookManagement bm = new BookManagement();
		HttpSession session = request.getSession();
		int pageNow=Integer.parseInt(request.getParameter("pageNow"));
		int pageCount = 0;
/*		int pageNow = 1;*/
		int recordSize = 0;
		int pageSize = BOOKPAGESIZE;
		recordSize = bm.getRecordSize();
		if (recordSize % pageSize == 0) {
			pageCount = recordSize / pageSize;
		} else {
			pageCount = recordSize / pageSize + 1;
		}
		bookList = bm.getFirstPage(pageNow, pageSize);/*bm.getAllBook();*/
		session.setAttribute("bookList", bookList);
		session.setAttribute("pageCount", pageCount);
		session.setAttribute("pageNow", pageNow);
		try {
			response.sendRedirect("/book-management-system/jsp/booktable.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private void bookView(HttpServletRequest request,// 管理员查询数据库中图书的信息
			HttpServletResponse response) {
		ArrayList <Book> al = new ArrayList <Book> ();
		HttpSession session = request.getSession();
		BookManagement bm = new BookManagement();
		if (session.getAttribute("adminName")==null||(((String)session.getAttribute("adminName")).equals("登录"))) {
			try {
				response.sendRedirect("/book-management-system/jsp/loginfirst.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
		int pageCount = 0;
		int pageNow = 1;
		int recordSize = 0;
		int pageSize = BOOKPAGESIZE;
		recordSize = bm.getRecordSize();
		if (recordSize % pageSize == 0) {
			pageCount = recordSize / pageSize;
		} else {
			pageCount = recordSize / pageSize + 1;
		}
		// Book book=new Book();
		// if(book!=null){
		al = bm.getFirstPage(pageNow, pageSize);
		// al = bm.getAllBook();
		session.setAttribute("bookList", al);
		session.setAttribute("pageCount", pageCount);
		session.setAttribute("pageNow", pageNow);
		try {
			response.sendRedirect("/book-management-system/jsp/booktable.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	}
}
