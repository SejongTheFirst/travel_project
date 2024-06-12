package book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Date;

import book.model.Book;
import jdbc.JdbcUtil;

public class BookDAO {

	public Book insert(Connection con, Book book) throws SQLException {
		PreparedStatement ps = null;
		Statement stmt = null;
		ResultSet rs = null;

		String query = "insert into book (seller_id, general_id, title, location, start_date, end_date) values(?, ?, ?, ?, ?, ?)";

		try {
			ps = con.prepareStatement(query);
			ps.setString(1, book.getSeller().getId());
			ps.setString(2, book.getCustomer().getId());
			ps.setString(3, book.getTitle());
			ps.setString(4, book.getLocation());
			ps.setString(5, book.getImgUrl());
			ps.setTimestamp(5, toTimestamp(book.getStartDate()));
			ps.setTimestamp(6, toTimestamp(book.getEndDate()));

			int result = ps.executeUpdate();

			if (result > 0) {
				stmt = con.createStatement();
				rs = stmt.executeQuery("select last_insert_id() from book");
				if (rs.next()) {
					Integer code = rs.getInt(1);
					return new Book(code, book.getSeller(), book.getCustomer(), book.getTitle(), book.getLocation(),
							book.getImgUrl(), book.getStartDate(), book.getEndDate());
				}
			}
			return null;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
			JdbcUtil.close(ps);
		}
	}

	private Timestamp toTimestamp(Date date) {
		return new Timestamp(date.getTime());
	}
}
