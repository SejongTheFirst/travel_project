package product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jdbc.JdbcUtil;
import product.model.Product;
import product.model.Seller;

public class ProductDAO {

	// RegisterProductService
	public Product insert(Connection con, Product product) throws SQLException {

		PreparedStatement ps = null;
		Statement stmt = null;
		ResultSet rs = null;

		String query = "insert into product (seller_id, product_title, product_category, location, price, status) values(?, ?, ?, ?, ?, ?)";

		try {
			ps = con.prepareStatement(query);

			ps.setString(1, product.getSeller().getId());
			ps.setString(2, product.getProductTitle());
			ps.setString(3, product.getProductCategory());
			ps.setString(4, product.getLocation());
			ps.setInt(5, product.getPrice());
			ps.setString(6, "available");
			int res = ps.executeUpdate();

			if (res > 0) {
				stmt = con.createStatement();
				rs = stmt.executeQuery("select last_insert_id() from product");
				if (rs.next()) {
					Integer id = rs.getInt(1);
					return new Product(id, product.getSeller(), product.getProductTitle(), product.getProductCategory(),
							product.getLocation(), product.getPrice(), product.getStatus());
				}
			}

			return null;
		} finally {
			JdbcUtil.close(ps);
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}

	// ListProductService
	public List<Product> selectByCategory(Connection con, String category, int startrow, int size) throws SQLException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "select*from product where product_category=? order by product_id desc limit ?,?";

		try {
			ps = con.prepareStatement(query);
			ps.setString(1, category);
			ps.setInt(2, startrow);
			ps.setInt(3, size);
			rs = ps.executeQuery();

			List<Product> products = new ArrayList<>();
			while (rs.next()) {
				products.add(convertToProduct(rs));
			}
			return products;
		} finally {
			JdbcUtil.close(ps);
			JdbcUtil.close(rs);
		}
	}

	// ReadProductService
	public Product selectByProductId(Connection con, int productId) throws SQLException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement("select*from product where product_id=?");
			ps.setInt(1, productId);
			rs = ps.executeQuery();
			Product product = null;

			if (rs.next()) {
				product = convertToProduct(rs);
			}
			return product;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(ps);
		}
	}

	public int selectCount(Connection con) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery("select count(*) from product");

			if (rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}

	public int selectCountWithTitle(Connection con, String title) throws SQLException {
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("select count(*) from product where product_title like ?");
			ps.setString(1, "%" + title + "%");
			rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		} finally {
			JdbcUtil.close(ps);
			JdbcUtil.close(rs);
		}
	}

	public List<Product> selectOrderByProductId(Connection con, int startRow, int size) throws SQLException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement("select*from product order by product_id desc limit ?,?");
			ps.setInt(1, startRow);
			ps.setInt(2, size);
			rs = ps.executeQuery();
			List<Product> products = new ArrayList<Product>();
			while (rs.next()) {
				products.add(convertToProduct(rs));
			}
			return products;

		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(ps);
		}
	}


	// SearchService
	public List<Product> selectByKeyword(Connection con, int startRow, int size, String keyword) throws SQLException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(
					"select*from product where product_title like ? order by product_id desc limit ?,?");
			ps.setString(1, "%" + keyword + "%");
			ps.setInt(2, startRow);
			ps.setInt(3, size);
			rs = ps.executeQuery();
			List<Product> result = new ArrayList<Product>();
			while (rs.next()) {
				result.add(convertToProduct(rs));
			}
			return result;

		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(ps);
		}
	}

	// return Product
	private Product convertToProduct(ResultSet rs) throws SQLException {
		return new Product(rs.getInt("product_id"), new Seller(rs.getString("seller_id")),
				rs.getString("product_title"), rs.getString("product_category"), rs.getString("location"),
				rs.getInt("price"), rs.getString("status"));
	}

	public int update(Connection con, String title, int price, int no) throws SQLException {
		String query = "update product set product_title=?, price=? where product_num=?";
		try (PreparedStatement ps = con.prepareStatement(query)) {
			ps.setString(1, title);
			ps.setInt(2, price);
			ps.setInt(3, no);
			return ps.executeUpdate();
		}
	}

	public int delete(Connection con, int no) throws SQLException {
		String query = "delete from product where product_num=?";

		try (PreparedStatement ps = con.prepareStatement(query)) {
			ps.setInt(1, no);

			return ps.executeUpdate();
		}
	}

}