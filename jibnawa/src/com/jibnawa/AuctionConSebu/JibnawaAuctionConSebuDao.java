package com.jibnawa.AuctionConSebu;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;


public class JibnawaAuctionConSebuDao {
	Logger logger = Logger.getLogger(JibnawaAuctionConSebuDao.class);
	public SqlSessionTemplate sqlSessionTemplate = null;
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
/*	public List<Map<String, Object>> getauctionSebuList(jibnawaAuctionSebuVO sVO) {
		logger.info("JibnawaAuctionConSebuDao: getauctionSebuList 호출 성공");
		List<Map<String,Object>> auctionSebuList=null;
		auctionSebuList = sqlSessionTemplate.selectList("auctionSebuList",sVO);
		return auctionSebuList;
	}*/

	public List<Map<String, Object>> getauctionSebuList(Map<String, Object> pMap) {
		logger.info("JibnawaAuctionConSebuDao: getauctionSebuList 호출 성공");
		List<Map<String, Object>> auctionSebuList = null;
		/* biddermap = sqlSessionTemplate.selectOne("get_acc_code",biddermap);*/
		auctionSebuList = sqlSessionTemplate.selectList("auctionSebuList",pMap);
		logger.info(pMap.get("auc_start_date"));
		pMap.get("mem_num");
		pMap.get("auc_start_date");
		pMap.get("bid_cost");
		pMap.get("main_area_name");
		pMap.get("sub_area_name");
		pMap.get("auc_bigo");
		pMap.get("auc_state");
		return auctionSebuList;
	}

	public List<Map<String, Object>> getBidderList(Map<String, Object> pMap) {
		logger.info("JibnawaAuctionConDao: getauctionList 호출 성공");
		List<Map<String, Object>> auctionList = null;
		auctionList = sqlSessionTemplate.selectList("getBidderList",pMap);
		return auctionList;
	}

	public int auctionconUpdate(Map<String, Object> pMap) {
		logger.info("auctionconUpdate호출 성공");
		int result = 0;
	/*	pMap.put(key, value);
		pMap.put(key, value);*/
		result = sqlSessionTemplate.update("aucUpd",pMap);
		return result;
	}

}
