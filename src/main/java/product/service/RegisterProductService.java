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
			System.out.println("Product inserted: " + savedProduct);

			ProductContent content = toContent(savedProduct, req);
			ProductContent savedContent = contentDAO.insert(con, content);

			if (savedContent == null) {
				throw new RuntimeException("fail to insert product_content");
			}
			System.out.println("Product content inserted: " + savedContent);

			List<Image> images = toImages(savedProduct, req.getFileNames(), req);
			for (Image img : images) {
				System.out.println("INserting Image: " + img.getFileName());
				Image savedImage = imageDAO.insert(con, img);
				if (savedImage == null) {
					throw new RuntimeException("fail to insert image");
				}
				System.out.println("image inserted: " + savedImage);
			}

			con.commit();
			return savedProduct.getProductId();
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
		return new Product(null, req.getSeller(), req.getProductTitle(), req.getProductCategory(), req.getLocation(),
				req.getPrice(), "available");
	}

	private ProductContent toContent(Product save, RegisterRequest req) {
		Date now = new Date();
		return new ProductContent(save.getProductId(), req.getProductContent(), req.getProductSubTitle(),
				req.getMaxGuests(), now, now);
	}

	private List<Image> toImages(Product save, List<String> fileNames, RegisterRequest req) {
		List<Image> images = new ArrayList<>();
		for (String fileName : fileNames) {
			System.err.println("Preparing to insert image: " + fileName);
			images.add(new Image(null, req.getSeller().getId(), save.getProductId(), fileName));
		}
		return images;

	}
}