package board.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;


import board.dao.ArticleDao;
import board.dao.CommentDao;
import board.model.Comment;
import board.model.Reply;
import jdbc.connection.ConnectionProvider;

public class CommentService {

	private CommentDao commentDao = new CommentDao();
    private int size = 5;
    
    public List<Comment> getCommentsByArticle(int articleNo) {
        try (Connection conn = ConnectionProvider.getConnection()) {
            return commentDao.getCommentsByArticle(conn, articleNo);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public List<Comment> getCommentsByUser(String userId) {
        try (Connection conn = ConnectionProvider.getConnection()) {
            return commentDao.selectCommentsByUser(conn, userId, 0, 10);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Reply> getRepliesByUser(String userId) {
        try (Connection conn = ConnectionProvider.getConnection()) {
            return commentDao.selectRepliesByUser(conn, userId, 0, 10);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void addComment(Comment comment) {
        try (Connection conn = ConnectionProvider.getConnection()) {
            commentDao.insertComment(conn, comment);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void addReply(Reply reply) {
        try (Connection conn = ConnectionProvider.getConnection()) {
            commentDao.insertReply(conn, reply);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void deleteComment(int commentNo) {
        try (Connection conn = ConnectionProvider.getConnection()) {
            commentDao.deleteComment(conn, commentNo);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void deleteReply(int replyNo) {
        try (Connection conn = ConnectionProvider.getConnection()) {
            commentDao.deleteReply(conn, replyNo);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateComment(int commentNo, String content) {
        try (Connection conn = ConnectionProvider.getConnection()) {
            commentDao.updateComment(conn, commentNo, content);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateReply(int replyNo, String content) {
        try (Connection conn = ConnectionProvider.getConnection()) {
            commentDao.updateReply(conn, replyNo, content);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public PagedList<Comment> getCommentsByUser(String userId, int pageNum) {
        try (Connection conn = ConnectionProvider.getConnection()) {
            int total = commentDao.countCommentsByUser(conn, userId);
            List<Comment> content = commentDao.selectCommentsByUser(conn, userId, (pageNum - 1) * size, size);
            return new PagedList<>(total, pageNum, size, content);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public PagedList<Reply> getRepliesByUser(String userId, int pageNum) {
        try (Connection conn = ConnectionProvider.getConnection()) {
            int total = commentDao.countRepliesByUser(conn, userId);
            List<Reply> content = commentDao.selectRepliesByUser(conn, userId, (pageNum - 1) * size, size);
            return new PagedList<>(total, pageNum, size, content);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}

