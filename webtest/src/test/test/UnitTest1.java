package test.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import test.biz.TestProductDAO;
import test.model.DBConn;
import test.model.TestProductVO;

public class UnitTest1 {
	private static TestProductDAO dao;
	private static TestProductVO vo;
	private Connection con =null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {		//1
		dao = new TestProductDAO();
		System.out.println("DAO 생성 성공");
	}

	@Before
	public void setUp() throws Exception {	//2
		vo = new TestProductVO();
		System.out.println("VO 생성 성공");
	}

	@After
	public void tearDown() throws Exception {	//5
		
		DBConn.close(rs, stmt, con);
		System.out.println("DB 닫기 성공");
	}

	@Test
	public void test1() {			//3 - voTest
		
		String title = "VO에 대한 JUnit Test";
		vo.setPname(title);
		System.out.println(vo.getPname());
		System.out.println("VO TEST 성공");
	}
	
	@Test
	public void test2() {		//4
		ArrayList<TestProductVO> TestProductList = dao.getTestProductList();		//Ctrl
		for(int i=0;i<TestProductList.size();i++) {		//jsp 파일
			vo = TestProductList.get(i);
			System.out.println(vo.getPname());
		}	
	}
}
