package test.biz;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import test.model.DBConn;
import test.model.TestMemberVO;

public class TestMemberDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	
	public int joinTestMember(TestMemberVO vo) {
		int r = 0;
		try { 
			conn = DBConn.getConnection();
			String sql = "insert into testmember values (tm_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getMid());
			stmt.setString(2, vo.getPw());
			stmt.setString(3, vo.getName());
			stmt.setString(4, vo.getEmail());
			stmt.setString(5, vo.getPostcode());
			stmt.setString(6, vo.getAddress());
			r = stmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 연결 오류");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("기타 오류");
			e.printStackTrace();
		} finally {
			DBConn.close(stmt, conn);
		}
		
		return r;
	}
	
	
	public TestMemberVO loginTestMember(TestMemberVO vo) {
		TestMemberVO tm = null;
		//ctrl에서 값을 준다
		try {
			conn = DBConn.getConnection();
			String sql = "select * from testmember where mid =? and pw =?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,  vo.getMid());
			stmt.setString(2, vo.getPw());
			rs = stmt.executeQuery();
			tm = new TestMemberVO();
			if (rs.next()) {
				
				System.out.println("rs통과");
				
				tm.setIdx(rs.getInt("idx"));
				tm.setMid(rs.getString("mid"));
				tm.setName("name");
				tm.setEmail(rs.getString("email"));
				tm.setPostcode(rs.getString("postcode"));
				tm.setAddress(rs.getString("address"));
				tm.setRegdate(rs.getDate("regdate"));
			} else {
				System.out.println("회원정보가 없습니다.");
			}
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 연결 오류");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("기타 오류");
			e.printStackTrace();
		} finally {
			DBConn.close(stmt, conn);
		}
		
		return tm;
	}
}
