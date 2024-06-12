package payment.service;

import java.sql.Connection;
import java.sql.SQLException;

import payment.dao.PaymentDAO;
import payment.model.Payment;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class PayService {
    private PaymentDAO paymentDAO = new PaymentDAO();

    public boolean isValid(PayRequest payReq) {
        return true;
    }

    public void registerPayment(Payment payment) throws SQLException {
        Connection con = null;
        try {
            con = ConnectionProvider.getConnection();
            con.setAutoCommit(false);

            paymentDAO.insert(con, payment);

            con.commit();
        } catch (SQLException e) {
            JdbcUtil.rollback(con);
            throw e;
        } finally {
            JdbcUtil.close(con);
        }
    }
}
