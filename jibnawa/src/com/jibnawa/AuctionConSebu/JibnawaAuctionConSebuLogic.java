package com.jibnawa.AuctionConSebu;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class JibnawaAuctionConSebuLogic {
	Logger logger = Logger.getLogger(JibnawaAuctionConSebuLogic.class);
@Autowired
	public JibnawaAuctionConSebuDao jibnawaAuctionConSebuDao = null;

/*	public List<Map<String, Object>> getauctionSebuList(jibnawaAuctionSebuVO sVO) {
		logger.info("getauctionSebuList 호출성공");
		List<Map<String,Object>> auctionSebuList=null;
		auctionSebuList = jibnawaAuctionConSebuDao.getauctionSebuList(sVO);
		return auctionSebuList;
	}*/

	public List<Map<String, Object>> getauctionSebuList(Map<String, Object> pMap) {
		logger.info("getauctionSebuList 호출성공");
		List<Map<String, Object>> auctionSebuList = null;
		auctionSebuList = jibnawaAuctionConSebuDao.getauctionSebuList(pMap);
		return auctionSebuList;
	}

	public List<Map<String, Object>> getauctionList(Map<String, Object> pMap) {
		logger.info("getauctionList 호출성공");
		List<Map<String, Object>> auctionList = null;
		auctionList = jibnawaAuctionConSebuDao.getBidderList(pMap);
		return auctionList;
	}

	public int auctionconUpdate(Map<String, Object> pMap) {
		logger.info("auctionconUpdate호출 성공");
		int result = 0;
		result = jibnawaAuctionConSebuDao.auctionconUpdate(pMap);
		return result;
	}


}