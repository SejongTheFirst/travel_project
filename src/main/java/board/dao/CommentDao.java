package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import board.model.Comment;
import board.model.Reply;
import jdbc.JdbcUtil;

public class CommentDao {

	public List<Comment> selectCommentsByUser(Connection conn, String userId, int startRow, int size)
			throws SQLException {
		String sql = "SELECT c.*, com.title AS articleTitle FROM comment c "
				+ "JOIN comunity com ON c.board_num = com.board_num "
				+ "WHERE c.comment_id = ? ORDER BY c.regdate DESC LIMIT ?, ?";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, userId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, size);
			try (ResultSet rs = pstmt.executeQuery()) {
				List<Comment> result = new ArrayList<>();
				while (rs.next()) {
					result.add(convertComment(rs));
				}
				return result;
			}
		}
	}

	public List<Reply> selectRepliesByUser(Connection conn, String userId, int startRow, int size) throws SQLException {
		String sql = "SELECT r.*, com.board_num, c.board_num AS article_no, com.title AS articleTitle FROM reply r "
				+ "JOIN comment c ON r.comment_no = c.comment_no "
				+ "JOIN comunity com ON c.board_num = com.board_num "
				+ "WHERE r.reply_id = ? ORDER BY r.regdate DESC LIMIT ?, ?";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, userId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, size);
			try (ResultSet rs = pstmt.executeQuery()) {
				List<Reply> result = new ArrayList<>();
				while (rs.next()) {
					result.add(convertReply(rs));
				}
				return result;
			}
		}
	}

	public int countCommentsByUser(Connection conn, String userId) throws SQLException {
		String sql = "SELECT COUNT(*) FROM comment WHERE comment_id = ?";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, userId);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return rs.getInt(1);
				}
				return 0;
			}
		}
	}

	public int countRepliesByUser(Connection conn, String userId) throws SQLException {
		String sql = "SELECT COUNT(*) FROM reply WHERE reply_id = ?";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, userId);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return rs.getInt(1);
				}
				return 0;
			}
		}
	}

	private Comment convertComment(ResultSet rs) throws SQLException {
		return new Comment(rs.getInt("board_num"), rs.getInt("comment_no"), rs.getString("comment_id"),
				rs.getString("comment_name"), rs.getString("content"), rs.getTimestamp("regdate"),
				rs.getString("category"), rs.getString("articleTitle"));
	}

	private Reply convertReply(ResultSet rs) throws SQLException {
		return new Reply(rs.getInt("comment_no"), rs.getInt("reply_no"), rs.getString("reply_id"),
				rs.getString("reply_name"), rs.getString("content"), rs.getTimestamp("regdate"),
				rs.getString("category"), rs.getString("articleTitle"), rs.getInt("article_no"), rs.getInt("board_num")

		);
	}

	public List<Comment> getCommentsByArticle(Connection conn, int articleNo) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Comment> comments = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM comment WHERE board_num = ? ORDER BY regdate DESC");
			pstmt.setInt(1, articleNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Comment comment = new Comment(rs.getInt("board_num"), rs.getInt("comment_no"),
						rs.getString("comment_id"), rs.getString("comment_name"), rs.getString("content"),
						rs.getTimestamp("regdate"), rs.getString("category"));
				comment.setReplies(getRepliesByComment(conn, rs.getInt("comment_no")));
				comments.add(comment);
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return comments;
	}

	public List<Reply> getRepliesByComment(Connection conn, int commentNo) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Reply> replies = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM reply WHERE comment_no = ? ORDER BY regdate asc");
			pstmt.setInt(1, commentNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Reply reply = new Reply(rs.getInt("comment_no"), rs.getInt("reply_no"), rs.getString("reply_id"),
						rs.getString("reply_name"), rs.getString("content"), rs.getTimestamp("regdate"),
						rs.getString("category"));
				replies.add(reply);
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return replies;
	}

	public void insertComment(Connection conn, Comment comment) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
					"INSERT INTO comment (board_num, comment_id, comment_name, content, regdate, category) "
							+ "VALUES (?, ?, ?, ?, ?, ?)");
			pstmt.setInt(1, comment.getArticle_no());
			pstmt.setString(2, comment.getCommentId());
			pstmt.setString(3, comment.getCommentName());
			pstmt.setString(4, comment.getContent());
			pstmt.setTimestamp(5, new Timestamp(comment.getRegDate().getTime()));
			pstmt.setString(6, comment.getCategory());
			pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	public void insertReply(Connection conn, Reply reply) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
					"INSERT INTO reply (comment_no, reply_id, reply_name, content, regdate, category) "
							+ "VALUES (?, ?, ?, ?, ?, ?)");
			pstmt.setInt(1, reply.getComment_no());
			pstmt.setString(2, reply.getReplyId());
			pstmt.setString(3, reply.getReplyName());
			pstmt.setString(4, reply.getContent());
			pstmt.setTimestamp(5, new Timestamp(reply.getRegDate().getTime()));
			pstmt.setString(6, reply.getCategory());
			pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	public void deleteComment(Connection conn, int commentNo) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("DELETE FROM comment WHERE comment_no = ?");
			pstmt.setInt(1, commentNo);
			int rowsAffected = pstmt.executeUpdate();
			if (rowsAffected == 0) {
				throw new SQLException("No comment found with comment_no: " + commentNo);
			}
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	public void deleteReply(Connection conn, int replyNo) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("DELETE FROM reply WHERE reply_no = ?");
			pstmt.setInt(1, replyNo);
			int rowsAffected = pstmt.executeUpdate();
			if (rowsAffected == 0) {
				throw new SQLException("No reply found with reply_no: " + replyNo);
			}
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	public void updateComment(Connection conn, int commentNo) throws SQLException {
		PreparedStatement pstmt = null;
	}

	public void updateComment(Connection conn, int commentNo, String content) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("UPDATE comment SET content = ? WHERE comment_no = ?");
			pstmt.setString(1, content);
			pstmt.setInt(2, commentNo);
			pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	public void updateReply(Connection conn, int replyNo, String content) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("UPDATE reply SET content = ? WHERE reply_no = ?");
			pstmt.setString(1, content);
			pstmt.setInt(2, replyNo);
			pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
}
