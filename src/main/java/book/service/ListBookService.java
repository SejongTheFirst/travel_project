package book.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import book.dao.BookDAO;
import book.dao.BookProductDAO;
import book.model.Book;
import book.model.BookProduct;
import book.model.Customer;
import jdbc.connection.ConnectionProvider;

public class ListBookService {

	private BookDAO bookDao = new BookDAO();
	private BookProductDAO bookProdDao = new BookProductDAO();
	private int size = 10;
	
	public BookPage getBookPage(int pageNum, Customer customer) {
		try (Connection con = ConnectionProvider.getConnection()){
			int total = bookDao.selectCount(con);
			
			List<Book> books= bookDao.selectByBuyerId(con, customer, (pageNum-1)*size, size);
			List<BookData> data = new ArrayList<>();
			
			for ( Book book : books) {
				List<BookProduct> bookProds = bookProdDao.selectByBookCode(con, book.getBookCode(), (pageNum -1)*size, size);
				data.add(new BookData(books, bookProds));
			}
			return new BookPage(total, pageNum, size, data);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
