package search.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import board.dao.ArticleDao;
import board.model.Article;
import board.service.ArticlePage;
import image.dao.ImageDAO;
import image.model.Image;
import jdbc.connection.ConnectionProvider;
import product.dao.ProductDAO;
import product.model.Product;
import product.service.Display;

public class SearchService {
	
	private ProductDAO productDAO = new ProductDAO();
	private ArticleDao articleDAO = new ArticleDao();
	private ImageDAO imageDAO = new ImageDAO();
	private int size=10;
	
	public SearchPage getSearchPage(int page, String keyword) {
		try (Connection con = ConnectionProvider.getConnection()){
			
			List<Product> products = productDAO.selectByKeyword(con, (page-1)*size, size, keyword);
			List<Article> articles = articleDAO.searchAllByTitle(con, keyword, (page-1)*size, size);
			List<Display> displays = new ArrayList<>();
			
			int totalProduct = productDAO.selectCountWithTitle(con, keyword);
			int totalArticle = articles.size();
			int total;
			
			if(totalProduct >= totalArticle) {
				total=totalProduct;
			} else {
				total=totalArticle;
			}
			
			for(Product product : products) {
				List<Image> images = imageDAO.selectByProductId(con, product.getProductId());
				Image thumbnail = images.isEmpty() ? null : images.get(0);
				displays.add(new Display(product, thumbnail));
			}
			
			return new SearchPage(total, page, size, displays, articles); 
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	//06_12수정
	public ArticlePage getArticlePage(int page, String keyword) {
		try (Connection con = ConnectionProvider.getConnection()){
			
			List<Article> articles = articleDAO.searchAllByTitle(con, keyword, page, size);
			int total = articles.size();
			
			return new ArticlePage(total, page, size, articles); 
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
