package home.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import jdbc.connection.ConnectionProvider;
import product.dao.ProductDAO;
import product.model.Product;

public class HomeScreenService {
	
	private ProductDAO productDAO=new ProductDAO();
	private int size=10; // 최대 10개의 자료 출력
	
	
	public HomePage getHomePage(int page) {
		try (Connection con=ConnectionProvider.getConnection()){
			// 각자 DAO에서 최근 추가된 size개수의 자료를 불러온다.)\
			List<Product> products=productDAO.select(con, page, size);
			
			// 불러온 list 객체를 HomePage()메소드에 매개변수로 추가.
			return new HomePage(products);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
