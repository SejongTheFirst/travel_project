package book.command;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.service.User;
import book.model.Customer;
import book.service.BookRequest;
import book.service.BookService;
import mvc.command.CommandHandler;

public class BookHandler implements CommandHandler {

	private static final String FORM_VIEW = "/WEB-INF/view/error.jsp";
	private BookService bookService = new BookService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {

		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);

		User user = (User) req.getSession(false).getAttribute("authUser");

		BookRequest request = new BookRequest(req.getParameter("merchant_uid"),
				Integer.parseInt(req.getParameter("amount")), new Customer(user.getId()),
				req.getParameter("buyer_email"), req.getParameter("buyer_name"), req.getParameter("buyer_tel"),
				Integer.parseInt(req.getParameter("product_id")), req.getParameter("product_name"),
				Integer.parseInt(req.getParameter("product_price")), req.getParameter("start_date"),
				req.getParameter("end_date"), Integer.parseInt(req.getParameter("days")),
				Integer.parseInt(req.getParameter("guest")), req.getParameter("sellerId"), req.getParameter("imageUrl"),
				req.getParameter("title"), req.getParameter("location"), req.getParameter("payment_method"));

		request.validate(errors);

		if (!errors.isEmpty()) {
			return FORM_VIEW;
		}

		int newBookCode = bookService.register(request);
		req.setAttribute("newBookCode", "newBookCode");

		try {
			// res.sendRedirect(req.getContextPath() + "/home.jsp");
			return "/WEB-INF/view/home.jsp";
		} catch (Exception e) {
			return FORM_VIEW;
		}
	}
}
