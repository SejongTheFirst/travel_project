package product.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.service.User;
import mvc.command.CommandHandler;
import product.dao.ProductDAO;
import product.service.ModifyProductService;
import product.service.ModifyRequest;
import product.service.PermissionDeninedException;
import product.service.ProductData;
import product.service.ProductNotFoundException;
import product.service.ReadProductService;

public class ModifyProductHandler implements CommandHandler{
	
	private static final String FORM_VIEW="/WEB-INF/view/modifyForm.jsp";
	
	private ReadProductService readService= new ReadProductService();
	private ModifyProductService modifyProductService = new ModifyProductService();
	
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

	private String processForm(HttpServletRequest req, HttpServletResponse res) throws IOException{
		try {
			String noVal = req.getParameter("no");
			int no = Integer.parseInt(noVal);
			
			ProductData productData = readService.getProduct(no);
			
			User authUser=(User) req.getSession().getAttribute("authUser");
			
			if (!canModify(authUser, productData)) {
				res.sendError(HttpServletResponse.SC_FORBIDDEN);
				return null;
			}
			
			ModifyRequest modReq = new ModifyRequest(authUser.getId(), no, productData.getProduct().getPrice(), productData.getProduct().getProductTitle(), productData.getContent().getProductSubTitle(), productData.getContent().getProductContent());
			
			req.setAttribute("modReq", modReq);
			return FORM_VIEW;
		} catch (ProductNotFoundException e) {
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
	}
	
	private boolean canModify(User authUser, ProductData productData) {
		String writerId = productData.getProduct().getWriter().getId();
		return authUser.getId().equals(writerId);
	}

	private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws Exception{
		User authUser = (User)req.getSession().getAttribute("authUser");
		String noVal=req.getParameter("no");
		int	no=Integer.parseInt(noVal);
		
		ModifyRequest modReq = new ModifyRequest(authUser.getId(), no,  Integer.parseInt(req.getParameter("price")), req.getParameter("title"), req.getParameter("subtitle"), req.getParameter("content"));
		req.setAttribute("modReq", modReq);
		
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		modReq.validate(errors);
		
		if (!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		try {
			modifyProductService.modify(modReq);
			return "/WEB-INF/view/modifySuccess.jsp";
		} catch (ProductNotFoundException e) {
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		} catch (PermissionDeninedException e) {
			res.sendError(HttpServletResponse.SC_FORBIDDEN);
			return null;
		}
	}
	
	
	

}