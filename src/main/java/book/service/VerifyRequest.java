package book.service;

public class VerifyRequest {

	private int productNum;
	private String title;
	private int price;
	private int guest;
	private String sellerId;
	private String imageUrl;
	private String startDate;
	private String endDate;
	private int totalPrice;
	private int days;
	private String location;

	public VerifyRequest(int productNum, String title, int price, int guest, String location,  String sellerId,
			String imageUrl, String startDate, String endDate, int totalPrice, int days) {
		this.productNum = productNum;
		this.title = title;
		this.price = price;
		this.guest = guest;
		this.location = location;
		this.sellerId = sellerId;
		this.imageUrl = imageUrl;
		this.startDate = startDate;
		this.endDate = endDate;
		this.totalPrice = totalPrice;
		this.days = days;
	}

	public int getProductNum() {
		return productNum;
	}

	public String getTitle() {
		return title;
	}

	public int getPrice() {
		return price;
	}

	public int getGuest() {
		return guest;
	}

	public String getLocation() {
		return location;
	}

	public String getSellerId() {
		return sellerId;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public String getStartDate() {
		return startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public int getDays() {
		return days;
	}

}
