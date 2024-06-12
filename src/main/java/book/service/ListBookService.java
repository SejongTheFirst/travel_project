package book.service;

import java.sql.Connection;
import java.util.List;

import book.dao.BookDAO;
import book.dao.BookProductDAO;
import book.model.Book;
import book.model.BookProduct;
import image.dao.ImageDAO;
import jdbc.connection.ConnectionProvider;

public class ListBookService {

	private BookDAO bookDao = new BookDAO();
	private BookProductDAO bookProdDao = new BookProductDAO();
	private ImageDAO imgDao = new ImageDAO();
	private int size = 10;
	
	public BookPage getBookPage(int pageNum) {
		try (Connection con = ConnectionProvider.getConnection()){
			
			List<BookProduct> bookProds = bookProdDao.selectByBuyerId(con, (pageNum-1)*size, size);

			for ( BookProduct bookProd : bookProds) {
				List<Book> books = bookDao.selectByBookCode(con, bookProd.getBookCode(), (pageNum -1)*size, size);
				List<Image> images = imgDao.selectByProductNum(con, bookProd.getProductNum());
				
			}
		} catch (SQLExceptoin e) {
			// TODO: handle exception
		}
	}
}
