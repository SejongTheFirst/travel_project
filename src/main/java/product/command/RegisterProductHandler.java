package product.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import auth.service.User;
import mvc.command.CommandHandler;
import product.model.Seller;
import product.service.RegisterProductService;
import product.service.RegisterRequest;
import util.MultiProvider;

public class RegisterProductHandler implements CommandHandler {

	private static final String FORM_VIEW = "/WEB-INF/view/newProductForm.jsp";
	private RegisterProductService registerProductService = new RegisterProductService();

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
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);

		User user = (User) req.getSession(false).getAttribute("authUser");

		MultipartRequest multi = MultiProvider.getMulti(req);
		List<String> fileNames = MultiProvider.getImgUrl(multi);

		RegisterRequest regReq = new RegisterRequest(new Seller(user.getId(), user.getMemberName()),
				multi.getParameter("title"), multi.getParameter("subtitle"), multi.getParameter("content"),
				multi.getParameter("category"), Integer.parseInt(multi.getParameter("price")), fileNames,
				Integer.parseInt(multi.getParameter("guests")), multi.getParameter("location"));

		regReq.validate(errors);

		if (!errors.isEmpty()) {
			return FORM_VIEW;
		}

		int newProductNum = registerProductService.register(regReq);
		req.setAttribute("newProductNum", newProductNum);

		return "/WEB-INF/view/newProductSuccess.jsp";

	}

}
