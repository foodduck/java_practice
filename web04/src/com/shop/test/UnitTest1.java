package com.shop.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.shop.biz.QnaDAO;
import com.shop.model.DBConn;
import com.shop.model.QnaVO;

class UnitTest1 {
	private static QnaDAO dao;
	private static QnaVO vo;
	private Connection conn=null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		dao = new QnaDAO();
		System.out.println("DAO 생성 성공");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
	}

	@BeforeEach
	void setUp() throws Exception {
		vo = new QnaVO();
		System.out.println("VO 생성 성공");
	}

	@AfterEach
	void tearDown() throws Exception {
		DBConn.close(rs, stmt, conn);
		System.out.println("DB닫기 성공");
	}

	@Test
	void test1() {
		String tit = "VO에 대한 JUnit Test";
		vo.setTit(tit);
		System.out.println(vo.getTit());
		System.out.println("VO TEST 성공");
	}
	
	void test2() {
		ArrayList<QnaVO> QnaList = dao.getQnaList();
		for(int i=0; i<QnaList.size();i++) {
			vo = QnaList.get(i);
			System.out.println(vo.getTit());
		}
	}
}
