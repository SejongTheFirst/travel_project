package home.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.Article;
import boardmain.service.BoardMainService;
import home.service.HomePage;
import home.service.HomeScreenService;
import mvc.command.CommandHandler;

public class HomeScreenHandler implements CommandHandler{
	
	private BoardMainService articleService = new BoardMainService();
	private HomeScreenService homeScreenService = new HomeScreenService();
	private int startRow=0; // 시작번호

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		List<Article> AllList = articleService.getAllList();
		HomePage roomPage = homeScreenService.getRoomPage(startRow);
		HomePage experiencePage = homeScreenService.getExperiencePage(startRow);
		HomePage activityPage = homeScreenService.getAvtivityPage(startRow);
		req.setAttribute("roomPage", roomPage);
		req.setAttribute("experiencePage", experiencePage);
		req.setAttribute("activityPage", activityPage);
		req.setAttribute("AllList", AllList);
		return "/WEB-INF/view/home.jsp";
	}

}
