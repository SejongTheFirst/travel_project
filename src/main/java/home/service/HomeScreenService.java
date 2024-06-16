package home.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import board.model.Article;
import boardmain.dao.BoardMainFreeDao;
import image.dao.ImageDAO;
import image.model.Image;
import jdbc.connection.ConnectionProvider;
import product.dao.ProductDAO;
import product.model.Product;
import product.service.Display;

public class HomeScreenService {

	private ProductDAO productDAO = new ProductDAO();
	private ImageDAO imageDAO = new ImageDAO();
	private int size = 10;
	private BoardMainFreeDao articleDao = new BoardMainFreeDao();

	public HomePage getRoomPage(int page) {
		try (Connection con = ConnectionProvider.getConnection()) {

			List<Product> rooms = productDAO.selectByCategory(con, "숙박", page, size);
			List<Display> displays = new ArrayList<>();

			for (Product room : rooms) {
				List<Image> images = imageDAO.selectByProductId(con, room.getProductId());
				Image thumbnail = images.isEmpty() ? null : images.get(0);
				displays.add(new Display(room, thumbnail));
			}

			return new HomePage(displays);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public HomePage getExperiencePage(int page) {
		try (Connection con = ConnectionProvider.getConnection()) {
			List<Product> experiences = productDAO.selectByCategory(con, "체험", page, size);
			List<Display> displays = new ArrayList<>();

			for (Product experience : experiences) {
				List<Image> images = imageDAO.selectByProductId(con, experience.getProductId());
				Image thumbnail = images.isEmpty() ? null : images.get(0);
				displays.add(new Display(experience, thumbnail));
			}

			return new HomePage(displays);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public HomePage getAvtivityPage(int page) {
		try (Connection con = ConnectionProvider.getConnection()) {
			List<Product> activites = productDAO.selectByCategory(con, "활동", page, size);
			List<Display> displays = new ArrayList<>();

			for (Product activity : activites) {
				List<Image> images = imageDAO.selectByProductId(con, activity.getProductId());
				Image thumbnail = images.isEmpty() ? null : images.get(0);
				displays.add(new Display(activity, thumbnail));
			}

			return new HomePage(displays);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Article> getAllList() {
		try (Connection conn = ConnectionProvider.getConnection()) {
			return articleDao.AllList(conn);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
