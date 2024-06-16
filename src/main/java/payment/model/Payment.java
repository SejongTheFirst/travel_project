package payment.model;

public class Payment {

	private Integer paymentId;
	private Integer bookingId;
	private String merchantUid;
	private String paymentMethod;
	private String buyerEmail;
	private String buyerName;
	private String buyerTel;

	public Payment(Integer paymentId, Integer bookingId, String merchantUid, String paymentMethod, String buyerEmail,
			String buyerName, String buyerTel) {
		this.paymentId = paymentId;
		this.bookingId = bookingId;
		this.merchantUid = merchantUid;
		this.paymentMethod = paymentMethod;
		this.buyerEmail = buyerEmail;
		this.buyerName = buyerName;
		this.buyerTel = buyerTel;
	}

	public Integer getPaymentId() {
		return paymentId;
	}

	public Integer getBookingId() {
		return bookingId;
	}

	public String getMerchantUid() {
		return merchantUid;
	}

	public String getPaymentMethod() {
		return paymentMethod;
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

}
