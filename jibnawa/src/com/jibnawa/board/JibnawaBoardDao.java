package com.jibnawa.board;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

import com.vo.jibnawaBoardVO;

public class JibnawaBoardDao {
	Logger logger=Logger.getLogger(JibnawaBoardDao.class);
	public SqlSessionTemplate sqlSessionTemplate = null;
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	public int aStepUpdate(jibnawaBoardVO jbVO) {
		int result =0;
		result=sqlSessionTemplate.update("aStepUpdate", jbVO);
		return result;
	}
	public int boardInsert(jibnawaBoardVO jbVO) {
		logger.info("jbDao insert성공");
		int result=0;
		result=sqlSessionTemplate.insert("boardInsert",jbVO);
		return result;
	}
	public List<Map<String, Object>> getBoardList(jibnawaBoardVO jbVO) {
		logger.info("jbDao 뿌리기성공");
		List<Map<String, Object>> boardList = null;
		boardList=sqlSessionTemplate.selectList("getBoardList",jbVO);
		return boardList;
	}
	public int boardDelete(jibnawaBoardVO jbVO) {
		logger.info("jbDao 삭제성공");
		int result=0;
		result=sqlSessionTemplate.delete("boardDelete",jbVO);
		return result;
	}
}
