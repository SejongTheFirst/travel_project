package product.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import image.dao.ImageDAO;
import image.model.Image;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import product.dao.ProductContentDAO;
import product.dao.ProductDAO;
import product.model.Product;
import product.model.ProductContent;

public class RegisterProductService {

	private ProductDAO productDAO = new ProductDAO();
	private ProductContentDAO contentDAO = new ProductContentDAO();
	private ImageDAO imageDAO = new ImageDAO();

	public Integer register(RegisterRequest req) {
		Connection con = null;

		try {
			con = ConnectionProvider.getConnection();
			con.setAutoCommit(false);

			Product product = toProduct(req);
			Product savedProduct = productDAO.insert(con, product);

			if (savedProduct == null) {
				throw new RuntimeException("fail to insert product");
			}

			ProductContent content = toContent(savedProduct, req);
			ProductContent savedContent = contentDAO.insert(con, content);

			if (savedContent == null) {
				throw new RuntimeException("fail to insert product_content");
			}

			List<Image> images = toImages(savedProduct, req.getFileNames(), req);
			for (Image img : images) {
				Image savedImg = imageDAO.insert(con, img);
				if (savedImg == null) {
					throw new RuntimeException("fail to insert image");
				}
			}

			con.commit();

			return savedProduct.getProductNum();
		} catch (SQLException e) {
			JdbcUtil.rollback(con);
			throw new RuntimeException(e);
		} catch (RuntimeException e) {
			JdbcUtil.rollback(con);
			throw e;
		} finally {
			JdbcUtil.close(con);
		}
	}

	private Product toProduct(RegisterRequest req) {

		return new Product(null, req.getProductTitle(), req.getProductCategory(), req.getPrice(), req.getSeller());
	}

	private ProductContent toContent(Product save, RegisterRequest req) {
		Date now = new Date();
		return new ProductContent(save.getProductNum(), req.getProductSubTitle(), req.getProductContent(),
				req.getProductCategory(), req.getGuests(), req.getLocation(), now, now);
	}

	private List<Image> toImages(Product save, List<String> fileNames, RegisterRequest req) {
		List<Image> images = new ArrayList<>();
		for (String fileName : fileNames) {
			images.add(new Image(null, fileName, req.getSeller().getId(), save.getProductNum()));
		}
		return images;
	}

}