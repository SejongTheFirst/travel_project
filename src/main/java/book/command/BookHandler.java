package book.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.service.User;
import book.model.Book;
import book.model.BookProduct;
import book.model.Customer;
import book.model.Seller;
import book.service.BookRequest;
import book.service.BookService;
import mvc.command.CommandHandler;
import payment.model.Payment;

public class BookHandler implements CommandHandler {

	private static final String FORM_VIEW = "/WEB-INF/view/error.jsp";
	private BookService bookService = new BookService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {

		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);

		User user = (User) req.getSession(false).getAttribute("authUser");

		BookRequest bookRequest = new BookRequest(req.getParameter("merchant_uid"),
				Integer.parseInt(req.getParameter("amount")), req.getParameter("buyer_email"),
				req.getParameter("buyer_name"), req.getParameter("buyer_tel"),
				Integer.parseInt(req.getParameter("product_id")), req.getParameter("product_name"),
				Integer.parseInt(req.getParameter("product_price")),
				java.sql.Date.valueOf(req.getParameter("start_date")),
				java.sql.Date.valueOf(req.getParameter("end_date")), Integer.parseInt(req.getParameter("days")),
				Integer.parseInt(req.getParameter("guest")), req.getParameter("sellerId"), req.getParameter("imageUrl"),
				req.getParameter("title"), req.getParameter("location"), req.getParameter("payment_method"));

		bookRequest.validate(errors);

		if (!errors.isEmpty()) {
			return FORM_VIEW;
		}
		System.out.println(bookRequest.getSellerId());

		Book book = new Book(null, new Seller(req.getParameter("sellerId")), new Customer(user.getId()),
				req.getParameter("product_name"), req.getParameter("location"), req.getParameter("imageUrl"),
				java.sql.Date.valueOf(req.getParameter("start_date")),
				java.sql.Date.valueOf(req.getParameter("end_date")));

		BookProduct bookProduct = new BookProduct(null, Integer.parseInt(req.getParameter("product_id")),
				book.getBookCode(), Integer.parseInt(req.getParameter("product_price")),
				Integer.parseInt(req.getParameter("days")), Integer.parseInt(req.getParameter("guest")),
				Integer.parseInt(req.getParameter("amount")));

		Payment payment = new Payment(null, req.getParameter("merchant_uid"), req.getParameter("payment_method"),
				req.getParameter("buyer_email"), req.getParameter("buyer_name"), req.getParameter("buyer_tel"),
				book.getBookCode());

		if (bookService.registerBook(book, bookProduct) != null) {

			try {
				//res.sendRedirect(req.getContextPath() + "/home.jsp");
				return "/WEB-INF/view/home.jsp";
			} catch (Exception e) {
				return FORM_VIEW;
			}
		}
		return FORM_VIEW;
	}
}
