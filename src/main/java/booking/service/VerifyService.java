package booking.service;

import java.sql.Connection;
import java.sql.SQLException;

import booking.dao.BookingDAO;
import jdbc.connection.ConnectionProvider;

public class VerifyService {

	private BookingDAO bookingDAO = new BookingDAO();

	public boolean isValid(BookingRequest bookingRequest) {
		try (Connection con = ConnectionProvider.getConnection()) {
			return !bookingDAO.isBookingExists(con, bookingRequest.getProductId(), bookingRequest.getStartDate(),
					bookingRequest.getEndDate());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
