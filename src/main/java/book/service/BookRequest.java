package book.service;

import java.sql.Date;
import java.util.Map;

public class BookRequest {
	private String merchantUid;
	private int amount;
	private String buyerEmail;
	private String buyerName;
	private String buyerTel;
	private int productId;
	private String productName;
	private int productPrice;
	private java.sql.Date startDate;
	private java.sql.Date endDate;
	private int days;
	private int guest;
	private String sellerId;
	private String imageUrl;
	private String title;
	private String location;
	private String paymentMethod;

	public BookRequest(String merchantUid, int amount, String buyerEmail, String buyerName, String buyerTel,
			int productId, String productName, int productPrice, Date startDate, Date endDate, int days, int guest,
			String sellerId, String imageUrl, String title, String location, String paymentMethod) {
		this.merchantUid = merchantUid;
		this.amount = amount;
		this.buyerEmail = buyerEmail;
		this.buyerName = buyerName;
		this.buyerTel = buyerTel;
		this.productId = productId;
		this.productName = productName;
		this.productPrice = productPrice;
		this.startDate = startDate;
		this.endDate = endDate;
		this.days = days;
		this.guest = guest;
		this.sellerId = sellerId;
		this.imageUrl = imageUrl;
		this.title = title;
		this.location = location;
		this.paymentMethod = paymentMethod;
	}

	public String getMerchantUid() {
		return merchantUid;
	}

	public int getAmount() {
		return amount;
	}

	public String getBuyerEmail() {
		return buyerEmail;
	}

	public String getBuyerName() {
		return buyerName;
	}

	public String getBuyerTel() {
		return buyerTel;
	}

	public int getProductId() {
		return productId;
	}

	public String getProductName() {
		return productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public java.sql.Date getStartDate() {
		return startDate;
	}

	public java.sql.Date getEndDate() {
		return endDate;
	}

	public int getDays() {
		return days;
	}

	public int getGuest() {
		return guest;
	}

	public String getSellerId() {
		return sellerId;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public String getTitle() {
		return title;
	}

	public String getLocation() {
		return location;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void validate(Map<String, Boolean> errors) {
		if (merchantUid == null || merchantUid.trim().isEmpty()) {
			errors.put("merchantUid", Boolean.TRUE);
		}
	}
}
