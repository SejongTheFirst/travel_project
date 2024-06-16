package product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import jdbc.JdbcUtil;
import product.model.ProductContent;

public class ProductContentDAO {

	// RegisterProductService
	public ProductContent insert(Connection con, ProductContent content) throws SQLException {
		PreparedStatement ps = null;
		String query = "insert into product_content (product_id, product_content, product_subtitle, max_guests, reg_date, mod_date) values(?, ?, ?, ?, ?, ?)";

		try {
			ps = con.prepareStatement(query);
			ps.setInt(1, content.getProductId());
			ps.setString(2, content.getProductContent());
			ps.setString(3, content.getProductSubTitle());
			ps.setInt(4, content.getMaxGuests());
			ps.setTimestamp(5, toTimestamp(content.getRegDate()));
			ps.setTimestamp(6, toTimestamp(content.getModDate()));

			int res = ps.executeUpdate();

			if (res > 0) {
				return content;
			} else {
				return null;
			}

		} finally {
			JdbcUtil.close(ps);
		}
	}

	public ProductContent selectById(Connection con, int ProductId) throws SQLException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement("select*from product_content where product_id=?");
			ps.setInt(1, ProductId);
			rs = ps.executeQuery();

			ProductContent content = null;
			if (rs.next()) {
				content = new ProductContent(rs.getInt("product_id"), rs.getString("product_content"),
						rs.getString("product_subtitle"), rs.getInt("max_guest"), toDate(rs.getTimestamp("reg_date")),
						toDate(rs.getTimestamp("mod_date")));
			}
			return content;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(ps);
		}
	}

	

	private Date toDate(Timestamp timestamp) {
		return new Date(timestamp.getTime());
	}

	public int update(Connection con, int no, String subtitle, String content) throws SQLException {
		String query = "update product_content set product_content=?, product_subtitle=? where product_num=?";
		try (PreparedStatement ps = con.prepareStatement(query)) {
			ps.setString(1, content);
			ps.setString(2, subtitle);
			ps.setInt(3, no);

			return ps.executeUpdate();
		}
	}

	public int delete(Connection con, int no) throws SQLException {
		String query = "delete from product_content where product_num=?";

		try (PreparedStatement ps = con.prepareStatement(query)) {
			ps.setInt(1, no);

			return ps.executeUpdate();
		}
	}

	// insert
	private Timestamp toTimestamp(Date date) {
		return new Timestamp(date.getTime());
	}
}