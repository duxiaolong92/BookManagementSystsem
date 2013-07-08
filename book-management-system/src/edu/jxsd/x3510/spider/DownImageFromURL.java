package edu.jxsd.x3510.spider;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

public class DownImageFromURL {

	//根据图书图片的地址，把图片下载下来，返回保存到电脑上的地址
	public static String downImage(String url,String ISBN) throws ClientProtocolException, IOException {
		HttpClient httpclient = new DefaultHttpClient();
		InputStream instream = null;
		String bookImageSaveAddress = "D:/book-images/"+ISBN+".jpg";
		File file = new File(bookImageSaveAddress);
		String filePath=file.getAbsolutePath();
		System.out.println("绝对路径"+filePath);
		try {
			HttpGet httpget = new HttpGet(url);
			System.out.println("executing request " + httpget.getURI());
			HttpResponse response = httpclient.execute(httpget);
			HttpEntity entity = response.getEntity();
			System.out.println("----------------------------------------");
			System.out.println(response.getStatusLine());
			if (entity != null) {
				System.out.println("Response content length: "
						+ entity.getContentLength());
				instream = entity.getContent();
				OutputStream out = new BufferedOutputStream(new FileOutputStream(file));
				byte[] buff = new byte[(int) entity.getContentLength()];
				for (int i = 0; (i = instream.read(buff)) > 0;) {
					out.write(buff, 0, i);
				}
				out.close();
				instream.close();
				}
			;
			System.out.println("----------------------------------------");
			httpget.abort();
		} finally {
			httpclient.getConnectionManager().shutdown();
		}
		return bookImageSaveAddress;
	}
	
	/*public static void main(String[] args){
		DownImageFromURL di = new DownImageFromURL();
		try {
			DownImageFromURL.getContext("http://img3.douban.com/view/ark_article_cover/cut/public/326145.jpg?v=1351491274.0");
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/

}
