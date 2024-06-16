package booking.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.service.User;
import booking.model.Customer;
import booking.service.BookingPage;
import booking.service.ListBookingService;
import mvc.command.CommandHandler;

public class ListBookingHandler implements CommandHandler{

	private ListBookingService listService = new ListBookingService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {

		
		User authUser = (User)req.getSession().getAttribute("authUser");
		
		String pageNoVal=req.getParameter("pageNo");
		int pageNo = 1;
		if (pageNoVal != null) {
			pageNo=Integer.parseInt(pageNoVal);
		}
		
		
		BookingPage bookingPage= listService.getBookingPage(pageNo, new Customer(authUser.getId()));
		
		req.setAttribute("bookingPage", bookingPage);
		
		return "/WEB-INF/view/booking/listBooking.jsp";
	}
	
	
}
