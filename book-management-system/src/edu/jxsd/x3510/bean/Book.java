package edu.jxsd.x3510.bean;


public class Book {
	private int bookID;
	private String ISBN;
	private String bookName;
	private String press;
	private String author;
	private float price;
	private String storageTime;
	private String bookTypeName;
	private String readingRoomName;
	private String SummargNote;
	private String bookImage; 
	private String status;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getBookImage() {
		return bookImage;
	}
	public void setBookImage(String bookImage) {
		this.bookImage = bookImage;
	}
	private int borrowedTimes;
	public int getBorrowedTimes() {
		return borrowedTimes;
	}
	public void setBorrowedTimes(int borrowedTimes) {
		this.borrowedTimes = borrowedTimes;
	}
	public int getBookID() {
		return bookID;
	}
	public void setBookID(int bookID) {
		this.bookID = bookID;
	}
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getPress() {
		return press;
	}
	public void setPress(String press) {
		this.press = press;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getStorageTime() {
		return storageTime;
	}
	public void setStorageTime(String storageTime) {
		this.storageTime = storageTime;
	}
	public String getBookTypeName() {
		return bookTypeName;
	}
	public void setBookTypeName(String bookTypeName) {
		this.bookTypeName = bookTypeName;
	}
	public String getReadingRoomName() {
		return readingRoomName;
	}
	public void setReadingRoomName(String readingRoomName) {
		this.readingRoomName = readingRoomName;
	}
	public String getSummargNote() {
		return SummargNote;
	}
	public void setSummargNote(String summargNote) {
		SummargNote = summargNote;
	}
}
