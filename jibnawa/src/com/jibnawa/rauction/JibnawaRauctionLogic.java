package com.jibnawa.rauction;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.vo.JibnawaMemberVO;
@Service
public class JibnawaRauctionLogic   {
	Logger logger = Logger.getLogger(JibnawaRauctionLogic.class);
	//public SqlMapDeptDao sqlMapDeptDao=null;
	@Autowired
	public JibnawaRauctionDao jibnawaRauctionDao=null;
	
	public void setSqlMapJibnawaDao(JibnawaRauctionDao sqlMapJibnawaDao) {
		this.jibnawaRauctionDao = sqlMapJibnawaDao;
	}
	
	public List<Map<String, Object>> jibnawaRauctionList(Map<String, Object> paMap) {
		
		List<Map<String,Object>> jibnawaRauctionList = null;
		logger.info("JibnawaRauctionList호출 성공");
		jibnawaRauctionList = jibnawaRauctionDao.jibnawaRauctionList(paMap);
		
		return jibnawaRauctionList;
	}

	 @Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={DataAccessException.class})
	 @Pointcut(value="execution(* com.jibnawa.rauction.*Logic.*(..)") 
	public int[] bidaction(Map<String, Object> paMap, JibnawaMemberVO jvo) {
		 
		 

		 
		 
		 logger.info("bidaction호출 성공");

		 int bresult = 0;
	      int iresult = 0;
	      int results[] =  new int[2];
	      try{
	    	
	     
	    	  bresult = jibnawaRauctionDao.bidderInsert(paMap,jvo);
	    	  iresult = jibnawaRauctionDao.ingInsert(paMap,jvo);
	    	  
	    	  
	      } catch (DataAccessException de) {
	         //boardMasterInsert, boardSubInsert, bStepUpdate
	         //DataAccessException에 해당될 때 롤백처리하기위한 코드(관여한다)
	         throw de; //스프링컨테이너에게 예외던진다. 스프링프레임웍에서 감지
	      }
		
		
		
		return results;
	}

	public List<Map<String, Object>> RauctionView(Map<String, Object> paMap) {
		
		
		
		
		List<Map<String,Object>> jibnawaRauctionList = null;
		logger.info("RauctionView호출 성공");
		jibnawaRauctionList = jibnawaRauctionDao.RauctionView(paMap);
		
		return jibnawaRauctionList;
		
		
		
		
		
		
		
	}

	public List<Map<String, Object>> jibnawaIngList(Map<String, Object> paMap) {


		List<Map<String,Object>> jibnawaRauctionList = null;
		logger.info("jibnawaIngList호출 성공");
		jibnawaRauctionList = jibnawaRauctionDao.jibnawaIngList(paMap);
		
		return jibnawaRauctionList;
		
		
	}

	public List<Map<String, Object>> jibnawaSucessList(Map<String, Object> paMap) {


		List<Map<String,Object>> jibnawaRauctionList = null;
		logger.info("jibnawaSucessList호출 성공");
		jibnawaRauctionList = jibnawaRauctionDao.jibnawaSucessList(paMap);
		
		return jibnawaRauctionList;
		
		
		
	}

	public int accInfoIns(Map<String, Object> pMap) {
		logger.info("accInfoIns호출 성공");
		int result = 0;
		result = jibnawaRauctionDao.accInfoIns(pMap);
		return result;
	}

	public String accInfoIns2(Map<String, Object> pMap) {
		
		
		logger.info("accInfoIns2호출 성공");
		String result=null;
		result = jibnawaRauctionDao.accInfoIns2(pMap);
		return result;
		
		
		
		
	}

	
}