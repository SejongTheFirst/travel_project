package product.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import auth.service.User;
import mvc.command.CommandHandler;
import product.service.RegisterRequest;
import product.model.Seller;
import product.service.RegisterProductService;
import util.FileUtil;

public class RegisterProductHandler implements CommandHandler {

	private static final String FORM_VIEW = "/WEB-INF/view/product/newProductForm.jsp";
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

		MultipartRequest multi = FileUtil.getMulti(req);
		List<String> fileNames = FileUtil.getImgUrls(multi);

		System.out.println("Collected File Names: " + fileNames);

		RegisterRequest regReq = new RegisterRequest(new Seller(user.getId(), user.getMemberName()),
				multi.getParameter("title"), multi.getParameter("category"), multi.getParameter("location"),
				Integer.parseInt(multi.getParameter("price")), multi.getParameter("content"),
				multi.getParameter("subtitle"), Integer.parseInt(multi.getParameter("guests")), fileNames);

		regReq.validate(errors);

		if (!errors.isEmpty()) {
			return FORM_VIEW;
		}

		int newProductNum = registerProductService.register(regReq);
		req.setAttribute("newProductNum", newProductNum);

		return "/WEB-INF/view/product/newProductSuccess.jsp";

	}

}
