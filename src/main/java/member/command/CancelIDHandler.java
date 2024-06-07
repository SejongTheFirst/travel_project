package member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.service.User;
import member.service.CancelIDService;
import mvc.command.CommandHandler;

public class CancelIDHandler implements CommandHandler {
	
	private static final String FORM_VIEW = "/WEB-INF/view/cancelID.jsp";
	private CancelIDService cancelIDSvc = new CancelIDService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		} 
	}
	
	private String processForm(HttpServletRequest req, HttpServletResponse res) {
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res) {
		User user = (User) req.getSession().getAttribute("authUser");
		
		cancelIDSvc.cancelID(user.getId());
		return "/WEB-INF/view/logout.jsp";
	}

}
