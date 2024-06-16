package booking.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import booking.dao.BookingDAO;
import booking.dao.BookedProductDAO;
import booking.model.Booking;
import booking.model.BookedProduct;
import booking.model.Customer;
import jdbc.connection.ConnectionProvider;

public class ListBookingService {

	private BookingDAO bookingDAO = new BookingDAO();
	private BookedProductDAO bookedProductDAO = new BookedProductDAO();
	private int size = 10;

	public BookingPage getBookingPage(int pageNum, Customer customer) {
		try (Connection con = ConnectionProvider.getConnection()) {
			int total = bookingDAO.selectCount(con);

			List<Booking> bookings = bookingDAO.selectByBuyerId(con, customer, (pageNum - 1) * size, size);
			List<BookingData> data = new ArrayList<>();

			for (Booking booking : bookings) {
				List<BookedProduct> bookedProducts = bookedProductDAO.selectByBookingId(con, booking.getBookingId(),
						(pageNum - 1) * size, size);
				data.add(new BookingData(booking, bookedProducts));
			}
			return new BookingPage(total, pageNum, size, data);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
