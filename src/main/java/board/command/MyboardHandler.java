package board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auth.service.User;
import board.service.ArticlePage;
import board.service.MyboardService;
import board.service.CommentService;
import board.service.PagedList;
import mvc.command.CommandHandler;
import board.model.Comment;
import board.model.Reply;

public class MyboardHandler implements CommandHandler {

    private MyboardService myboardService = new MyboardService();
    private CommentService commentService = new CommentService();

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) 
            throws Exception {
        String pageNoVal = req.getParameter("pageNo");
        int pageNo = 1;
        if (pageNoVal != null) {
            pageNo = Integer.parseInt(pageNoVal);
        }

        String commentPageNoVal = req.getParameter("commentPageNo");
        int commentPageNo = 1;
        if (commentPageNoVal != null) {
            commentPageNo = Integer.parseInt(commentPageNoVal);
        }

        String replyPageNoVal = req.getParameter("replyPageNo");
        int replyPageNo = 1;
        if (replyPageNoVal != null) {
            replyPageNo = Integer.parseInt(replyPageNoVal);
        }

        HttpSession session = req.getSession();
        User authUser = (User) session.getAttribute("authUser");

        System.out.println("User from session: " + (authUser != null ? authUser.getId() : "null"));

        if (authUser == null) {
            return "/login.do";
        }

        ArticlePage articlePage = myboardService.getArticlePageByUser(authUser.getId(), pageNo);
        PagedList<Comment> commentPage = commentService.getCommentsByUser(authUser.getId(), commentPageNo);
        PagedList<Reply> replyPage = commentService.getRepliesByUser(authUser.getId(), replyPageNo);

        System.out.println("ArticlePage total: " + articlePage.getTotal());
        System.out.println("ArticlePage content size: " + articlePage.getContent().size());
        System.out.println("Comments size: " + commentPage.getContent().size());
        System.out.println("Replies size: " + replyPage.getContent().size());

        req.setAttribute("articlePage", articlePage);
        req.setAttribute("commentPage", commentPage);
        req.setAttribute("replyPage", replyPage);
        req.setAttribute("id", authUser.getId());
        return "/WEB-INF/view/main/myboard.jsp";
    }
}

