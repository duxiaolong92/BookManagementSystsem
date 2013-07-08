package edu.jxsd.x3510.servlet;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.Date;
import java.util.Properties;
import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.sun.mail.handlers.multipart_mixed;

import edu.jxsd.x3510.bean.Reader;
import edu.jxsd.x3510.dao.ReaderManagement;


public class MailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String host = "smtp.gmail.com";
	private String userName = "cuidashax3510@gmail.com";
    private String password = "x3510x3510";
    private String personalName = "图书管理系统";
    private Properties props;
   
    public MailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String actionType;
		actionType = request.getParameter("actionType");
		if (actionType.equals("resetPassword")) {
			this.resetPassword(request, response);
		}else if(actionType.equals("comfirmRegister")) {
			this.comfirmRegister(request, response);
		}
			
	}
	

	private void comfirmRegister(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html;charset=gb2312");
		String email = request.getParameter("email");
		String from = "cuidashax3510@gmail.com";
		String subject = "欢迎使用图书馆";
		String text = "";
		String readerName;
		String comfirmRegisterAddress = null;
		Reader reader = null;
		ReaderManagement rm = new ReaderManagement();
		try {
			reader = rm.checkEmailReset(email);
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		
			if(reader == null){
				request.setAttribute("email", "error");
				request.getRequestDispatcher("jsp/resetPassword.jsp").forward(
						request, response);
			}else{				
				try {
					readerName = reader.getReaderName();
					comfirmRegisterAddress = "http://localhost:8080/book-management-system/ReaderServlet?actionType=activate&email="+reader.getEmail()+"&activate=1";
					System.out.println(comfirmRegisterAddress);
					text = "<html><body>" +
							"<div style='background: none repeat #FFFFFF; border: 1px solid #E9E9E9;width:550px; margin-top:20px;margin-left:150px;padding: 30px;'>"+
							"<p style='padding-left:15px;'> "+reader.getReaderName()+" 你好 </P>" +
							"<p  style='border-top: 1px solid #DDDDDD;margin: 15px 0 25px;padding-left: 15px;'>"+
							"这是一封来自图书馆的注册确认信，请点击下面的链接地址，激活账号完成注册：:"+
							"<br><a href='"+comfirmRegisterAddress+"'>"+comfirmRegisterAddress+"</a>"+
							"</p>"+
							"<p  style='border-top: 1px solid #DDDDDD;padding-left: 15px; padding-top:6px; margin-top:25px; color:#838383;'>"+
							" 图书管理系统 2012&nbsp; 这是一封系统邮件，请不要直接回复。</p>"+
							"</div>"+
							"</body></html>";
					Message message = getMessage(from, email, subject, text);
					Transport.send(message);
					response.getWriter().println("邮件发送成功");
					System.out.println(reader.getEmail());
					response.sendRedirect("/book-management-system/jsp/success.jsp");
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}	
	}


	private void resetPassword(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html;charset=gb2312");
		String to = request.getParameter("to");
		String from = "cuidashax3510@gmail.com";
		String subject = "设置新密码";
		String text = "";
		String readerName;
		String resetAddress = null;
		Reader reader = null;
		ReaderManagement rm = new ReaderManagement();
		try {
			reader = rm.checkEmailReset(to);
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		
			if(reader == null){
				request.setAttribute("email", "error");
				request.getRequestDispatcher("jsp/resetPassword.jsp").forward(
						request, response);
			}else{				
				try {
					readerName = reader.getReaderName();
					resetAddress = "http://localhost:8080/book-management-system/jsp/resetForm.jsp?email="+reader.getEmail()+"";
					System.out.println(resetAddress);
					text = "<html><body>" +
							"<div style='background: none repeat #FFFFFF; border: 1px solid #E9E9E9;width:550px; margin-top:20px;margin-left:150px;padding: 30px;'>"+
							"<p style='padding-left:15px;'> "+reader.getReaderName()+" 你好 </P>" +
							"<p  style='border-top: 1px solid #DDDDDD;margin: 15px 0 25px;padding-left: 15px;'>"+
							"图书管理系统已经收到了你的密码重置请求，请您点击此链接重置密码:"+
							"<br><a href='"+resetAddress+"'>"+resetAddress+"</a>"+
							"</p>"+
							"<p  style='border-top: 1px solid #DDDDDD;padding-left: 15px; padding-top:6px; margin-top:25px; color:#838383;'>"+
							" 图书管理系统 2012&nbsp; 这是一封系统邮件，请不要直接回复。</p>"+
							"</div>"+
							"</body></html>";
					Message message = getMessage(from, to, subject, text);
					Transport.send(message);
					response.getWriter().println("邮件发送成功");
					System.out.println(reader.getEmail());
					response.sendRedirect("/book-management-system/jsp/resetPasswordTips.jsp?email="+reader.getEmail()+"");
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}	
	}


	public void init(){
		 props = new Properties();
		 props.put("mail.smtp.host", host);
         props.put("mail.smtp.auth", "true");
         props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
         props.setProperty("mail.smtp.socketFactory.fallback", "false"); 
         props.setProperty("mail.smtp.port", "465"); 
         props.setProperty("mail.smtp.socketFactory.port", "465"); 
	}
	
    public class Email_Autherticator extends Authenticator
    {
        public Email_Autherticator()
        {
            super();
        }

        public Email_Autherticator(String user, String pwd)
        {
            super();
            userName = user;
            password = pwd;
        }

        public PasswordAuthentication getPasswordAuthentication()
        {
            return new PasswordAuthentication(userName, password);
        }
    }
	
	private Message getMessage(String from, String to, String subject,
			String text) throws MessagingException, UnsupportedEncodingException {
		Authenticator auth = new Email_Autherticator();
		Session session = Session.getDefaultInstance(props, auth);
		Message message = new MimeMessage(session);
		message.setSubject(subject); // 设置邮件主题
		//MimeBodyPart htmlPart  = new MimeBodyPart();
		//htmlPart.setContent(text, "text/html;charset=gb2312");
	/*	Multipart multiPart = new MimeMultipart(); 
		multiPart.addBodyPart(htmlPart);*/
		//message.setContent(multiPart);
		message.setContent(text, "text/html;charset=gb2312");
	//	message.setText(text); // 设置邮件正文
		message.setSentDate(new Date()); // 设置邮件发送日期
		Address address = new InternetAddress(from, personalName);
		message.setFrom(address); // 设置邮件发送者的地址
		Address toAddress = new InternetAddress(to); // 设置邮件接收方的地址
		message.addRecipient(Message.RecipientType.TO, toAddress);
		return message;
	}

}
