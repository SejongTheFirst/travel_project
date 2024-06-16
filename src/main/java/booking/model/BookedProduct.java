package booking.model;

public class BookedProduct {

	private Integer bookedProductId;
	private Integer productId;
	private Integer bookingId;
	private int price;
	private int days;
	private int guests;
	private int totalPrice;

	public BookedProduct(Integer bookedProductId, Integer productId, Integer bookingId, int price, int days, int guests,
			int totalPrice) {
		this.bookedProductId = bookedProductId;
		this.productId = productId;
		this.bookingId = bookingId;
		this.price = price;
		this.days = days;
		this.guests = guests;
		this.totalPrice = totalPrice;
	}

	public Integer getBookedProductId() {
		return bookedProductId;
	}

	public Integer getProductId() {
		return productId;
	}

	public Integer getBookingId() {
		return bookingId;
	}

	public int getPrice() {
		return price;
	}

	public int getDays() {
		return days;
	}

	public int getGuests() {
		return guests;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

}
