package board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.ArticleContentNotFoundException;
import board.service.ArticleData;
import board.service.ArticleNotFoundException;
import board.service.ReadArticleService;
import mvc.command.CommandHandler;

public class ReadArticleHandler implements CommandHandler {

    private ReadArticleService readService = new ReadArticleService();

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) 
            throws Exception {
        String noVal = req.getParameter("no");
        int articleNum = Integer.parseInt(noVal);

        String category = req.getParameter("category");
        if (category == null) {
            category = "";
        }

        String pageNoVal = req.getParameter("pageNo");
        int pageNo = pageNoVal != null ? Integer.parseInt(pageNoVal) : 1;

        try {
            ArticleData articleData = readService.getArticle(articleNum, true);
            req.setAttribute("articleData", articleData);
            req.setAttribute("category", category);
            req.setAttribute("pageNo", pageNo);
            return "/WEB-INF/view/board/boardRead.jsp";
        } catch (ArticleNotFoundException | ArticleContentNotFoundException e) {
            req.getServletContext().log("no article", e);
            res.sendError(HttpServletResponse.SC_NOT_FOUND);
            return null;
        }
    }
}