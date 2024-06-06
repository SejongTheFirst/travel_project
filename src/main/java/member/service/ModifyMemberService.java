package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import member.dao.MemberDAO;
import member.model.Member;

public class ModifyMemberService {
    private MemberDAO memberDAO = new MemberDAO();

    public void modifyMember(String id, String newMemberName, String curPwd, String newPwd, String newPhoneNum, String newBirthday) {
        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            conn.setAutoCommit(false);

            Member member = memberDAO.selectById(conn, id);
            if (member == null) {
                throw new MemberNotFoundException();
            }
            if (!member.matchPassword(curPwd)) {
                throw new InvalidPasswordException();
            }

            member.modifyMember(newMemberName, newPwd, newPhoneNum, newBirthday);
            memberDAO.update(conn, member);
            conn.commit();

        } catch (SQLException e) {
            JdbcUtil.rollback(conn);
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(conn);
        }
    }

    public Member getMemberById(String id) {
        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            return memberDAO.selectById(conn, id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(conn);
        }
    }
}