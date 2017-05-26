package com.jibnawa.login;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

import com.vo.JibnawaMemberVO;

public class JibnawaLoginDao {
	Logger logger = Logger.getLogger(JibnawaLoginDao.class);
	public SqlSessionTemplate sqlSessionTemplate = null;
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	


	public JibnawaMemberVO login(JibnawaMemberVO jVO) {
		logger.info("login 호출 성공");
		
		jVO
				=sqlSessionTemplate.selectOne("login",jVO);
	
		
		
		return jVO;
	}
}
