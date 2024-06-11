package board.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import board.dao.ArticleDao;
import board.model.Article;
import jdbc.connection.ConnectionProvider;

public class MyboardService {

    private ArticleDao articleDao = new ArticleDao();
    private int size = 10;

    public ArticlePage getArticlePageByUser(String userId, int pageNum) {
        try (Connection conn = ConnectionProvider.getConnection()) {
            int total = articleDao.countArticlesByUser(conn, userId);
            System.out.println("Total articles by user: " + total); // 디버깅용 로그 추가
            List<Article> content = articleDao.findArticlesByUser(conn, userId, (pageNum - 1) * size, size);
            System.out.println("Articles found: " + content.size()); // 디버깅용 로그 추가
            return new ArticlePage(total, pageNum, size, content);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
