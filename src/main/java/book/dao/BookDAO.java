package book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import book.model.Book;
import book.model.Customer;
import jdbc.JdbcUtil;

public class BookDAO {

	public Book insert(Connection con, Book book) throws SQLException {
		PreparedStatement ps = null;
		Statement stmt = null;
		ResultSet rs = null;

		String query = "insert into book (seller_id, general_id, title, location, img_url, start_date, end_date) values(?, ?, ?, ?, ?, ?, ?)";

		try {
			ps = con.prepareStatement(query);
			ps.setString(1, book.getSellerId());
			ps.setString(2, book.getCustomer().getId());
			ps.setString(3, book.getTitle());
			ps.setString(4, book.getLocation());
			ps.setString(5, book.getImgUrl());
			ps.setTimestamp(6, toTimestamp(book.getStartDate()));
			ps.setTimestamp(7, toTimestamp(book.getEndDate()));

			int result = ps.executeUpdate();

			if (result > 0) {
				stmt = con.createStatement();
				rs = stmt.executeQuery("select last_insert_id() from book");
				if (rs.next()) {
					Integer code = rs.getInt(1);
					return new Book(code, book.getSellerId(), book.getCustomer(), book.getTitle(), book.getLocation(),
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

	public List<Book> selectByBuyerId(Connection con, Customer customer, int startRow, int size) throws SQLException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "select * from book where general_id=? order by book_code desc limit ?, ?";

		try {
			ps = con.prepareStatement(query);
			ps.setString(1, customer.getId());
			ps.setInt(2, startRow);
			ps.setInt(3, size);
			rs = ps.executeQuery();

			List<Book> book = new ArrayList<>();
			while (rs.next()) {

				book.add(new Book(rs.getInt("book_code"), rs.getString("seller_id"),
						new Customer(rs.getString("general_id")), rs.getString("title"), rs.getString("location"),
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
			rs = stmt.executeQuery("select count(*) from book");

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
