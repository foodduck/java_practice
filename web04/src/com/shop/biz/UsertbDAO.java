package com.shop.biz;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import com.shop.model.DBConn;
import com.shop.model.UsertbVO;




//배치(batch) 프로그래밍: 한 곳에서 일을 한꺼번에 처리하기 위한 프로그래밍
//Usertb 테이블에 접근하여 데이터 처리 요청되어 온 일들을 모두 한 곳에서 처리하기 위한 모듈

public class UsertbDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	//사용자 리스트를 데이터베이스에 접근하여 가져와서 VO에 담은 후 Controller에 리턴해 누는 역할의 메서드
	public ArrayList<UsertbVO> getUsertbList() {
		ArrayList<UsertbVO> usertbList = null;
		try {
			conn = DBConn.getConnection();
			String sql = "select userid, u_id, pw, uname, email, q, a, add1, add2, regdate, cp from usertb order by userid";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			usertbList = new ArrayList<UsertbVO>();
			while(rs.next()) {
				
				//데이터베이스 테이블에서 반환된 결과세트를 각 컬럼별로 지역변수에 담기
				int usertbid = rs.getInt("usertbid");
				String u_id = rs.getString("u_id");
				String pw = rs.getString("pw");
				String uname = rs.getString("uname");
				String email = rs.getString("email");
				String q = rs.getString("q");
				String a = rs.getString("a");
				String add1 = rs.getString("add1");
				String add2 = rs.getString("add2");
				Date regdate = rs.getDate("regdate");
				int cp = rs.getInt("cp");
				
				//각 지역변수에 담긴 필드값을 VO에 담기
				UsertbVO usertb = new UsertbVO();
				usertb.setUsertbid(usertbid);
				usertb.setU_id(u_id);
				usertb.setPw(pw);
				usertb.setUname(uname);
				usertb.setEmail(email);
				usertb.setQ(q);
				usertb.setA(a);
				usertb.setAdd1(add1);
				usertb.setAdd2(add2);
				usertb.setRegdate(regdate);
				usertb.setCp(cp);
				
				//VO에 담긴 데이터를 LIST에 답기
				usertbList.add(usertb);
			}
				
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("기타 오류");
			e.printStackTrace();
		} finally {
			DBConn.close(rs, stmt, conn);
		}
		//VO의 값을 LIST에 담은 결과를 반환
		return usertbList;
	}
	
	public UsertbVO getUsertb(UsertbVO vo) {
		UsertbVO usertb= null;
		try {
			conn = DBConn.getConnection();
			String sql = "select * from usertb where usertbid=?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, vo.getUsertbid());
			rs = stmt.executeQuery();
			if (rs.next()) {
				usertb = new UsertbVO();
				usertb.setUsertbid(rs.getInt("usertbid"));
				usertb.setU_id(rs.getString("u_id"));
				usertb.setPw(rs.getString("pw"));
				usertb.setUname(rs.getString("uname"));
				usertb.setEmail(rs.getString("email"));
				usertb.setQ(rs.getString("q"));
				usertb.setA(rs.getString("a"));
				usertb.setAdd1(rs.getString("add1"));
				usertb.setAdd2(rs.getString("add2"));
				usertb.setRegdate(rs.getDate("regdate"));
				usertb.setCp(rs.getInt("cp"));
			}
		} catch(ClassNotFoundException e) {
			System.out.println("드라이버 오류");
			e.printStackTrace();
		} catch(SQLException e) {
			System.out.println("SQL구문 오류");
			e.printStackTrace();
		} catch(Exception e) {
			System.out.println("기타 오류");
			e.printStackTrace();
		} finally {
			DBConn.close(rs, stmt, conn);
		}
		return usertb;
	}
	
	
	public int updateUsertb(UsertbVO vo) {

		int r=0;
		try {
			conn= DBConn.getConnection();
			String sql = "update Usertb set u_id=? pw=? uname=? email=? q=? a? add1? add2=? cp=? where Usertbid=?";
			stmt.getConnection().prepareStatement(sql);
			stmt.setString(1, vo.getU_id());
			stmt.setString(2, vo.getPw());
			stmt.setString(3, vo.getUname());
			stmt.setString(4, vo.getEmail());
			stmt.setString(5, vo.getQ());
			stmt.setString(6, vo.getA());
			stmt.setString(7, vo.getAdd1());
			stmt.setString(8, vo.getAdd2());
			stmt.setInt(8, vo.getCp());
			stmt.setInt(10, vo.getUsertbid());
			r = stmt.executeUpdate();
		} catch(ClassNotFoundException e) {
			System.out.println("드라이버 연결 실패");
			e.printStackTrace();
		} catch(SQLException e) {
			System.out.println("SQL구문 오류");
			e.printStackTrace();
		} catch(Exception e) {
			System.out.println("기타 오류");
		} finally {
			DBConn.close(stmt, conn);
		}
		return r;
	}
	
	public UsertbVO loginUsertb(UsertbVO vo) {
		UsertbVO tm = null;
		//ctrl에서 값을 준다
		try {
			conn = DBConn.getConnection();
			String sql = "select * from Usertb where mid =? and pw =?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,  vo.getU_id());
			stmt.setString(2, vo.getPw());
			rs = stmt.executeQuery();
			tm = new UsertbVO();
			if (rs.next()) {
				
				System.out.println("rs통과");
				
				tm.setUsertbid(rs.getInt("usertbid"));
				tm.setU_id(rs.getString("u_id"));
				tm.setPw(rs.getString("pw"));
				tm.setUname(rs.getString("uname"));
				tm.setEmail(rs.getString("email"));
				tm.setQ(rs.getString("q"));
				tm.setA(rs.getString("a"));
				tm.setAdd1(rs.getString("add1"));
				tm.setAdd2(rs.getString("add2"));
				tm.setRegdate(rs.getDate("regdate"));
				tm.setCp(rs.getInt("cp"));
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
