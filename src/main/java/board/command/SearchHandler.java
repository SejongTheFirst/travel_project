package board.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.Article;
import board.service.ListArticleService;
import board.service.ArticlePage;
import mvc.command.CommandHandler;

public class SearchHandler implements CommandHandler {

    private ListArticleService listArticleService = new ListArticleService();

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
        String searchType = req.getParameter("searchType");
        String keyword = req.getParameter("keyword");
        String pageNoVal = req.getParameter("pageNo");
        int pageNo = 1;
        if (pageNoVal != null) {
            pageNo = Integer.parseInt(pageNoVal);
        }

        ArticlePage articlePage = null;
        if ("title".equals(searchType)) {
            articlePage = listArticleService.getArticlePageByTitle(keyword, pageNo);
        } else if ("writerName".equals(searchType)) {
            articlePage = listArticleService.getArticlePageByWriterName(keyword, pageNo);
        }

        req.setAttribute("articlePage", articlePage);
        return "/WEB-INF/view/board/searchResults.jsp";
    }
}
