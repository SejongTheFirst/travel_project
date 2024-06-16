package payment.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import booking.model.Booking;
import jdbc.JdbcUtil;
import payment.model.Payment;

public class PaymentDAO {

	// BookingService
	public Payment insert(Connection con, Payment payment, Booking booking) throws SQLException {
		PreparedStatement ps = null;
		Statement stmt = null;
		ResultSet rs = null;

		String query = "insert into payment (booking_id, merchant_uid, payment_method, buyer_email, buyer_name, buyer_tel) values(?, ?, ?, ?, ?, ?)";

		try {
			ps = con.prepareStatement(query);
			ps.setInt(1, booking.getBookingId());
			ps.setString(2, payment.getMerchantUid());
			ps.setString(3, payment.getPaymentMethod());
			ps.setString(4, payment.getBuyerEmail());
			ps.setString(5, payment.getBuyerName());
			ps.setString(6, payment.getBuyerTel());

			int result = ps.executeUpdate();

			if (result > 0) {
				stmt = con.createStatement();
				rs = stmt.executeQuery("select last_insert_id() from payment");
				if (rs.next()) {

					return new Payment(rs.getInt(1), payment.getBookingId(), payment.getMerchantUid(),
							payment.getPaymentMethod(), payment.getBuyerEmail(), payment.getBuyerName(),
							payment.getBuyerTel());
				}
			}

			return null;
		} finally {
			JdbcUtil.close(ps);
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);

		}
	}

}
