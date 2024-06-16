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

	

	public int update(Connection con, String original, String store, int num) throws SQLException {
		String query = "update image set original_name=?, store_name=? where product_id=?";

		try (PreparedStatement ps = con.prepareStatement(query)) {
			ps.setString(1, original);
			ps.setString(2, store);
			ps.setInt(3, num);

			return ps.executeUpdate();
		}
	}

	public int delete(Connection con, int productNum) throws SQLException {
		String query = "delete from image where product_id=?";

		try (PreparedStatement ps = con.prepareStatement(query)) {
			ps.setInt(1, productNum);

			return ps.executeUpdate();
		}
	}

	public int deleteToChange(Connection con, int imgId) throws SQLException {
		String query = "delete from image where img_id=?";

		try (PreparedStatement ps = con.prepareStatement(query)) {
			ps.setInt(1, imgId);

			return ps.executeUpdate();
		}
	}

}
