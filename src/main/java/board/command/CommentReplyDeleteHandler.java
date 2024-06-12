package board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import board.service.CommentService;
import mvc.command.CommandHandler;

public class CommentReplyDeleteHandler implements CommandHandler {

    private CommentService commentService = new CommentService();

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
        String action = req.getParameter("action");
        int id = Integer.parseInt(req.getParameter("id"));
        String responseMessage;

        try {
            if ("deleteComment".equals(action)) {
                commentService.deleteComment(id);
                responseMessage = "댓글이 성공적으로 삭제되었습니다.";
            } else if ("deleteReply".equals(action)) {
                commentService.deleteReply(id);
                responseMessage = "답글이 성공적으로 삭제되었습니다.";
            } else {
                responseMessage = "알 수 없는 작업입니다.";
            }
        } catch (RuntimeException e) {
            responseMessage = "삭제에 실패했습니다: " + e.getMessage();
        }

        res.setContentType("text/plain; charset=utf-8");
        res.getWriter().write(responseMessage);
        return null;
    }
}

