package booking.service;

public class BookingRequest {
	private int productId;
	private String title;
	private int price;
	private int maxGuests;
	private String location;
	private String sellerId;
	private String imageUrl;
	private String startDate;
	private String endDate;
	private int totalPrice;
	private int days;

	public BookingRequest(int productId, String title, int price, int maxGuests, String location, String sellerId,
			String imageUrl, String startDate, String endDate, int totalPrice, int days) {
		this.productId = productId;
		this.title = title;
		this.price = price;
		this.maxGuests = maxGuests;
		this.location = location;
		this.sellerId = sellerId;
		this.imageUrl = imageUrl;
		this.startDate = startDate;
		this.endDate = endDate;
		this.totalPrice = totalPrice;
		this.days = days;
	}

	public int getProductId() {
		return productId;
	}

	public String getTitle() {
		return title;
	}

	public int getPrice() {
		return price;
	}

	public int getMaxGuests() {
		return maxGuests;
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
