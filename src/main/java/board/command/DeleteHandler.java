package board.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.ArticleDao;
import board.service.ArticleData;
import board.service.ArticleNotFoundException;
import board.service.DeleteArticleService;
import mvc.command.CommandHandler;

public class DeleteHandler implements CommandHandler {
	private ArticleDao articleDao = new ArticleDao();
	private DeleteArticleService deleteService = new DeleteArticleService();

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String noVal = req.getParameter("no");
		int articleNum = Integer.parseInt(noVal);
		try {
			// 게시글 삭제 서비스를 호출하여 해당 게시글을 삭제합니다.
			deleteService.deleteArticle(articleNum);

			// 삭제 후에는 리스트 페이지로 리다이렉트합니다.
		
		} catch (ArticleNotFoundException e) {
			// 삭제할 게시글을 찾지 못한 경우 에러를 로그에 기록하고 404 에러를 반환합니다.
			req.getServletContext().log("No article to delete", e);
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
		}
		return "/WEB-INF/view/Board/BoardList.jsp";
	}
}