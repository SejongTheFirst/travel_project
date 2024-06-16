package booking.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import booking.service.BookingRequest;
import booking.service.VerifyService;
import mvc.command.CommandHandler;

public class BookingHandler implements CommandHandler {

    private VerifyService verifyService = new VerifyService();

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
        BookingRequest bookingRequest = new BookingRequest(Integer.parseInt(req.getParameter("productId")),
                req.getParameter("title"), Integer.parseInt(req.getParameter("price")),
                Integer.parseInt(req.getParameter("maxGuests")), req.getParameter("location"), req.getParameter("sellerId"), req.getParameter("imageUrl"),
                req.getParameter("start_date"), req.getParameter("end_date"),
                Integer.parseInt(req.getParameter("total_price")), Integer.parseInt(req.getParameter("days")));

        boolean isValid = verifyService.isValid(bookingRequest);

        if (isValid) {
            req.setAttribute("bookingRequest", bookingRequest);
            return "/WEB-INF/view/booking/booking.jsp";
        } else {
            return "/WEB-INF/view/error.jsp";
		}
	}
}
