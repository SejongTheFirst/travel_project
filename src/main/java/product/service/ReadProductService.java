package product.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.connection.ConnectionProvider;
import product.dao.ProductContentDAO;
import product.dao.ProductDAO;
import product.model.Product;
import product.model.ProductContent;

public class ReadProductService {
	
	private ProductDAO productDAO=new ProductDAO();
	private ProductContentDAO contentDAO=new ProductContentDAO();
	
	public ProductData getProduct(int productNum) {
		try (Connection con=ConnectionProvider.getConnection()){
			Product product=productDAO.selectById(con, productNum);
			if(product == null) {
				throw new ProductNotFoundException();
			}
			
			ProductContent content=contentDAO.selectById(con, productNum);
			if(content == null) {
				throw new ProductContentNotFoundException();
			}
			return new ProductData(product, content);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}