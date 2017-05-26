package com.jibnawa.rauction;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

import com.vo.JibnawaMemberVO;

public class JibnawaRauctionDao {
	Logger logger = Logger.getLogger(JibnawaRauctionDao.class);
	public SqlSessionTemplate sqlSessionTemplate = null;
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public List<Map<String, Object>> jibnawaRauctionList(Map<String, Object> paMap) {
		
		logger.info("jibnawaRauction 호출 성공");
		List<Map<String,Object>> jibnawaRauctionList = null;
		jibnawaRauctionList
				=sqlSessionTemplate.selectList("jibnawaRauctionList",paMap);
	
		
		
		return jibnawaRauctionList;
		
	}

	

	public int bidderInsert(Map<String, Object> paMap, JibnawaMemberVO jvo) {

		
		
		logger.info("bidaction 호출 성공");
		
		
		
		Map<String, Object> biddermap = new HashMap<String, Object>();
		
		/* biddermap.put("MEM_NUM", jvo.getMem_num());
		
		biddermap = sqlSessionTemplate.selectOne("get_acc_code",biddermap); */


		biddermap.put("MEM_NUM", jvo.getMem_num());
		biddermap.put("BID_NAME", jvo.getMem_name());
		biddermap.put("BID_EMAIL", jvo.getMem_email());
		biddermap.put("BID_PHONE_F", jvo.getMem_phone_f());
		biddermap.put("BID_PHONE_M", jvo.getMem_phone_m());
		biddermap.put("BID_PHONE_E", jvo.getMem_phone_e());
		biddermap.put("BID_LEV", "1");
		
		biddermap.put("REGION_CODE", "11010");
		biddermap.put("BID_ADDR", "월드메르디앙 2차 410호");
		biddermap.put("ACC_CAR","N");  
		

		
		Iterator<String> ir2 = biddermap.keySet().iterator();
		
		while(ir2.hasNext()){
			
			String key=ir2.next();
			
			logger.info(key+" : "+biddermap.get(key));
			
		}
		
		
		
		
		int result = sqlSessionTemplate.insert("bidder_add",biddermap);
		
		return result;
		
	}

	public int ingInsert(Map<String, Object> paMap, JibnawaMemberVO jvo) {
		
		
		
		paMap.put("A_STAY", "Y");
		
		paMap.put("A_REGION", "11010");
		
		Iterator<String> ir = paMap.keySet().iterator();
		
		while(ir.hasNext()){
			
			String key=ir.next();
			
			logger.info(key+" : "+paMap.get(key));
			
		}
		
		
		
		int result	=sqlSessionTemplate.insert("bidaction",paMap);
	
		
		return result;
		
		
		
		
		
	}

	public List<Map<String, Object>> RauctionView(Map<String, Object> paMap) {
		
		
		
		logger.info("RauctionView 호출 성공");
		List<Map<String,Object>> jibnawaRauctionList = null;
		jibnawaRauctionList
				=sqlSessionTemplate.selectList("RauctionView",paMap);
	
		paMap = jibnawaRauctionList.get(0);
		
Iterator<String> ir = paMap.keySet().iterator();
		
		while(ir.hasNext()){
			
			String key=ir.next();
			
			logger.info(key+" : "+paMap.get(key));
			
		}
		
		
		
		return jibnawaRauctionList;
		
		
		
		
		
		
		
		
		
	}

	public List<Map<String, Object>> jibnawaIngList(Map<String, Object> paMap) {
		
		logger.info("jibnawaRauction 호출 성공");
		List<Map<String,Object>> jibnawaRauctionList = null;
		jibnawaRauctionList
				=sqlSessionTemplate.selectList("jibnawaIngList",paMap);
	
		
		
		return jibnawaRauctionList;
		
		
		
		
		
	}

	public List<Map<String, Object>> jibnawaSucessList(Map<String, Object> paMap) {


		logger.info("jibnawaRauction 호출 성공");
		List<Map<String,Object>> jibnawaRauctionList = null;
		jibnawaRauctionList
				=sqlSessionTemplate.selectList("jibnawaSucessList",paMap);
	
		
		
		return jibnawaRauctionList;
		
		
	}

	public int accInfoIns(Map<String, Object> pMap) {
		
		int result	=sqlSessionTemplate.insert("accInfoIns",pMap);
			
		return result;
		
	}

	public String accInfoIns2(Map<String, Object> pMap) {
		
		
		String result	= sqlSessionTemplate.selectOne("accInfoIns2",pMap);
		
		logger.info(result);
		
		return result;
		
		
		
	}
}
