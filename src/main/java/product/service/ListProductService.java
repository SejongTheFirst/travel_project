package product.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import image.dao.ImageDAO;
import image.model.Image;
import jdbc.connection.ConnectionProvider;
import product.dao.ProductDAO;
import product.model.Product;

public class ListProductService {

	private ProductDAO productDAO = new ProductDAO();
	private ImageDAO imageDAO = new ImageDAO();
	private int size = 10;

	public ProductPage getRoomPage(int pageNum) {
		try (Connection con = ConnectionProvider.getConnection()) {
			int total = productDAO.selectCount(con);
			
			List<Product> rooms= productDAO.selectByCategory(con, "숙박", (pageNum-1)*size, size);
			List<Display> displays= new ArrayList<>();
			
			for (Product room: rooms) {
				List<Image> images = imageDAO.selectByProductId(con, room.getProductId());
				Image thumbnail = images.isEmpty() ? null : images.get(0);
				displays.add(new Display(room, thumbnail));
			}
			return new ProductPage(total, pageNum, size, displays);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public ProductPage getExperiencePage(int pageNum) {
		try (Connection con = ConnectionProvider.getConnection()) {
			int total = productDAO.selectCount(con);

			List<Product> experiences = productDAO.selectByCategory(con, "체험", (pageNum - 1) * size, size);
			List<Display> displays = new ArrayList<>();

			for (Product experience : experiences) {
				List<Image> images = imageDAO.selectByProductId(con, experience.getProductId());
				Image thumbnail = images.isEmpty() ? null : images.get(0);
				displays.add(new Display(experience, thumbnail));
			}
			return new ProductPage(total, pageNum, size, displays);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public ProductPage getActivityPage(int pageNum) {
		try (Connection con = ConnectionProvider.getConnection()) {
			int total = productDAO.selectCount(con);
			
			List<Product> activities = productDAO.selectByCategory(con, "활동", (pageNum - 1) * size, size);
			List<Display> displays = new ArrayList<>();
			
			for (Product activity : activities) {
				List<Image> images = imageDAO.selectByProductId(con, activity.getProductId());
				Image thumbnail = images.isEmpty() ? null : images.get(0);
				displays.add(new Display(activity, thumbnail));
			}
			return new ProductPage(total, pageNum, size, displays);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}