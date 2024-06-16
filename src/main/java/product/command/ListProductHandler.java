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
		ProductPage roomPage=listService.getRoomPage(pageNo);
		ProductPage experiencePage = listService.getExperiencePage(pageNo);
		ProductPage activityPage = listService.getActivityPage(pageNo);
		req.setAttribute("roomPage", roomPage);
		req.setAttribute("experiencePage", experiencePage);
		req.setAttribute("activityPage", activityPage);
		return "/WEB-INF/view/product/listProduct.jsp";
	}

}