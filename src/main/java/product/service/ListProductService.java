package product.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import jdbc.connection.ConnectionProvider;
import product.dao.ProductDAO;
import product.model.Product;

public class ListProductService {
	
	private ProductDAO productDAO=new ProductDAO();
	private int size=10;
	
	public ProductPage getProductPage(int pageNum) {
		try (Connection con=ConnectionProvider.getConnection()){
			int total=productDAO.selectCount(con);
			List<Product> content=productDAO.select(con, (pageNum-1)*size, size);
			return new ProductPage(total, pageNum, size, content);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}