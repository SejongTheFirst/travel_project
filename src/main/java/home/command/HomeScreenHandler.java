package home.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.service.HomePage;
import home.service.HomeScreenService;
import mvc.command.CommandHandler;

public class HomeScreenHandler implements CommandHandler{
	
	private HomeScreenService homeScreenService = new HomeScreenService();
	private int startRow=0; // 시작번호

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		HomePage page = homeScreenService.getHomePage(startRow);
		req.setAttribute("productPage", page);
		return "/WEB-INF/view/home.jsp";
	}

}
