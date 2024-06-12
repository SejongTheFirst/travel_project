package product.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import product.service.ListProductService;
import product.service.ProductPage;

public class ListProductHandler implements CommandHandler{
	
	private ListProductService listService=new ListProductService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String pageNoVal=req.getParameter("pageNo");
		int pageNo=1;
		if(pageNoVal != null) {
			pageNo=Integer.parseInt(pageNoVal);
		}
		ProductPage roomPage=listService.getRoomProductPage(pageNo);
		ProductPage experience = listService.getExperienceProductPage(pageNo);
		ProductPage activity = listService.getActivityProductPage(pageNo);
		req.setAttribute("roomPage", roomPage);
		req.setAttribute("experiencePage", experience);
		req.setAttribute("activityPage", activity);
		return "/WEB-INF/view/listProduct.jsp";
	}

}