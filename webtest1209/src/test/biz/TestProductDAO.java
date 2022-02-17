package test.biz;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import test.model.DBConn;
import test.model.TestProductVO;

public class TestProductDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	public ArrayList<TestProductVO> getTestProductList() {
		ArrayList<TestProductVO> testProductList = null;
		try {
			conn = DBConn.getConnection();
			String sql = "select idx, pcode, pname, price, standard, description from TestProduct order by idx";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			testProductList = new ArrayList<TestProductVO>();
			while(rs.next()) {
		
				int idx = rs.getInt("idx");
				String pcode = rs.getString("pcode");
				String pname = rs.getString("pname");
				int price = rs.getInt("price");
				String standard = rs.getString("standard");
				String description = rs.getString("description");
	
				TestProductVO testProduct = new TestProductVO();
				testProduct.setIdx(idx);
				testProduct.setPcode(pcode);
				testProduct.setPname(pname);
				testProduct.setPrice(price);
				testProduct.setStandard(standard);
				testProduct.setDescription(description);		
				testProductList.add(testProduct);
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
		
		return testProductList;
	}
	
	
	public int deleteTestProduct(TestProductVO vo) {
		int r = 0;
		try {
			conn = DBConn.getConnection();
			String sql = "delete from TestProduct where idx=?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, vo.getIdx());
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

	public int insertTestProduct(TestProductVO vo) {
		int r=0;
		try {
			conn = DBConn.getConnection();
			String sql = "insert into TestProduct values(tb_seq.nextval, ?, ?, ?, ?, ?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getPcode());
			stmt.setString(2, vo.getPname());
			stmt.setInt(3, vo.getPrice());
			stmt.setString(4, vo.getStandard());
			stmt.setString(5, vo.getDescription());
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
}
