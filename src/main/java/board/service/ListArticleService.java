package board.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import board.dao.ArticleDao;
import board.model.Article;
import jdbc.connection.ConnectionProvider;

public class ListArticleService {

	private ArticleDao articleDao = new ArticleDao();
	private int size = 10;

	public ArticlePage getArticlePageByCategory(String category, int pageNum) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			int total = articleDao.selectCountByCategory(conn, category);
			List<Article> content = articleDao.selectByCategory(conn, category, (pageNum - 1) * size, size);
			return new ArticlePage(total, pageNum, size, content);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public ArticlePage getArticlePageByTitle(String title, int pageNum) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			List<Article> content = articleDao.searchByTitle(conn, title);
			int total = content.size();
			int fromIndex = (pageNum - 1) * size;
			int toIndex = Math.min(fromIndex + size, total);
			if (fromIndex > toIndex) {
				return new ArticlePage(total, pageNum, size, List.of());
			}
			return new ArticlePage(total, pageNum, size, content.subList(fromIndex, toIndex));
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public ArticlePage getArticlePageByWriterName(String writerName, int pageNum) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			List<Article> content = articleDao.searchByWriterName(conn, writerName);
			int total = content.size();
			int fromIndex = (pageNum - 1) * size;
			int toIndex = Math.min(fromIndex + size, total);
			if (fromIndex > toIndex) {
				return new ArticlePage(total, pageNum, size, List.of());
			}
			return new ArticlePage(total, pageNum, size, content.subList(fromIndex, toIndex));
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public ArticlePage searchByTitleAndCategory(String category, String title, int pageNum) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			List<Article> content = articleDao.searchByTitleAndCategory(conn, category, title);
			int total = content.size();
			int fromIndex = (pageNum - 1) * size;
			int toIndex = Math.min(fromIndex + size, total);
			if (fromIndex > toIndex) {
				return new ArticlePage(total, pageNum, size, List.of());
			}
			return new ArticlePage(total, pageNum, size, content.subList(fromIndex, toIndex));
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public ArticlePage searchByWriterNameAndCategory(String category, String writerName, int pageNum) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			List<Article> content = articleDao.searchByWriterNameAndCategory(conn, category, writerName);
			int total = content.size();
			int fromIndex = (pageNum - 1) * size;
			int toIndex = Math.min(fromIndex + size, total);
			if (fromIndex > toIndex) {
				return new ArticlePage(total, pageNum, size, List.of());
			}
			return new ArticlePage(total, pageNum, size, content.subList(fromIndex, toIndex));
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
