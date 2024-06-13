package book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import book.model.Book;
import book.model.BookProduct;
import jdbc.JdbcUtil;

public class BookProductDAO {

	public BookProduct insert(Connection con, BookProduct bookProduct, Book book) throws SQLException {
		PreparedStatement ps = null;
		Statement stmt = null;
		ResultSet rs = null;

		String query = "insert into book_product (book_code, product_num, price, days, guests, total_price) values(?, ?, ?, ?, ?,?)";

		try {
			ps = con.prepareStatement(query);
			ps.setInt(1, book.getBookCode());
			ps.setInt(2, bookProduct.getProductNum());
			ps.setInt(3, bookProduct.getPrice());
			ps.setInt(4, bookProduct.getDays());
			ps.setInt(5, bookProduct.getGuests());
			ps.setInt(6, bookProduct.getTotalPrice());

			int result = ps.executeUpdate();

			if (result > 0) {
				stmt = con.createStatement();
				rs = stmt.executeQuery("select last_insert_id() from book_product");
				if (rs.next()) {

					return new BookProduct(rs.getInt(1), bookProduct.getBookCode(), bookProduct.getProductNum(),
							bookProduct.getPrice(), bookProduct.getDays(), bookProduct.getGuests(),
							bookProduct.getTotalPrice());
				}
			}
			return null;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
			JdbcUtil.close(ps);
		}
	}

	public List<BookProduct> selectByBookCode(Connection con, int bookCode, int startRow, int size) throws SQLException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "select * from book_product where book_code=? oreder by book_code desc limit ?, ?";

		try {
			ps = con.prepareStatement(query);
			ps.setInt(1, bookCode);
			ps.setInt(2, startRow);
			ps.setInt(3, size);
			rs = ps.executeQuery();

			List<BookProduct> bookProd = new ArrayList<>();
			while (rs.next()) {

				bookProd.add(new BookProduct(rs.getInt("book_code"), rs.getInt("product_num"), rs.getInt("book_code"),
						rs.getInt("price"), rs.getInt("days"), rs.getInt("guests"), rs.getInt("total_price")));
			}
			return bookProd;
		} finally {
			JdbcUtil.close(ps);
			JdbcUtil.close(rs);
		}
	}
}
