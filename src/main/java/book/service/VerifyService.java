package book.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import product.dao.ProductDAO;

public class VerifyService {

    private ProductDAO prodDAO = new ProductDAO();

    public boolean isValid(VerifyRequest veriReq) throws SQLException {
        Connection con = null;
        try {
            con = ConnectionProvider.getConnection();
            return true;
        } finally {
            JdbcUtil.close(con);
        }
    }
}
