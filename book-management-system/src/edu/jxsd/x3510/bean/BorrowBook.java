package edu.jxsd.x3510.bean;

import java.sql.Date;

public class BorrowBook {
	private int bookID;
	private String readerID;
	private String bookName;
	private Date borrowTime;
	private Date returnTime;
	private String readingRoomName;
	
	public Date getBorrowTime() {
		return borrowTime;
	}
	public void setBorrowTime(Date borrowTime) {
		this.borrowTime = borrowTime;
	}
	public Date getReturnTime() {
		return returnTime;
	}
	public void setReturnTime(Date returnTime) {
		this.returnTime = returnTime;
	}
	public String getReaderID() {
		return readerID;
	}
	public void setReaderID(String readerID) {
		this.readerID = readerID;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public int getBookID() {
		return bookID;
	}
	public void setBookID(int bookID) {
		this.bookID = bookID;
	}
	public String getReadingRoomName() {
		return readingRoomName;
	}
	public void setReadingRoomName(String readingRoomName) {
		this.readingRoomName = readingRoomName;
	}
}
