package edu.jxsd.x3510.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sound.midi.MidiDevice.Info;

import edu.jxsd.x3510.bean.Book;
import edu.jxsd.x3510.bean.Comment;
import edu.jxsd.x3510.bean.Inform;
import edu.jxsd.x3510.dao.BookManagement;
import edu.jxsd.x3510.dao.InformManagement;

public class InformServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static int INFORMPAGESIZE = 3;
	public InformServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String actionType;
		actionType = request.getParameter("actionType");
		if (actionType.equals("moreInform")) {
			try {
				this.moreInform(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if (actionType.equals("inform")) {
			try {
				this.inform(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if (actionType.equals("informPage")) {
			this.informPage(request, response);
		}
		else if(actionType.equals("moreSource")){
			try {
				this.moreSource(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(actionType.equals("sourcePage")){
			this.sourcePage(request, response);
		}
		else if(actionType.equals("moreNews")){
			try {
				this.moreNews(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(actionType.equals("newsPage")){
			this.newsPage(request, response);
		}else if(actionType.equals("getInformByAjax")){
			this.getInformByAjax(request,response);
		}else if(actionType.equals("informAdd")){
			this.informAdd(request,response);
		}
		else if(actionType.equals("informView")){
			this.informView(request,response);
		}
		else if(actionType.equals("informDelete")){
			this.informDelete(request,response);
		}

	}
private void informDelete(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
	int informID = Integer.parseInt(request.getParameter("informID"));
	InformManagement im=new InformManagement();
	HttpSession session = request.getSession();
	if (im.informDeleteByID(informID)) {
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

private void informView(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
	ArrayList <Inform> al = new ArrayList <Inform> ();
	HttpSession session = request.getSession();
	InformManagement im=new InformManagement();
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
	try {
		response.sendRedirect("/book-management-system/jsp/informManage.jsp");
	} catch (IOException e) {
		e.printStackTrace();
	}
	}
	}

private void informAdd(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
	  Inform inform=new Inform();
	  HttpSession session=request.getSession();
	  Date date=new Date();
	  SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	  String time=df.format(date);
	  inform.setInformTime(time);
	  inform.setTitle(request.getParameter("title"));
	  inform.setInformTime(request.getParameter("informTime"));
	  inform.setInform(request.getParameter("inform"));
	  inform.setInformType(request.getParameter("informType"));
	  InformManagement im=new InformManagement();
	  if(im.informAdd(inform)){
		  this.informList(request,response);
	  }else
		{
			try {
				response.sendRedirect("/book-management-system/jsp/informAdd.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

private void informList(HttpServletRequest request, HttpServletResponse response) {
	// TODO Auto-generated method stub
	ArrayList al = new ArrayList();
	InformManagement im=new InformManagement();
	HttpSession session = request.getSession();
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
	try {
		response.sendRedirect("/book-management-system/jsp/informManage.jsp");
	} catch (IOException e) {
		e.printStackTrace();
	}
	
}

	// 取得各个类型通知的具体内容
	private void getInformByAjax(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("GB2312");
		response.setContentType("text/html;charset=GB2312");
		InformManagement im = new InformManagement();
		PrintWriter out = response.getWriter();
		String jsonInform = "{informList:[";
		ArrayList<Inform> informList = null;
		try {
			informList = im.getinform();
			for(int i=0;i<im.getsource().size();i++){
				informList.add(im.getsource().get(i));
			}
			for(int i=0;i<im.getnews().size();i++){
				informList.add(im.getnews().get(i));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for(int i = 0;i < informList.size();i++ ){
			Inform inform = informList.get(i);
			jsonInform = jsonInform + "{informTitle:'"+inform.getTitle()+"',informID:'"+inform.getInformID()+"'},";		
		}
		jsonInform = jsonInform + "]}";
		System.out.println(jsonInform);
		System.out.println("取得通知列表");
		out.print(jsonInform);
		
	}

	private void inform(HttpServletRequest request, HttpServletResponse response)
			throws SQLException {
		
		int informID = Integer.parseInt(request.getParameter("informID"));
		InformManagement im = new InformManagement();
		HttpSession session = request.getSession();
		Inform inform = new Inform();
		inform = im.getinformContent(informID);
		if (inform != null) {
			session.setAttribute("inform", inform);
		}
		try {
			response.sendRedirect("/book-management-system/jsp/inform.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
//点解首页“更多”进入informlist页面 取得类型为“通知公告”的通知列表
	private void moreInform(HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
		// TODO Auto-generated method stub
		InformManagement im = new InformManagement();
		ArrayList<Inform> informList = new ArrayList<Inform>();
		HttpSession session = request.getSession();
		int pageCount = 0;
		int recordSize = 0;
		int pageNow = 1;
		int pageSize = INFORMPAGESIZE;
		recordSize = im.getInformRecord("通知公告");
		if (recordSize % pageSize == 0) {
			pageCount = recordSize / pageSize;
		} else {
			pageCount = recordSize / pageSize + 1;
		}
		System.out.print(pageCount);
		informList = im.getFirstInform(pageNow, pageSize,"通知公告");
		session.setAttribute("informList", informList);
		session.setAttribute("pageCount", pageCount);
		session.setAttribute("pageNow", pageNow);
		try {
			response.sendRedirect("/book-management-system/jsp/informlist.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//informlist页面点击“资源动态列表” 取得类型为“资源动态”的通知列表
	private void moreSource(HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
		// TODO Auto-generated method stub
		InformManagement im = new InformManagement();
		ArrayList<Inform> sourceList = new ArrayList<Inform>();
		HttpSession session = request.getSession();
		int pageCount = 0;
		int recordSize = 0;
		int pageNow = 1;
		int pageSize = INFORMPAGESIZE;
		recordSize = im.getInformRecord("资源动态");
		if (recordSize % pageSize == 0) {
			pageCount = recordSize / pageSize;
		} else {
			pageCount = recordSize / pageSize + 1;
		}
		System.out.print(pageCount);
		sourceList = im.getFirstInform(pageNow, pageSize,"资源动态");
		session.setAttribute("sourceList", sourceList);
		session.setAttribute("pageCount", pageCount);
		session.setAttribute("pageNow", pageNow);
		try {
			response.sendRedirect("/book-management-system/jsp/sourcelist.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//sourcelist页面点击“新闻列表” 取得类型为“新闻”的通知列表
	private void moreNews(HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
		// TODO Auto-generated method stub
		InformManagement im = new InformManagement();
		ArrayList<Inform> newsList = new ArrayList<Inform>();
		HttpSession session = request.getSession();
		int pageCount = 0;
		int recordSize = 0;
		int pageNow = 1;
		int pageSize = INFORMPAGESIZE;
		recordSize = im.getInformRecord("新闻");
		if (recordSize % pageSize == 0) {
			pageCount = recordSize / pageSize;
		} else {
			pageCount = recordSize / pageSize + 1;
		}
		System.out.print(pageCount);
		newsList = im.getFirstInform(pageNow, pageSize,"新闻");
		session.setAttribute("newsList", newsList);
		session.setAttribute("pageCount", pageCount);
		session.setAttribute("pageNow", pageNow);
		try {
			response.sendRedirect("/book-management-system/jsp/newslist.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//点击informlist页面的页码取得对应页码的通知列表
	private void informPage(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		int pageCount = 0;// 总页数
		int pageNow = Integer.parseInt(request.getParameter("pageNow"));// 当前页
		int recordSize = 0;// 总的记录条数
		int pageSize = INFORMPAGESIZE;// 每页条数
		ArrayList<Inform> informList = new ArrayList<Inform>();
		InformManagement im = new InformManagement();
		String informType = "通知公告";
		recordSize = im.getInformRecord(informType);
		if (recordSize % pageSize == 0) {
			pageCount = recordSize / pageSize;
		} else {
			pageCount = recordSize / pageSize + 1;
		}
		informList = im.getCurrentInform(pageNow, pageSize,informType);
		HttpSession session = request.getSession();
		session.setAttribute("informList", informList);
		session.setAttribute("pageCount", pageCount);
		session.setAttribute("pageNow", pageNow);
		try {
			response.sendRedirect("/book-management-system/jsp/informlist.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	//点击sourecelist页面的页码取得对应页码的通知列表
	private void sourcePage(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		int pageCount = 0;// 总页数
		int pageNow = Integer.parseInt(request.getParameter("pageNow"));// 当前页
		int recordSize = 0;// 总的记录条数
		int pageSize = INFORMPAGESIZE;// 每页条数
		ArrayList<Inform> sourceList = new ArrayList<Inform>();
		InformManagement im = new InformManagement();
		String informType = "资源动态";
		recordSize = im.getInformRecord(informType);
		if (recordSize % pageSize == 0) {
			pageCount = recordSize / pageSize;
		} else {
			pageCount = recordSize / pageSize + 1;
		}
		sourceList = im.getCurrentInform(pageNow, pageSize,informType);
		HttpSession session = request.getSession();
		session.setAttribute("sourceList", sourceList);
		session.setAttribute("pageCount", pageCount);
		session.setAttribute("pageNow", pageNow);
		try {
			response.sendRedirect("/book-management-system/jsp/sourcelist.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	//点击newslist页面的页码取得对应页码的通知列表
	private void newsPage(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		int pageCount = 0;// 总页数
		int pageNow = Integer.parseInt(request.getParameter("pageNow"));// 当前页
		int recordSize = 0;// 总的记录条数
		int pageSize = INFORMPAGESIZE;// 每页条数
		ArrayList<Inform> newsList = new ArrayList<Inform>();
		InformManagement im = new InformManagement();
		String informType = "新闻";
		recordSize = im.getInformRecord(informType);
		if (recordSize % pageSize == 0) {
			pageCount = recordSize / pageSize;
		} else {
			pageCount = recordSize / pageSize + 1;
		}
		newsList = im.getCurrentInform(pageNow, pageSize,informType);
		HttpSession session = request.getSession();
		session.setAttribute("newsList", newsList);
		session.setAttribute("pageCount", pageCount);
		session.setAttribute("pageNow", pageNow);
		try {
			response.sendRedirect("/book-management-system/jsp/newslist.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
