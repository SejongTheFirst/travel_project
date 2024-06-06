package product.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import product.dao.ProductContentDAO;
import product.dao.ProductDAO;
import product.model.Product;
import product.model.ProductContent;

public class WriteProductService {
	
	private ProductDAO productDAO = new ProductDAO();
	private ProductContentDAO contentDAO = new ProductContentDAO();
	
	public Integer write(WriteRequest req) {
		Connection con=null;
		
		try {
			con=ConnectionProvider.getConnection();
			con.setAutoCommit(false);
			
			Product product=toProduct(req);
			Product savedProduct = productDAO.insert(con, product);
			
			if (savedProduct == null) {
				throw new RuntimeException("fail to insert product");
			}
			
			ProductContent content = toContent(savedProduct, req);
			ProductContent savedContent = contentDAO.insert(con, content);
			
			if (savedContent == null) {
				throw new RuntimeException("fail to insert priduct_content");
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
	
	private Product toProduct(WriteRequest req) {
		Date now = new Date();
		return new Product(null, req.getProductTitle(), req.getPrice(), req.getWriter());
	}
	
	private ProductContent toContent(Product save, WriteRequest req) {
		Date now = new Date();
		return new ProductContent(save.getProductNum(), req.getProductSubTitle(), req.getProductContent(), req.getProductType() , req.getGuests(), req.getLocation(), req.getImgUrl(), now, now);
	}
	
	private Date toDate(String date) {
		DateFormat df = new SimpleDateFormat("yyMMdd");
		Date day = null;
		try {
		day = df.parse(date);
		return day;
		} catch(ParseException e) {
			return null;
		}
	}
}