package member.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		req.setAttribute("showCancelIDModal", true);
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws IOException {
		User user = (User) req.getSession().getAttribute("authUser");
		
		cancelIDSvc.cancelID(user.getId());

		HttpSession session = req.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		res.sendRedirect(req.getContextPath() + "/home.do");
        return null;
	}

}
