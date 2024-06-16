package booking.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import booking.model.Booking;
import booking.model.BookedProduct;
import jdbc.JdbcUtil;

public class BookedProductDAO {

	public BookedProduct insert(Connection con, BookedProduct bookedProduct, Booking booking) throws SQLException {
		PreparedStatement ps = null;
		Statement stmt = null;
		ResultSet rs = null;

		String query = "insert into booked_product (product_id, booking_id, price, days, guests, total_price) values(?, ?, ?, ?, ?,?)";

		try {
			ps = con.prepareStatement(query);
			ps.setInt(1, bookedProduct.getProductId());
			ps.setInt(2, booking.getBookingId());
			ps.setInt(3, bookedProduct.getPrice());
			ps.setInt(4, bookedProduct.getDays());
			ps.setInt(5, bookedProduct.getGuests());
			ps.setInt(6, bookedProduct.getTotalPrice());

			int result = ps.executeUpdate();

			if (result > 0) {
				stmt = con.createStatement();
				rs = stmt.executeQuery("select last_insert_id() from booked_product");
				if (rs.next()) {

					return new BookedProduct(rs.getInt(1), bookedProduct.getProductId(), bookedProduct.getBookedProductId(),
							bookedProduct.getPrice(), bookedProduct.getDays(), bookedProduct.getGuests(),
							bookedProduct.getTotalPrice());
				}
			}
			return null;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
			JdbcUtil.close(ps);
		}
	}

	public List<BookedProduct> selectByBookingId(Connection con, int bookingId, int startRow, int size)
			throws SQLException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "select * from booked_product where booking_id=? order by booking_id desc limit ?, ?";

		try {
			ps = con.prepareStatement(query);
			ps.setInt(1, bookingId);
			ps.setInt(2, startRow);
			ps.setInt(3, size);
			rs = ps.executeQuery();

			List<BookedProduct> bookedProduct = new ArrayList<>();
			while (rs.next()) {

				bookedProduct.add(new BookedProduct(rs.getInt("booked_product_id"), rs.getInt("product_id"),
						rs.getInt("booking_id"), rs.getInt("price"), rs.getInt("days"), rs.getInt("guests"),
						rs.getInt("total_price")));
			}
			return bookedProduct;
		} finally {
			JdbcUtil.close(ps);
			JdbcUtil.close(rs);
		}
	}
}
