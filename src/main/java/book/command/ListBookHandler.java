package book.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.service.User;
import book.model.Customer;
import book.service.BookPage;
import book.service.ListBookService;
import mvc.command.CommandHandler;

public class ListBookHandler implements CommandHandler{

	private ListBookService listService = new ListBookService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {

		User authUser = (User)req.getSession().getAttribute("authUser");
		
		String pageNoVal=req.getParameter("pageNo");
		int pageNo = 1;
		if (pageNoVal != null) {
			pageNo=Integer.parseInt(pageNoVal);
		}
		
		
		BookPage bookPage= listService.getBookPage(pageNo, new Customer(authUser.getId()));
		
		req.setAttribute("bookPage", bookPage);
		
		return "/WEB-INF/view/listBook.jsp";
	}
	
	
}
