package booking.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import booking.dao.BookedProductDAO;
import booking.dao.BookingDAO;
import booking.model.BookedProduct;
import booking.model.Booking;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import payment.dao.PaymentDAO;
import payment.model.Payment;
import payment.service.PaymentRequest;

public class BookingService {
	private BookingDAO bookingDAO = new BookingDAO();
	private BookedProductDAO bookedProductDAO = new BookedProductDAO();
	private PaymentDAO paymentDAO = new PaymentDAO();

	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

	public boolean isValid(PaymentRequest paymentRequest) {
		return true;
	}

	public Integer insert(PaymentRequest request) throws SQLException {
		Connection con = null;

		try {
			con = ConnectionProvider.getConnection();
			con.setAutoCommit(false);

			Booking booking = toBooking(request);
			Booking savedBooking = bookingDAO.insert(con, booking);

			if (savedBooking == null) {
				throw new RuntimeException("fail to insert booking");
			}

			BookedProduct bookedProduct = toBookedProduct(savedBooking, request);
			BookedProduct savedBookedProduct = bookedProductDAO.insert(con, bookedProduct, savedBooking);

			if (savedBookedProduct == null) {
				throw new RuntimeException("fail to insert booked_product");
			}

			Payment payment = toPayment(savedBooking, request);
			Payment savedPayment = paymentDAO.insert(con, payment, savedBooking);

			if (savedPayment == null) {
				throw new RuntimeException("fail to insert payment");
			}

			con.commit();

			return savedBooking.getBookingId();
		} catch (SQLException e) {
			JdbcUtil.rollback(con);
			throw new RuntimeException(e);
		} catch (RuntimeException e) {
			JdbcUtil.rollback(con);
			throw e;
		} finally {
			JdbcUtil.close(con);
		}
	}

	private Booking toBooking(PaymentRequest request) {
		return new Booking(null, request.getSellerId(), request.getCustomer(), request.getTitle(),
				request.getLocation(), request.getImageUrl(), toDate(request.getStartDate()), toDate(request.getEndDate()));
	}

	private BookedProduct toBookedProduct(Booking savedBooking, PaymentRequest request) {
		return new BookedProduct(savedBooking.getBookingId(), request.getProductId(), savedBooking.getBookingId(),
				request.getProductPrice(), request.getDays(), request.getGuest(), request.getTotalPrice());
	}

	private Payment toPayment(Booking savedBooking, PaymentRequest request) {
		return new Payment(null, savedBooking.getBookingId(), request.getMerchantUid(), request.getPaymentMethod(),
				request.getBuyerEmail(), request.getBuyerName(), request.getBuyerTel());
	}

	private Date toDate(String date) {
		try {
			return dateFormat.parse(date);
		} catch (ParseException e) {
			throw new RuntimeException("date parse fail", e);
		}
	}
}
