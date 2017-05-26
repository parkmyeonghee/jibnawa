package com.jibnawa.board;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vo.jibnawaBoardVO;

@Service
public class JibnawaBoardLogic {
	Logger logger = Logger.getLogger(JibnawaBoardLogic.class);
	@Autowired
	public JibnawaBoardDao jibnawaBoardDao =null;

	public int boardInsert(jibnawaBoardVO jbVO) {
		logger.info("jbLogic insert등록");
		int result=0;
		result =  jibnawaBoardDao.boardInsert(jbVO);
		return result;	
	}
	public List<Map<String, Object>> getBoardList(jibnawaBoardVO jbVO) {
		logger.info("jbLogic 결과내놔등록");
		List<Map<String,Object>> boardList = null;
		boardList = jibnawaBoardDao.getBoardList(jbVO);
		return boardList;
	}
	public int boardDelete(jibnawaBoardVO jbVO) {
		logger.info("jbLogic delete");
		int result=0;
		result=jibnawaBoardDao.boardDelete(jbVO);
		return result;
	}
	
}
