package edu.jxsd.x3510.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.apache.catalina.Session;

public class AuthImg extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int WIDTH = 90;
	private static final int HEIGHT = 24;
	public String randNum = "";
       
    public AuthImg() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BufferedImage image = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics();
		setBackground(g);//设置背景色
		setBorder(g);//设置边框
		drawRandomline(g);//画干扰线
		randNum = drawRandomNum(g, request);//写随机数
		HttpSession session = request.getSession();  
        session.setAttribute("randNum",randNum);  
        g.dispose();  
		ImageIO.write(image, "jpg", response.getOutputStream());	
	}

	
	private String drawRandomNum(Graphics g,HttpServletRequest request) {
		// TODO Auto-generated method stub
		int i;
		int x = 10;
		String randNum = "";
		g.setColor(Color.GRAY);
		g.setFont(new Font("Tahoma", Font.BOLD, 20));
		for(i = 0;i < 4;i++)
		{
			char b = (char)(Math.random()*26+'a');
			String a = (String.valueOf(b));
			randNum = randNum + a;
			//String a = String.valueOf((new Random().nextInt(10))); 
			g.drawString(a,x,20);
			x = x + 20;
		}
		return randNum;
	}
	


	private void drawRandomline(Graphics g) {
		// TODO Auto-generated method stub
		g.setColor(Color.black );
		int i;
		for(i = 0;i < 10;i++)
		{
			int x1 = new Random().nextInt(WIDTH);
			int y1 = new Random().nextInt(HEIGHT);
			int x2 = new Random().nextInt(WIDTH);
			int y2 = new Random().nextInt(HEIGHT);
			g.drawLine(x1, y1, x2, y2);
		}
		
	}
	


	private void setBackground(Graphics g) {
		g.fillRect(0, 0, WIDTH, HEIGHT);
	}

	
	private void setBorder(Graphics g) {
		g.setColor(Color.gray);
		g.drawRect(0, 0, WIDTH-2, HEIGHT-2);
	}
	
/*	static public String getAuthCode(HttpSession session){
	    //返回验证码
	    return (String)session.getAttribute("randNum");
	   }*/
}
