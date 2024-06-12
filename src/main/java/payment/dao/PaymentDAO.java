package payment.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import payment.model.Payment;
import jdbc.JdbcUtil;

public class PaymentDAO {

    public void insert(Connection con, Payment payment) throws SQLException {
        PreparedStatement ps = null;

        String query = "insert into payment (book_code, payment_key, payment_method, payment_total) values(?, ?, ?, ?)";

        
    }
}
