package booking.service;

import java.util.List;

import booking.model.Booking;
import booking.model.BookedProduct;

public class BookingData {

	private Booking booking;
	private List<BookedProduct> bookedProducts;

	public BookingData(Booking booking, List<BookedProduct> bookedProducts) {
		this.booking = booking;
		this.bookedProducts = bookedProducts;
	}

	public Booking getBooking() {
		return booking;
	}

	public List<BookedProduct> getBookedProducts() {
		return bookedProducts;
	}
}
