package book.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import book.dao.BookDAO;
import book.dao.BookProductDAO;
import book.model.Book;
import book.model.BookProduct;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import payment.dao.PaymentDAO;
import payment.model.Payment;

public class BookService {
	private BookDAO bookDAO = new BookDAO();
	private BookProductDAO bookProductDAO = new BookProductDAO();
	private PaymentDAO paymentDAO = new PaymentDAO();

	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

	public boolean isValid(BookRequest bookReq) {
		return true;
	}

	public Integer register(BookRequest request) throws SQLException {
		Connection con = null;

		try {
			con = ConnectionProvider.getConnection();
			con.setAutoCommit(false);

			Book book = toBook(request);
			Book savedBook = bookDAO.insert(con, book);

			if (savedBook == null) {
				throw new RuntimeException("fail to insert book");
			}

			BookProduct booked = toBooked(savedBook, request);
			BookProduct savedBooked = bookProductDAO.insert(con, booked, savedBook);

			if (savedBooked == null) {
				throw new RuntimeException("fail to insert book_product");
			}

			Payment payment = toPayment(savedBook, request);
			Payment savedPayment = paymentDAO.insert(con, payment, savedBook);

			if (savedPayment == null) {
				throw new RuntimeException("fail to insert payment");
			}

			con.commit();

			return savedBook.getBookCode();
		} catch (SQLException e) {
			JdbcUtil.rollback(con);
			throw new RuntimeException(e);
		} catch (RuntimeException e) {
			JdbcUtil.rollback(con);
			throw e;
		} finally {
			JdbcUtil.close(con);
		}
	}

	private Book toBook(BookRequest request) {

		return new Book(null, request.getSellerId(), request.getCustomer(), request.getProductName(),
				request.getLocation(), request.getImageUrl(), toDate(request.getStartDate()), toDate(request.getEndDate()));
	}

	private BookProduct toBooked(Book save, BookRequest request) {

		return new BookProduct(null, request.getProductId(), save.getBookCode(), request.getProductPrice(),
				request.getDays(), request.getGuest(), request.getAmount());
	}

	private Payment toPayment(Book save, BookRequest request) {

		return new Payment(null, request.getMerchantUid(), request.getPaymentMethod(), request.getBuyerEmail(),
				request.getBuyerName(), request.getBuyerTel(), save.getBookCode());
	}
	
	
	private Date toDate(String date) {
		Date newDate = null;
		try {
		newDate = dateFormat.parse(date);
		} catch(ParseException e) {
			System.out.println("date parse fail");
		}
		return newDate;
	}
	
}
