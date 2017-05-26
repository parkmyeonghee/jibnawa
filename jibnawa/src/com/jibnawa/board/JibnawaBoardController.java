package com.jibnawa.board;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.util.HangulConversion;
import com.vo.jibnawaBoardVO;

@Controller
@RequestMapping(value="/jibnawa")
public class JibnawaBoardController {
	Logger logger= Logger.getLogger( JibnawaBoardController.class);
	
	@Autowired
	public JibnawaBoardLogic  jibnawaBoardLogic=null;
	
	@RequestMapping(value="write.kosmo")
	public String writeForm(){
		
		return "redirect:write.jsp";
	}
	@RequestMapping(value="boardInsert.kosmo")
	public String boardInsert(@ModelAttribute jibnawaBoardVO jbVO){
		
		
		jbVO.setAc_title(HangulConversion.toKor(jbVO.getAc_title()));
		jbVO.setAc_name(HangulConversion.toKor(jbVO.getAc_name()));
		jbVO.setAc_content(HangulConversion.toKor(jbVO.getAc_content()));
		logger.info("11");
		logger.info(jbVO.getAc_title());
		logger.info(jbVO.getAc_date());
		logger.info(jbVO.getAc_email());
		logger.info(jbVO.getAc_pw());
		logger.info(jbVO.getAu_hit());
		logger.info(jbVO.getAc_name());
		int result = 0;
		result= jibnawaBoardLogic.boardInsert(jbVO);
		return "redirect:QandA.jsp";
	}
	@RequestMapping(value="getBoardList.kosmo")
	public String getBoardList(ModelMap mMap,@ModelAttribute jibnawaBoardVO jbVO){
		logger.info("글조회 구현 타냐?");
		List<Map<String,Object>> boardList = null;
		//insert here -화면에 조회결과를 출력하고 싶어요
		logger.info(jbVO.getAc_no());
		jbVO.setAc_title(HangulConversion.toKor(jbVO.getAc_title()));
		jbVO.setAc_name(HangulConversion.toKor(jbVO.getAc_name()));
		jbVO.setAc_content(HangulConversion.toKor(jbVO.getAc_content()));
		boardList = jibnawaBoardLogic.getBoardList(jbVO);
		mMap.addAttribute("boardList",boardList);
		
		if(boardList.size()==1){
			return "forward:./read.jsp";
		}
		
		return "forward:./jsonQandA.jsp";
	}
	@RequestMapping(value="boardDelete.kosmo")
	public String boardDelete(@ModelAttribute jibnawaBoardVO jbVO){
		int result  = 0;
		result = jibnawaBoardLogic.boardDelete(jbVO);
		return "redirect:getBoardList.kosmo";
	}
	
}
