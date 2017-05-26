package com.jibnawa.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class JibnawaMemberLogic {
	Logger logger = Logger.getLogger(JibnawaMemberLogic.class);
	//public SqlMapDeptDao sqlMapDeptDao=null;
	@Autowired
	public JibnawaMemberDao jibnawaMemberDao=null;
	
	public void setJibnawaMemberDao(JibnawaMemberDao jibnawaMemberDao) {
		this.jibnawaMemberDao = jibnawaMemberDao;
	}
	public List<HashMap> jibnawaMemberLogic() {	
		List<HashMap> jibnawaMember = null;
		logger.info("jibnawaMemberListȣ�� ����");
		jibnawaMember = jibnawaMemberDao.jibnawaMember();
		return jibnawaMember;
	}
	public int memDelete(Map<String, Object> pMap) {
		logger.info("deptDeleteȣ�� ����");
		int result = 0;
		result = jibnawaMemberDao.memDelete(pMap);
		return result;
	}
}