package book.model;

import java.util.Date;

public class Book {
	private Integer bookCode;
	private Seller seller;
	private Customer customer;
	private String title;
	private String location;
	private String imgUrl;
	private Date startDate;
	private Date endDate;

	public Book(Integer bookCode, Seller seller, Customer customer, String title, String location, String imgUrl,
			Date startDate, Date endDate) {
		this.bookCode = bookCode;
		this.seller = seller;
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

	public Seller getSeller() {
		return seller;
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
