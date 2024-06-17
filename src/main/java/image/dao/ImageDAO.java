package image.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import image.model.Image;

// RegisterProductService
public class ImageDAO {
	public Image insert(Connection con, Image img) throws SQLException {
		String query = "insert into image (seller_id, product_id, file_name) values (?, ?, ?)";
		try (PreparedStatement ps = con.prepareStatement(query)) {
			ps.setString(1, img.getSellerId());
			ps.setInt(2, img.getProductId());
			ps.setString(3, img.getFileName());

			int result = ps.executeUpdate();

			if (result > 0) {
				return img;
			} else {
				return null;
			}
		}
	}

	// ListProductService, ReadProductService
	public List<Image> selectByProductId(Connection con, int productId) throws SQLException {
		String query = "select * from image where product_id = ?";

		try (PreparedStatement ps = con.prepareStatement(query)) {
			ps.setInt(1, productId);
			ResultSet rs = ps.executeQuery();
			List<Image> images = new ArrayList<>();
			while (rs.next()) {
				images.add(new Image(rs.getInt("image_id"), rs.getString("seller_id"), rs.getInt("product_id"),
						rs.getString("file_name")));
			}
			return images;
		}
	}

	// update
	public void update(Connection con, String sellerId, int productId, List<String> fileNames) throws SQLException {
		if (delete(con, productId) == 0) {
			throw new SQLException("Failed to delete existing images for product ID: " + productId);
		}

		String query = "insert into image (seller_id, product_id, file_name) values (?, ?, ?)";

		try (PreparedStatement ps = con.prepareStatement(query)) {
			for (String fileName : fileNames) {
				ps.setString(1, sellerId);
				ps.setInt(2, productId);
				ps.setString(3, fileName);
				ps.executeUpdate();
			}
		}
	}

	public int delete(Connection con, int productId) throws SQLException {
		String query = "delete from image where product_id=?";

		try (PreparedStatement ps = con.prepareStatement(query)) {
			ps.setInt(1, productId);

			return ps.executeUpdate();
		}
	}

	public int deleteToChange(Connection con, int imgId) throws SQLException {
		String query = "delete from image where image_id=?";

		try (PreparedStatement ps = con.prepareStatement(query)) {
			ps.setInt(1, imgId);

			return ps.executeUpdate();
		}
	}
}
