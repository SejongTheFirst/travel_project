package boardmain.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import board.model.Article;
import board.model.Writer;
import jdbc.JdbcUtil;

public class BoardMainFreeDao {

	private PreparedStatement ps;
	private ResultSet rs;

	public List<Article> getArticlesByCategory(Connection conn, String category) {
        List<Article> articles = new ArrayList<>();
        String sql = "SELECT article_no, category, title, writer_id, writer_name, regdate " +
                     "FROM Article WHERE category = ? ORDER BY regdate DESC LIMIT 6";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, category);
            rs = ps.executeQuery();
            while (rs.next()) {
                Writer writer = new Writer(rs.getString("writer_id"), rs.getString("writer_name"));
                Article article = new Article(
                    rs.getInt("article_no"),
                    rs.getString("title"),
                    writer,
                    rs.getTimestamp("regdate"),
                    rs.getString("category")
                );
                articles.add(article);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(ps);
        }
        return articles;
    }
}