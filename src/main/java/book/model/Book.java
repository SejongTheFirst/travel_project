package book.model;

import java.util.Date;

public class Book {
	private Integer bookCode;
	private String sellerId;
	private Customer customer;
	private String title;
	private String location;
	private String imgUrl;
	private Date startDate;
	private Date endDate;

	public Book(Integer bookCode, String sellerId, Customer customer, String title, String location, String imgUrl,
			Date startDate, Date endDate) {
		this.bookCode = bookCode;
		this.sellerId = sellerId;
		this.customer = customer;
		this.title = title;
		this.location = location;
		this.imgUrl = imgUrl;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	public Integer getBookCode() {
		return bookCode;
	}

	public String getSellerId() {
		return sellerId;
	}

	public Customer getCustomer() {
		return customer;
	}

	public String getTitle() {
		return title;
	}

	public String getLocation() {
		return location;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public Date getStartDate() {
		return startDate;
	}

	public Date getEndDate() {
		return endDate;
	}
}
