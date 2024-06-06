package boardmain.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import board.model.Article;
import boardmain.dao.BoardMainFreeDao;
import jdbc.connection.ConnectionProvider;

public class BoardMainService {

    private BoardMainFreeDao articleDao = new BoardMainFreeDao();

    public List<Article> getLatestArticlesByCategory(String category) {
        try (Connection conn = ConnectionProvider.getConnection()) {
            return articleDao.getArticlesByCategory(conn, category);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}