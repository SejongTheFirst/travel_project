package book.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.service.VerifyRequest;
import book.service.VerifyService;
import mvc.command.CommandHandler;

public class VerifyHandler implements CommandHandler {

	private VerifyService verifyService = new VerifyService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		VerifyRequest verifyRequest = new VerifyRequest(Integer.parseInt(req.getParameter("productNum")),
				req.getParameter("title"), Integer.parseInt(req.getParameter("price")),
				Integer.parseInt(req.getParameter("guest")), req.getParameter("location"), req.getParameter("writerId"), req.getParameter("imageUrl"),
				req.getParameter("start_date"), req.getParameter("end_date"),
				Integer.parseInt(req.getParameter("total_price")), Integer.parseInt(req.getParameter("days")));

		boolean isValid = verifyService.isValid(verifyRequest);

		if (isValid) {
			req.setAttribute("verifyRequest", verifyRequest);
			return "/WEB-INF/view/book.jsp";
		} else {
			return "/WEB-INF/view/error.jsp";
		}
	}
}
