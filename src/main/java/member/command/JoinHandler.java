package member.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.DuplicateIdException;
import member.service.JoinRequest;
import member.service.JoinService;
import mvc.command.CommandHandler;

public class JoinHandler implements CommandHandler {

	private static final String FORM_VIEW = "/WEB-INF/view/join.jsp";
	private JoinService joinService = new JoinService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setAttribute("showJoinModal", false);
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
		req.setAttribute("showJoinModal", true);
		return FORM_VIEW;
	}

	private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws IOException {
		JoinRequest joinReq = new JoinRequest();
		joinReq.setId(req.getParameter("id"));
		joinReq.setMemberName(req.getParameter("memberName"));
		joinReq.setPassword(req.getParameter("password"));
		joinReq.setConfirmPassword(req.getParameter("confirmPassword"));
		joinReq.setPhoneNum(req.getParameter("phoneNum"));
		joinReq.setBirthday(req.getParameter("birthday"));

		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);

		joinReq.validate(errors);

		if (!errors.isEmpty()) {
			req.setAttribute("showJoinModal", true);
			return FORM_VIEW;
		}

		try {
			joinService.join(joinReq);
			req.getSession().setAttribute("showLoginModal", true);
			res.sendRedirect(req.getContextPath() + "/home.do");
			return null;
		} catch (DuplicateIdException e) {
			errors.put("duplicateId", true);
			req.setAttribute("showJoinModal", true);
			return FORM_VIEW;
		}
	}
}
