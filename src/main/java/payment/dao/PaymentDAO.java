package payment.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import book.model.Book;
import jdbc.JdbcUtil;
import payment.model.Payment;

public class PaymentDAO {

	public Payment insert(Connection con, Payment payment, Book book) throws SQLException {
		PreparedStatement ps = null;
		Statement stmt = null;
		ResultSet rs = null;

		String query = "insert into payment (merchant_uid, payment_method, buyer_email, buyer_name, buyer_tel, book_code) values(?, ?, ?, ?, ?, ?)";

		try {
			ps = con.prepareStatement(query);
			ps.setString(1, payment.getMerchantUid());
			ps.setString(2, payment.getPaymentMethod());
			ps.setString(3, payment.getBuyerEmail());
			ps.setString(4, payment.getBuyerName());
			ps.setString(5, payment.getBuyerTel());
			ps.setInt(6, book.getBookCode());

			int result = ps.executeUpdate();

			if (result > 0) {
				stmt = con.createStatement();
				rs = stmt.executeQuery("select last_insert_id() from payment");
				if (rs.next()) {

					return new Payment(rs.getInt(1), payment.getMerchantUid(), payment.getPaymentMethod(),
							payment.getBuyerEmail(), payment.getBuyerName(), payment.getBuyerTel(),
							payment.getBookCode());
				}
			}
			
			return  null;
		} finally {
			JdbcUtil.close(ps);
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
			
		}
	}
	
}
