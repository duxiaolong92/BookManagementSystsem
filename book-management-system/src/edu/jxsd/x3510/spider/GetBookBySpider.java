package edu.jxsd.x3510.spider;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.apache.http.client.ClientProtocolException;

import edu.jxsd.x3510.bean.Book;

//根据输入的search 来获取 图书信息
public class GetBookBySpider {
	
	public ArrayList<Book> setBook(String search,String bookTypeName) throws ClientProtocolException, IOException{
		ArrayList<Book> bookList = new ArrayList<Book>();
		ArrayList<String> urlList = null;
		DownPageFromURL dp = new DownPageFromURL();
		DownImageFromURL downImage = new DownImageFromURL();
		String [][] bookType = new String[6][];
		bookType[0] = new String[]{"文学","小说","文学","随笔","中国文学","杂文","散文","外国名著"};
		bookType[1] = new String[]{"流行","漫画","推理","青春","言情","武侠","奇幻"};
		bookType[2] = new String[]{"历史","历史","传记","政治"};
		bookType[3] = new String[]{"生活","爱情","生活","励志"};
		bookType[4] = new String[]{"经管","经济学","管理","管理","金融","营销"};
		bookType[5] = new String[]{"科技","科普","互联网","交互设计","中国文学","编程"};
		String imageURL = null;
		String bookImageSaveAddress = null;
		Book book = null;
		FunctionUtils fu = new FunctionUtils();
		int size = 0;
		String[] NAPM = null;
		String context = null;
		for(int i = 0;i < 6;i++){
			for(int j = 1;j < bookType[i].length;j++){
				if(search.equals(bookType[i][j])){
					urlList = fu.getAllUrlByType(search);
					bookTypeName = bookType[i][0];
				}
			}
		}
		if(urlList == null){
			urlList = fu.getAllUrl(search);
		}
		size = urlList.size();
		Date date=new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String time=df.format(date); 
		for(int i =0 ;i < size ;i++){
			context = dp.getContext(urlList.get(i));
			book = new Book();
			NAPM = fu.getBookNAPM(context);
			book.setBookTypeName(bookTypeName);
			book.setReadingRoomName(bookTypeName+"阅览室");
			book.setBookName(NAPM[0]);
			book.setAuthor(NAPM[1]);
			book.setPress(NAPM[2]);
			book.setISBN(fu.getBookISBN(context));
			imageURL = fu.getBookImage(context);
			if(imageURL != null){
				bookImageSaveAddress = downImage.downImage(imageURL, book.getISBN());
				System.out.println("bookimage"+bookImageSaveAddress);
				book.setBookImage(bookImageSaveAddress);
			}	
			book.setSummargNote(fu.getBookSummary(context));
			book.setPrice(fu.getBookPrice(context));
			book.setStorageTime(time);
			if(book.getAuthor()==null||book.getBookImage()==null||book.getBookName()==null||book.getBookTypeName()==null||book.getISBN()==null||book.getPress()==null||book.getPrice()==0){
				continue;
			}
			System.out.println(book.getAuthor());
			System.out.println(book.getBookImage());
			System.out.println(book.getBookName());
			System.out.println(book.getISBN());
			System.out.println(book.getPress());
			System.out.println(book.getPrice());
			System.out.println(book.getStorageTime());
			System.out.println(book.getSummargNote());
			bookList.add(book);
		}
		return bookList;
	}
	
/*	public static void main(String[] args) throws ClientProtocolException, IOException{
		GetBookBySpider gbb = new GetBookBySpider();
		String search = "韩寒";
		gbb.setBook(search,"文学");
	}*/
}
