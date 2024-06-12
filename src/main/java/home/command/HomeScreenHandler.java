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
		
		HomePage roompage = homeScreenService.getRoomPage(startRow);
		HomePage experience = homeScreenService.getExperience(startRow);
		HomePage activity = homeScreenService.getAtivity(startRow);
		req.setAttribute("roomPage", roompage);
		req.setAttribute("experiencePage", experience);
		req.setAttribute("activityPage", activity);
		return "/WEB-INF/view/home.jsp";
	}

}
