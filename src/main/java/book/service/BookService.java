package book.service;

import java.sql.Connection;
import java.sql.SQLException;

import book.dao.BookDAO;
import book.dao.BookProductDAO;
import book.model.Book;
import book.model.BookProduct;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class BookService {
	private BookDAO bookDAO = new BookDAO();
	private BookProductDAO bookProductDAO = new BookProductDAO();

	public boolean isValid(BookRequest bookReq) {
		return true;
	}

	public Book registerBook(Book book, BookProduct bookProduct) throws SQLException {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			con.setAutoCommit(false);

			Book testBook = bookDAO.insert(con, book);
			if (testBook!= null) {
				bookProductDAO.insert(con, bookProduct);
				
				con.commit();
				return testBook;
			} else {
				throw new SQLException("Failed to insert Book");
			}
		} catch (SQLException e) {
			JdbcUtil.rollback(con);
			throw e;
		} finally {
			JdbcUtil.close(con);
		}
	}
}
