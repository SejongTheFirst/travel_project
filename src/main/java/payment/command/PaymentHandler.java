package payment.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.service.User;
import booking.model.Customer;
import booking.service.BookingService;
import mvc.command.CommandHandler;
import payment.service.PaymentRequest;

public class PaymentHandler implements CommandHandler {

	private static final String FORM_VIEW = "/WEB-INF/view/error.jsp";
	private BookingService bookingService = new BookingService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {

		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);

		User user = (User) req.getSession(false).getAttribute("authUser");

		PaymentRequest request = new PaymentRequest(
				req.getParameter("merchant_uid"),
				Integer.parseInt(req.getParameter("amount")),
				new Customer(user.getId()),
				req.getParameter("buyer_email"),
				req.getParameter("buyer_name"),
				req.getParameter("buyer_tel"),
				Integer.parseInt(req.getParameter("productId")),
				req.getParameter("title"),
				Integer.parseInt(req.getParameter("price")),
				req.getParameter("start_date"),
				req.getParameter("end_date"),
				Integer.parseInt(req.getParameter("days")),
				Integer.parseInt(req.getParameter("maxGuests")),
				req.getParameter("sellerId"),
				req.getParameter("imageUrl"),
				req.getParameter("title"),
				req.getParameter("location"),
				req.getParameter("payment_method")
		);

		request.validate(errors);

		if (!errors.isEmpty()) {
			return FORM_VIEW;
		}

		int newBookingId = bookingService.insert(request);
		req.setAttribute("newBookCode", newBookingId);

		try {
			 res.sendRedirect(req.getContextPath() + "/booking/list.do");
			return null;
		} catch (Exception e) {
			return FORM_VIEW;
		}
	}
}
