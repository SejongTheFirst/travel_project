package home.service;

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
import product.service.ProductWithImage;

public class HomeScreenService {

	private ProductDAO productDAO = new ProductDAO();
	private ProductContentDAO contentDAO = new ProductContentDAO();
	private ImageDAO imageDAO = new ImageDAO();
	private int size = 10; // 최대 10개의 자료 출력

	public HomePage getRoomPage(int page) {
		try (Connection con = ConnectionProvider.getConnection()) {
			
			List<ProductContent> contents = contentDAO.selectByCategory(con, "숙박", page, size);
			List<ProductWithImage> pwi = new ArrayList<>();
			
			for (ProductContent content : contents) {
				 System.out.println("숙박 Content: " + content.getProductType());
				List<Product> products = productDAO.selectByCategory(con, content.getProductNum(), page, size);
				List<Image> images = imageDAO.selectByProductNum(con, content.getProductNum());
				pwi.add(new ProductWithImage(products, images));
			}
			
			return new HomePage(pwi);
		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public HomePage getExperience(int page) {
		try (Connection con = ConnectionProvider.getConnection()) {
			List<ProductContent> experiences = contentDAO.selectByCategory(con, "체험", page, size);
			List<ProductWithImage> pwi = new ArrayList<>();
			
			for (ProductContent experience : experiences) {
				System.out.println("체험 Content: " + experience.getProductType());
				List<Product> products = productDAO.selectByCategory(con, experience.getProductNum(), page, size);
				List<Image> images = imageDAO.selectByProductNum(con, experience.getProductNum());
				pwi.add(new ProductWithImage(products, images));
			}

			return new HomePage(pwi);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public HomePage getAtivity(int page) {
		try (Connection con = ConnectionProvider.getConnection()) {
			List<ProductContent> activites = contentDAO.selectByCategory(con, "활동", page, size);
			List<ProductWithImage> pwi = new ArrayList<>();
			
			for (ProductContent activity : activites) {
				System.out.println("활동 Content: " + activity.getProductType());
				List<Product> products = productDAO.selectByCategory(con, activity.getProductNum(), page, size);
				List<Image> images = imageDAO.selectByProductNum(con, activity.getProductNum());
				pwi.add(new ProductWithImage(products, images));
			}
			
			return new HomePage(pwi);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
