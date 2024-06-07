package guestbook.dao;

import guestbook.model.Message;
import jdbc.JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class MessageDao {
    private static MessageDao messageDao = new MessageDao();

    public static MessageDao getInstance() {
        return messageDao;
    }

    public MessageDao() {}

    public int insert(Connection conn, Message message) throws SQLException {
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(
                    "INSERT INTO guestbook_message (guest_name, password, message) VALUES (?, ?, ?)"
            );
            pstmt.setString(1, message.getGuestName());
            pstmt.setString(2, message.getPassword());
            pstmt.setString(3, message.getMessage());
            return pstmt.executeUpdate();
        } finally {
            JdbcUtil.close(pstmt);
        }
    }

    public Message select(Connection conn, int messageId) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(
                    "SELECT * FROM guestbook_message WHERE message_id = ?"
            );
            pstmt.setInt(1, messageId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return makeMessageFromResultSet(rs);
            } else {
                return null;
            }
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    private Message makeMessageFromResultSet(ResultSet rs) throws SQLException {
        Message message = new Message();
        message.setId(rs.getInt("message_id"));
        message.setGuestName(rs.getString("guest_name"));
        message.setPassword(rs.getString("password"));
        message.setMessage(rs.getString("message"));
        return message;
    }

    public int selectCount(Connection conn) throws SQLException {
        Statement stmt = null;
        ResultSet rs = null;
        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT COUNT(*) FROM guestbook_message");
            rs.next();
            return rs.getInt(1);
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(stmt);
        }
    }

    public List<Message> selectList(Connection conn, int firstRow, int endRow) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(
                    "SELECT * FROM guestbook_message ORDER BY message_id DESC LIMIT ?, ?"
            );
            pstmt.setInt(1, firstRow - 1);
            pstmt.setInt(2, endRow - firstRow + 1);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                List<Message> messageList = new ArrayList<>();
                do {
                    messageList.add(makeMessageFromResultSet(rs));
                } while (rs.next());
                return messageList;
            } else {
                return Collections.emptyList();
            }
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public int delete(Connection conn, int message_id) throws SQLException {
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(
                    "DELETE FROM guestbook_message WHERE message_id = ?"
            );
            pstmt.setInt(1, message_id);
            return pstmt.executeUpdate();
        } finally {
            JdbcUtil.close(pstmt);
        }
    }
}
