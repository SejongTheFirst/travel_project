package product.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import image.dao.ImageDAO;
import image.model.Image;
import jdbc.connection.ConnectionProvider;
import product.dao.ProductContentDAO;
import product.dao.ProductDAO;
import product.model.Product;
import product.model.ProductContent;

public class ReadProductService {

	private ProductDAO productDAO = new ProductDAO();
	private ProductContentDAO contentDAO = new ProductContentDAO();
	private ImageDAO imgDAO = new ImageDAO();

	public ProductData getProduct(int productId) {
		try (Connection con = ConnectionProvider.getConnection()) {
			Product product = productDAO.selectByProductId(con, productId);
			if (product == null) {
				throw new ProductNotFoundException(null);
			}

			ProductContent content = contentDAO.selectByProductId(con, productId);
			if (content == null) {
				throw new ProductContentNotFoundException();
			}

			List<Image> images = imgDAO.selectByProductId(con, productId);
			if (images == null) {
			}

			return new ProductData(product, content, images);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}