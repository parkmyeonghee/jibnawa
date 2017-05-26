package com.jibnawa.login;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vo.JibnawaMemberVO;
@Service
public class JibnawaLoginLogic {
	Logger logger = Logger.getLogger(JibnawaLoginLogic.class);
	//public SqlMapDeptDao sqlMapDeptDao=null;
	@Autowired
	public JibnawaLoginDao jibnawaLoginDao=null;
	
	public void setSqlMapJibnawaDao(JibnawaLoginDao sqlMapJibnawaDao) {
		this.jibnawaLoginDao = sqlMapJibnawaDao;
	}
	
	



	public JibnawaMemberVO login(JibnawaMemberVO jVO) {

		logger.info("bidaction호출 성공");
		
		jVO = jibnawaLoginDao.login(jVO);
		
		return jVO;
		
		
		
	}

	
}