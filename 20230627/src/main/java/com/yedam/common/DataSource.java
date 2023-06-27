package com.yedam.common;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DataSource {
	//SqlSessionFactory 객체 반환
	private static SqlSessionFactory instance;
	private DataSource() {
		
	}
	public static SqlSessionFactory getInstance() {
		String resource = "config/mybatis-config.xml";//xml은 마크업랭귀지, 중요함
		InputStream inputStream = null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			e.printStackTrace();
		}
		instance = new SqlSessionFactoryBuilder().build(inputStream);
		return instance;
	}
}
