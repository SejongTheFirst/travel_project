package book.model;

public class BookProduct {

	private Integer bookCode;
	private Integer productCode;
	private Integer productNum;
	private int price;
	private int days;
	private int guests;
	private int totalPrice;

	public BookProduct(Integer bookCode, Integer productNum, Integer productCode, int price, int days, int guest,
			int totalPrice) {
		this.productCode = productCode;
		this.productNum = productNum;
		this.bookCode = bookCode;
		this.price = price;
		this.days = days;
		this.guests = guest;
		this.totalPrice = totalPrice;
	}

	public Integer getProductCode() {
		return productCode;
	}

	public Integer getProductNum() {
		return productNum;
	}

	public Integer getBookCode() {
		return bookCode;
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
