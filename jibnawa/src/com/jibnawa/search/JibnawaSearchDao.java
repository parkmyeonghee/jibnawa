package com.jibnawa.search;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class JibnawaSearchDao {
	Logger logger = Logger.getLogger(JibnawaSearchVO.class);
	public SqlSessionTemplate sqlSessionTemplate = null;
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}//세터를 만들어주자

	public List<HashMap<String, Object>> jibnawaSearch(Map<String, Object> pMap) {
		logger.info("jbDAO : jibnawaSearch");
		List<HashMap<String, Object>> mainLocal = null;
		
		if(pMap.get("main_area_name")==null){
		logger.info("pMap LOCATION:"+pMap.get("LOCATION"));
		  mainLocal = sqlSessionTemplate.selectList("jibnawaSearch", pMap);
		}else{
		logger.info("pMap LOCATION:"+pMap.get("main_area_name"));
				//pMap.get("LOCATION").toString();
		String sub_area_name = pMap.get("main_area_name").toString();
		 mainLocal = sqlSessionTemplate.selectList("jibnawaSearch2", sub_area_name);
		}
		return mainLocal;
	}

	public int jibnawaSearchInsert(Map<String, Object> pMap) {
		logger.info("dao : jibnawaSearchInsert");
		logger.info(pMap.get("rent_code"));
		int result = 0;
		result = sqlSessionTemplate.insert("ins", pMap);
		return result;
	}

}
