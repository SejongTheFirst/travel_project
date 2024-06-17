package product.service;

import java.sql.Connection;
import java.sql.SQLException;

import board.service.PermissionDeniedException;
import image.dao.ImageDAO;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import product.dao.ProductContentDAO;
import product.dao.ProductDAO;
import product.model.Product;

public class ModifyProductService {

	private ProductDAO productDAO = new ProductDAO();
	private ProductContentDAO contentDAO = new ProductContentDAO();
	private ImageDAO imageDAO = new ImageDAO();

	public void modify(ModifyRequest modReq) {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			con.setAutoCommit(false);

			Product pro = productDAO.selectByProductId(con, modReq.getProductId());

			if (pro == null) {
				throw new ProductNotFoundException(null);
			}
			if (!canModify(modReq.getSellerId(), pro)) {
				throw new RuntimeException();
			}
			productDAO.update(con, modReq.getProductTitle(), modReq.getPrice(), modReq.getProductId());
			contentDAO.update(con, modReq.getProductId(), modReq.getProductSubtitle(), modReq.getProductContent());
			imageDAO.update(con, modReq.getSellerId(), modReq.getProductId(), modReq.getFileNames());
			con.commit();
		} catch (SQLException e) {
			JdbcUtil.rollback(con);
			throw new RuntimeException(e);
		} catch (PermissionDeniedException e) {
			JdbcUtil.rollback(con);
		} finally {
			JdbcUtil.close(con);
		}
	}

	private boolean canModify(String modifyingMemberId, Product product) {
		return product.getSeller().getId().equals(modifyingMemberId);
	}
}
