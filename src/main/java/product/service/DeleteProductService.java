package product.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import product.dao.ProductContentDAO;
import product.dao.ProductDAO;
import product.model.Product;

public class DeleteProductService {
	
	private ProductDAO productDAO = new ProductDAO();
	private ProductContentDAO contentDAO = new ProductContentDAO();
	
	public void delete(DeleteRequest delReq) {
		Connection con=null;
		 try {
			con=ConnectionProvider.getConnection();
			con.setAutoCommit(false);
			
			Product product = productDAO.selectById(con, delReq.getProductNum());
			
			if (product == null) {
				throw new ProductNotFoundException();
			}
			if (!canDelete(delReq.getMemberid(), product)) {
				throw new PermissionDeninedException();
			}
			
			productDAO.delete(con, delReq.getProductNum());
			contentDAO.delete(con, delReq.getProductNum());
			con.commit();
		} catch (SQLException e) {
			JdbcUtil.rollback(con);
			throw new RuntimeException();
		} catch (PermissionDeninedException e){
			JdbcUtil.rollback(con);
			throw e;
		} finally {
			JdbcUtil.close(con);
		}
	}
	
	public boolean canDelete(String deleteID, Product product) {
		return product.getWriter().getId().equals(deleteID);
	}

}