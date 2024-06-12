package board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.ListArticleService;
import board.service.ArticlePage;
import mvc.command.CommandHandler;

public class CategorySearchHandler implements CommandHandler {

    private ListArticleService listArticleService = new ListArticleService();

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
        String category = req.getParameter("category");
        String searchType = req.getParameter("searchType");
        String keyword = req.getParameter("keyword");
        String pageNoVal = req.getParameter("pageNo");
        int pageNo = 1;
        if (pageNoVal != null) {
            pageNo = Integer.parseInt(pageNoVal);
        }

        if (category == null || category.isEmpty()) {
            throw new IllegalArgumentException("카테고리가 지정되지 않았습니다.");
        }

        ArticlePage articlePage;
        if ("title".equals(searchType)) {
            articlePage = listArticleService.searchByTitleAndCategory(category, keyword, pageNo);
        } else if ("writerName".equals(searchType)) {
            articlePage = listArticleService.searchByWriterNameAndCategory(category, keyword, pageNo);
        } else {
            throw new IllegalArgumentException("잘못된 검색 유형입니다.");
        }

        req.setAttribute("articlePage", articlePage);
        req.setAttribute("category", category);
        req.setAttribute("searchType", searchType);
        req.setAttribute("keyword", keyword);
        return "/WEB-INF/view/board/CategoryResults.jsp";
    }
}
