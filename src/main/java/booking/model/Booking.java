package booking.model;

import java.util.Date;

public class Booking {
	private Integer bookingId;
	private String sellerId;
	private Customer customer;
	private String bookingTitle;
	private String location;
	private String imgUrl;
	private Date startDate;
	private Date endDate;

	public Booking(Integer bookingId, String sellerId, Customer customer, String bookingTitle, String location,
			String imgUrl, Date startDate, Date endDate) {
		this.bookingId = bookingId;
		this.sellerId = sellerId;
		this.customer = customer;
		this.bookingTitle = bookingTitle;
		this.location = location;
		this.imgUrl = imgUrl;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	public Integer getBookingId() {
		return bookingId;
	}

	public String getSellerId() {
		return sellerId;
	}

	public Customer getCustomer() {
		return customer;
	}

	public String getBookingTitle() {
		return bookingTitle;
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
