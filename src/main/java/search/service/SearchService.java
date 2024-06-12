package search.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import image.dao.ImageDAO;
import image.model.Image;
import jdbc.connection.ConnectionProvider;
import product.dao.ProductDAO;
import product.model.Product;
import product.service.ProductPage;
import product.service.ProductWithImage;

public class SearchService {
	
	private ProductDAO productDAO = new ProductDAO();
	private ImageDAO imageDAO = new ImageDAO();
	private int size=10;
	
	public ProductPage getProductPage(int page, String keyword) {
		try (Connection con = ConnectionProvider.getConnection()){
			
			int total = productDAO.selectCountWithTitle(con, keyword);
			
			System.out.println(total);
			List<Product> products = productDAO.selectByKeyword(con, (page-1)*size, size, keyword);
			List<ProductWithImage> pwi = new ArrayList<>();
			
			for(Product product : products) {
				List<Image> images = imageDAO.selectByProductNum(con, product.getProductNum());
				pwi.add(new ProductWithImage(product, images));
			}
			
			return new ProductPage(total, page, size, pwi); 
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	//06_12수정
	public ProductPage getArticlePage(int page, String keyword) {
		try (Connection con = ConnectionProvider.getConnection()){
			
			int total = productDAO.selectCountWithTitle(con, keyword);
			
			System.out.println(total);
			List<Product> products = productDAO.selectByKeyword(con, (page-1)*size, size, keyword);
			List<ProductWithImage> pwi = new ArrayList<>();
			
			for(Product product : products) {
				List<Image> images = imageDAO.selectByProductNum(con, product.getProductNum());
				pwi.add(new ProductWithImage(product, images));
			}
			
			return new ProductPage(total, page, size, pwi); 
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
