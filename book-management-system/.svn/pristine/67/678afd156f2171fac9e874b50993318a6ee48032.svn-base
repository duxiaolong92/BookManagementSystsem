package edu.jxsd.x3510.spider;

import java.io.IOException;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.http.client.ClientProtocolException;

public class FunctionUtils {
	static int PAGESIZE = 3;
	static String regExUrl = "http://book\\.douban\\.com/subject/[0-9]+/";// 匹配图书的网址
	static String regExNAPM = "<meta name=\"keywords\" content=\".*\">";// 匹配书名，作者，出版社，出版月份
	static String regExISBN = "<span class=\"pl\">ISBN:</span>[0-9 \"]+";// 匹配ISBN
	static String regExPrice = "<span class=\"pl\">定价:.*";// 匹配图书定价
	static String regExImage = "http://img3.douban.com/mpic/s[0-9]+.jpg";// 匹配图书图片
	static String regExSummary = "<div class=\"intro\">[\\s\\S]*?</div>";// 匹配图书简介
	static DownPageFromURL dp = new DownPageFromURL();

	//通过搜索书的类型 得到url地址
	public ArrayList<String> getAllUrlByType(String search) throws ClientProtocolException,
			IOException {
		ArrayList<String> urlList = new ArrayList<String>();
		String url = null;
		int start = 0;
		
		for(int i =0 ;i < PAGESIZE;i++){
			start = 20 * i;
			url = "http://book.douban.com/tag/"+search+"?start="+start+"&type=T";	
			String context = dp.getContext(url);
			Pattern p = Pattern.compile(regExUrl);
			Matcher m = p.matcher(context);
			String urlSearch = "";
			while (m.find()) {
				if (urlSearch.equals(m.group())) {

				} else {
					urlSearch = m.group();
					urlList.add(urlSearch);
					System.out.println(urlSearch);
				}
			}
		}	
		return urlList;
	}
	
	
	
	//通过搜索书名、作者或ISBN 得到url地址
	public ArrayList <String>getAllUrl(String search) throws ClientProtocolException,
			IOException {
		ArrayList<String> urlList = new ArrayList<String>();
		String url = null;	
		url = "http://book.douban.com/subject_search?search_text="
				+ search + "&cat=1003";
		String context = dp.getContext(url);
		Pattern p = Pattern.compile(regExUrl);
		Matcher m = p.matcher(context);
		String urlSearch = "";
		while (m.find()) {
			if (urlSearch.equals(m.group())) {

			} else {
				urlSearch = m.group();
				urlList.add(urlSearch);
				System.out.println(urlSearch);
			}
		}
		return urlList;
	}

	//字符串匹配 图书简介
	public String getBookSummary(String context) throws ClientProtocolException,
			IOException {
		String summary = null;
		Pattern p = Pattern.compile(regExSummary);
		Matcher m = p.matcher(context);
		String res = " ";
		if (m.find()) {
			res = m.group();
		}
		p = Pattern.compile("<p>.*</p>");
		m = p.matcher(res);
		if (m.find()) {
			summary = m.group();
		}
		return summary;
	}

	//字符串匹配 得到书名 作者 出版社 出版时间
	public String[] getBookNAPM(String context) throws ClientProtocolException,
			IOException {
		String[] NAPM = new String[4];//0是书名1是作者2是出版社3是出版时间
		Pattern p = Pattern.compile(regExNAPM);
		Matcher m = p.matcher(context);
		String res = " ";
		if (m.find()) {
			res = m.group();
		}
		String[] results = res.split("\"");
		results = results[3].split(",");
		if(results.length > 4){
			for (int i = 0; i < 4; i++) {
				NAPM[i] = results[i];
			}
		}else{
			for (int i = 0; i < results.length; i++) {
				NAPM[i] = results[i];
			}
			for(int i = results.length;i<4;i++){
				NAPM[i] = null;
			}
		}
		return NAPM;
	}

	//字符串匹配 得到图书价格
	public float getBookPrice(String context) throws ClientProtocolException,
			IOException {
		float price = 0;
		Pattern p = Pattern.compile(regExPrice);
		Matcher m = p.matcher(context);
		String res = " ";
		if (m.find()) {
			res = m.group();
		}
		p = Pattern.compile("[0-9.]+");
		m = p.matcher(res);
		if (m.find()) {
			price = Float.parseFloat(m.group());
		}

		return price;
	}

	//字符串匹配得到ISBN
	public String getBookISBN(String context) throws ClientProtocolException,
			IOException {
		String price = null;
		Pattern p = Pattern.compile(regExISBN);
		Matcher m = p.matcher(context);
		String res = " ";
		if (m.find()) {
			res = m.group();
		}
		p = Pattern.compile("[0-9]+");
		m = p.matcher(res);
		if (m.find()) {
			price = m.group();
		}
		return price;
	}

	//得到图书图片 地址
	public String getBookImage(String context) throws ClientProtocolException,
			IOException {
		String image = null;
		Pattern p = Pattern.compile(regExImage);
		Matcher m = p.matcher(context);
		if (m.find()) {
			image = m.group();
		}
		return image;
	}

	
	
	public static void main(String[] arg) throws ClientProtocolException,
			IOException {
		String url = "http://book.douban.com/subject/5290564/";
		String context = dp.getContext(url);
		FunctionUtils fu = new FunctionUtils();
	/*	 * String url =
		 * "http://book.douban.com/subject_search?search_text=韩寒&cat=1003";
		 * String context = dp.getContext(url); System.out.println(context);*/
		 
		// ArrayList<String> urlList = null;
		// urlList = fu.getAllUrl("韩寒");
		// fu.getBookISBN("http://book.douban.com/subject/5292912/");
		// fu.getBookImage("http://book.douban.com/subject/5292912/");
	//	fu.getBookNAPM("http://book.douban.com/subject/5292912/");
		fu.getBookSummary(context);
	}
}
