package search.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.ArticlePage;
import mvc.command.CommandHandler;
import product.service.ProductPage;
import search.service.SearchPage;
import search.service.SearchService;

public class SearchHandler implements CommandHandler{
	
	private SearchService search = new SearchService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String pageNoVal = req.getParameter("pageNo");
		int pageNo=1;
		if(pageNoVal != null) {
			pageNo=Integer.parseInt(pageNoVal);
		}
		
		SearchPage searchPage = search.getProductPage(pageNo, req.getParameter("keyword"));
		
		req.setAttribute("searchPage", searchPage);
		return "/WEB-INF/view/search.jsp";
	}

}
