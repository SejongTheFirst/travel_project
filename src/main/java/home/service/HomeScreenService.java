package home.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import image.dao.ImageDAO;
import image.model.Image;
import jdbc.connection.ConnectionProvider;
import product.dao.ProductDAO;
import product.model.Product;
import product.service.ProductWithImage;

public class HomeScreenService {

	private ProductDAO productDAO = new ProductDAO();
	private ImageDAO imageDAO = new ImageDAO();
	private int size = 10; // 최대 10개의 자료 출력

	public HomePage getHomePage(int page) {
		try (Connection con = ConnectionProvider.getConnection()) {
			// 각자 DAO에서 최근 추가된 size개수의 자료를 불러온다.)\
			List<Product> products = productDAO.select(con, page, size);
			List<ProductWithImage> content = new ArrayList<>();
			for (Product product : products) {
				List<Image> images = imageDAO.selectByProductNum(con, product.getProductNum());
				content.add(new ProductWithImage(product, images));
			}
			// 불러온 list 객체를 HomePage()메소드에 매개변수로 추가.
			return new HomePage(content);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
