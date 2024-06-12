package payment.model;

public class Payment {

	private Integer id;
	private String merchantUid;
	private String paymentMethod;
	private String buyerEmail;
	private String buyerName;
	private String buyerTel;
	private Integer bookCode;

	public Payment(Integer id, String merchantUid, String paymentMethod, String buyerEmail, String buyerName,
			String buyerTel, Integer bookCode) {
		this.id = id;
		this.merchantUid = merchantUid;
		this.paymentMethod = paymentMethod;
		this.buyerEmail = buyerEmail;
		this.buyerName = buyerName;
		this.buyerTel = buyerTel;
		this.bookCode = bookCode;
	}

	public Integer getId() {
		return id;
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

	public Integer getBookCode() {
		return bookCode;
	}

}
