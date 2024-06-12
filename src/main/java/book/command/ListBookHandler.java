package book.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.service.ListBookService;
import mvc.command.CommandHandler;

public class ListBookHandler implements CommandHandler{

	private ListBookService listService = new ListBookService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String pageNoVal=req.getParameter("pageNo");
		int pageNo = 1;
		if (pageNoVal != null) {
			pageNo=Integer.parseInt(pageNoVal);
		}
		BookPage bookpage= listService.getBookPage(pageNo);
		
		req.setAttribute("bookPage", bookPage);
		
		
		return "/WEB-INF/view/listBook.jsp";
	}
	
	
}
