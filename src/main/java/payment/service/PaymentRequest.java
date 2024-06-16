package payment.service;

import java.util.Map;

import booking.model.Customer;

public class PaymentRequest {
	private String merchantUid;
	private int totalPrice;
	private Customer customer;
	private String buyerEmail;
	private String buyerName;
	private String buyerTel;
	private int productId;
	private String productTitle;
	private int productPrice;
	private String startDate;
	private String endDate;
	private int days;
	private int guest;
	private String sellerId;
	private String imageUrl;
	private String title;
	private String location;
	private String paymentMethod;

	public PaymentRequest(String merchantUid, int totalPrice, Customer customer, String buyerEmail, String buyerName,
			String buyerTel, int productId, String productTitle, int productPrice, String startDate, String endDate,
			int days, int guest, String sellerId, String imageUrl, String title, String location,
			String paymentMethod) {
		this.merchantUid = merchantUid;
		this.totalPrice = totalPrice;
		this.customer = customer;
		this.buyerEmail = buyerEmail;
		this.buyerName = buyerName;
		this.buyerTel = buyerTel;
		this.productId = productId;
		this.productTitle = productTitle;
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

	public int getTotalPrice() {
		return totalPrice;
	}

	public Customer getCustomer() {
		return customer;
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

	public String getProductTitle() {
		return productTitle;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public String getStartDate() {
		return startDate;
	}

	public String getEndDate() {
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
