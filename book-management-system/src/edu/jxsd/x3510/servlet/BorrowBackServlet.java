package edu.jxsd.x3510.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.jxsd.x3510.bean.*;
import edu.jxsd.x3510.dao.BookManagement;
import edu.jxsd.x3510.dao.ReaderManagement;

public class BorrowBackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BorrowBackServlet() {
        super();
        }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String actionType;
		actionType = request.getParameter("actionType");
		if (actionType.equals("readerBorrow")) {
			this.readerBorrow(request, response);
		}else if (actionType.equals("BorrowBookID")) {
			this.BorrowBookID(request, response);
		}else if (actionType.equals("bookBack")) {
			this.bookBack(request, response);
		}
	}
	private void bookBack(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		/*String readerName=request.getParameter("readerName");
		byte a[]=readerName.getBytes("ISO-8859-1");
		readerName=new String(a);
		System.out.println(readerName);*/
		int bookID = Integer.parseInt(request.getParameter("bookID"));
		BookManagement bm = new BookManagement();
		HttpSession session = request.getSession();
		if (bm.bookBackByID(bookID)) {
			ArrayList <GiveBackBook> givebackList = null;
			ArrayList<BorrowBook> borrow = null;
			String readerName = null;
			ReaderManagement rm = new ReaderManagement();	
			readerName = request.getParameter("readerName");
			byte a[]=readerName.getBytes("ISO-8859-1");
			readerName=new String(a);
			System.out.println(readerName);
			givebackList=rm.adminHistoryBorrow(readerName);
			int readerID=rm.getReaderID(readerName);			
			session.setAttribute("givebackList",givebackList);
			try {
				borrow=rm.currentborrow(readerName);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if(borrow!=null){
				session.setAttribute("borrow", borrow);
				session.setAttribute("readerID",readerID);
				 session.setAttribute("readerName", readerName);
				try {		
					 response.sendRedirect("/book-management-system/jsp/borrowback.jsp");
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
	            //this.readerBorrow(request, response);
				//this.bookBackList(request, response);
			} else {
			try {
				response.sendRedirect("/book-management-system/jsp/bookBackError.jsp");
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}
	}

	private void bookBackList(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		ArrayList<BorrowBook> borrow = null;
		String readerName = null;
		ReaderManagement rm = new ReaderManagement();
		readerName = request.getParameter("readerName");
		byte a[]=readerName.getBytes("ISO-8859-1");
		readerName=new String(a);
		int bookID=Integer.parseInt(request.getParameter("bookID"));
		HttpSession session = request.getSession();
		try {
			borrow=rm.currentborrow(readerName);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		if(borrow!=null){
			session.setAttribute("borrow", borrow);
			/*session.setAttribute("readerID",readerID);*/
			try {
				 session.setAttribute("readerName", readerName);
				response.sendRedirect("/book-management-system/jsp/borrowback.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	private void BorrowBookID(HttpServletRequest request,
			HttpServletResponse response)throws ServletException,IOException {
		ArrayList<BorrowBook> borrow = null;
		int readerID=Integer.parseInt(request.getParameter("readID"));
		int bookID = Integer.parseInt(request.getParameter("bookID"));
		boolean bl = false;
		String adminName=request.getParameter("adminName");
		String readerName=request.getParameter("readerName");
		byte a[]=adminName.getBytes("ISO-8859-1");
		adminName=new String(a);
		byte b[]=readerName.getBytes("ISO-8859-1");
		readerName=new String(b);
		HttpSession session = request.getSession();
		ReaderManagement rm = new ReaderManagement();
		bl = rm.booleanBookreserve(bookID);
		int bookNum = rm.readerBorrowBook(readerID);
		if(bookNum >= 5){
			session.setAttribute("borrowMsg", "所借图书不能超过5本");
			response.sendRedirect("/book-management-system/jsp/borrowback.jsp");
		}else{
			if(bl){
				session.setAttribute("borrowMsg", "该图书已被预约");
				response.sendRedirect("/book-management-system/jsp/borrowback.jsp");
			}
			else if((rm.InsertBorrowInfo(readerID,bookID))){
		    	session.setAttribute("borrow", borrow);
		    	try {
		    		session.setAttribute("borrowMsg", "");
		    		session.setAttribute("login", adminName);
		    		session.setAttribute("readerName", readerName);
					this.bookBackList(request, response);
				} catch (IOException e) {
					e.printStackTrace();
				}
		    }
		}
	}

	private void readerBorrow(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		ArrayList <GiveBackBook> givebackList = null;
		ArrayList<BorrowBook> borrow = null;
		String readerName = null;
		ReaderManagement rm = new ReaderManagement();	
		readerName = request.getParameter("readerName");
		givebackList=rm.adminHistoryBorrow(readerName);
		int readerID=rm.getReaderID(readerName);
		HttpSession session = request.getSession();
		
		session.setAttribute("givebackList",givebackList);
		try {
			borrow=rm.currentborrow(readerName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(borrow!=null){
			session.setAttribute("borrow", borrow);
			session.setAttribute("readerID",readerID);
			 session.setAttribute("readerName", readerName);
			try {		
				 response.sendRedirect("/book-management-system/jsp/borrowback.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
