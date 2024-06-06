package product.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.service.User;
import mvc.command.CommandHandler;
import product.model.Writer;
import product.service.WriteProductService;
import product.service.WriteRequest;

public class WriteProductHandler implements CommandHandler{
	
	private static final String FORM_VIEW = "/WEB-INF/view/newProductForm.jsp";
	private WriteProductService writeProductService = new WriteProductService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("GET")) {
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
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		
		User user = (User)req.getSession(false).getAttribute("authUser");
		WriteRequest writeReq = createWriteRequest(user, req);
		writeReq.validate(errors);
		
		if(!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		int newProductNum=writeProductService.write(writeReq);
		req.setAttribute("newProductNum", newProductNum);
		
		return "/WEB-INF/view/newProductSuccess.jsp";
		
	}

	private WriteRequest createWriteRequest(User user, HttpServletRequest req) {
		return new WriteRequest(new Writer(user.getId(), user.getMemberName()), req.getParameter("title"), req.getParameter("subtitle") , req.getParameter("content"), req.getParameter("type"), Integer.parseInt(req.getParameter("price")), req.getParameter("imgUrl"), Integer.parseInt(req.getParameter("guests")), req.getParameter("location"));
	}	
	 

}