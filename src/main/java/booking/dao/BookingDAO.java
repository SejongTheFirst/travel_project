package booking.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import booking.model.Booking;
import booking.model.Customer;
import jdbc.JdbcUtil;

public class BookingDAO {

	// BookingService
	public Booking insert(Connection con, Booking book) throws SQLException {
		PreparedStatement ps = null;
		Statement stmt = null;
		ResultSet rs = null;

		String query = "insert into booking (seller_id, buyer_id, booking_title, location, img_url, start_date, end_date) values(?, ?, ?, ?, ?, ?, ?)";

		try {
			ps = con.prepareStatement(query);
			ps.setString(1, book.getSellerId());
			ps.setString(2, book.getCustomer().getId());
			ps.setString(3, book.getBookingTitle());
			ps.setString(4, book.getLocation());
			ps.setString(5, book.getImgUrl());
			ps.setTimestamp(6, toTimestamp(book.getStartDate()));
			ps.setTimestamp(7, toTimestamp(book.getEndDate()));

			int result = ps.executeUpdate();

			if (result > 0) {
				stmt = con.createStatement();
				rs = stmt.executeQuery("select last_insert_id() from booking");
				if (rs.next()) {
					Integer code = rs.getInt(1);
					return new Booking(code, book.getSellerId(), book.getCustomer(), book.getBookingTitle(),
							book.getLocation(), book.getImgUrl(), book.getStartDate(), book.getEndDate());
				}
			}
			return null;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
			JdbcUtil.close(ps);
		}
	}

	// VerfyService
	public boolean isBookingExists(Connection con, int productId, String startDate, String endDate)
			throws SQLException {
		String query = "SELECT COUNT(*) FROM booking b " + "JOIN booked_product bp ON b.booking_id = bp.booking_id "
				+ "WHERE bp.product_id = ? AND " + "((b.start_date <= ? AND b.end_date >= ?) OR "
				+ "(b.start_date <= ? AND b.end_date >= ?))";
		try (PreparedStatement ps = con.prepareStatement(query)) {
			ps.setInt(1, productId);
			ps.setString(2, startDate);
			ps.setString(3, startDate);
			ps.setString(4, endDate);
			ps.setString(5, endDate);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return rs.getInt(1) > 0;
				}
			}
		}
		return false;
	}

	public List<Booking> selectByBuyerId(Connection con, Customer customer, int startRow, int size)
			throws SQLException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "select * from booking where buyer_id=? order by booking_id desc limit ?, ?";

		try {
			ps = con.prepareStatement(query);
			ps.setString(1, customer.getId());
			ps.setInt(2, startRow);
			ps.setInt(3, size);
			rs = ps.executeQuery();

			List<Booking> book = new ArrayList<>();
			while (rs.next()) {

				book.add(new Booking(rs.getInt("booking_id"), rs.getString("seller_id"),
						new Customer(rs.getString("buyer_id")), rs.getString("booking_title"), rs.getString("location"),
						rs.getString("img_url"), toDate(rs.getTimestamp("start_date")),
						toDate(rs.getTimestamp("end_date"))));
			}
			return book;
		} finally {
			JdbcUtil.close(ps);
			JdbcUtil.close(rs);
		}
	}

	public int selectCount(Connection con) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery("select count(*) from booking");

			if (rs.next()) {
				return rs.getInt(1);
			}
			return 0;

		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}

	}

	private Timestamp toTimestamp(Date date) {
		return new Timestamp(date.getTime());
	}

	private Date toDate(Timestamp timestamp) {
		return new Date(timestamp.getTime());
	}
}
