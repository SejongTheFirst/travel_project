package product.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import image.dao.ImageDAO;
import image.model.Image;
import jdbc.connection.ConnectionProvider;
import product.dao.ProductContentDAO;
import product.dao.ProductDAO;
import product.model.Product;
import product.model.ProductContent;

public class ListProductService {

	private ProductDAO productDAO = new ProductDAO();
	private ProductContentDAO contentDAO = new ProductContentDAO();
	private ImageDAO imageDAO = new ImageDAO();
	private int size = 10;

	public ProductPage getRoomProductPage(int pageNum) {
		try (Connection con = ConnectionProvider.getConnection()) {
			int total = productDAO.selectCount(con);
			
			List<ProductContent> contents = contentDAO.selectByCategory(con, "숙박", (pageNum-1)*size, size);
			List<ProductWithImage> PWI= new ArrayList<>();
			
			for (ProductContent content : contents) {
				List<Product> products = productDAO.selectByCategory(con, content.getProductNum(), (pageNum - 1) * size, size);
				List<Image> images = imageDAO.selectByProductNum(con, content.getProductNum());
				PWI.add(new ProductWithImage(products, images));
			}
			return new ProductPage(total, pageNum, size, PWI);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public ProductPage getExperienceProductPage(int pageNum) {
		try (Connection con = ConnectionProvider.getConnection()) {
			int total = productDAO.selectCount(con);
			
			List<ProductContent> experiences = contentDAO.selectByCategory(con, "체험", (pageNum-1)*size, size);
			List<ProductWithImage> PWI= new ArrayList<>();
			
			for (ProductContent experience : experiences) {
				List<Product> products = productDAO.selectByCategory(con, experience.getProductNum(), (pageNum - 1) * size, size);
				List<Image> images = imageDAO.selectByProductNum(con, experience.getProductNum());
				PWI.add(new ProductWithImage(products, images));
			}
			return new ProductPage(total, pageNum, size, PWI);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}