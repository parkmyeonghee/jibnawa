package com.jibnawa.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;


public class JibnawaMemberDao {
	Logger logger = Logger.getLogger(JibnawaMemberDao.class);
	public SqlSessionTemplate sqlSessionTemplate = null;
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	public List<HashMap> jibnawaMember() {
		logger.info("jibnawaMember 호출 성공");
		List<HashMap> jibnawaMember = null;
		jibnawaMember
				=sqlSessionTemplate.selectList("jibnawaMember");
		logger.info("jibnawaMember 호출 성공");
		return jibnawaMember;
	}
	public int memDelete(Map<String, Object> pMap) {
		logger.info("deptDelete호출 성공");
		JibnawaMemberVO jVO = new JibnawaMemberVO();
		String mem_email = pMap.get("mem_email").toString();
		int deptno = 0;
		//if(sdeptno !=null) deptno = Integer.parseInt(sdeptno);
		jVO.setMem_email(mem_email);
		int result = 0;
		result = sqlSessionTemplate.delete("memDelete",jVO);
		logger.info("result : "+result);
		return result;
	}
}
