package test.test;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import test.model.DBConn;
public class DBTest1 {		
	private static Connection conn = null;
	private static PreparedStatement stmt = null;
	private static ResultSet rs = null;
	public static void main(String[] args) {
		try {
			conn = DBConn.getConnection();
			
			String sql = "select * from testboard";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				System.out.println("제목 : "+rs.getString("title"));
			}
			DBConn.close(rs, stmt, conn);
		} catch(Exception e ) {
			
			e.printStackTrace();
		}
	}
}