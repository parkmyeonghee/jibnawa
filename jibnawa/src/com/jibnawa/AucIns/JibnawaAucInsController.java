package com.jibnawa.AucIns;

import java.io.IOException;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.util.HangulConversion;
import com.vo.JibnawaMemberVO;


@Controller 
@RequestMapping(value="/jibnawa")
public class JibnawaAucInsController {
	Logger logger = Logger.getLogger(JibnawaAucInsController.class);

	@Autowired
	public JibnawaAucInsLogic jibnawaAucInsLogic = null;

	@RequestMapping(value="jibnawaInsert.kosmo")
	public String jibnawaInsert(@RequestParam Map<String,Object> pMap,HttpSession session){
		

		
		
		
		
		pMap.put("mem_num", "9999");
		pMap.put("mem_name", "Guest");
		
		
		logger.info("jibnawaInsert 호출 성공");
		//pMap.put("Auc_comm_bigo",(HangulConversion.toKor(pMap.get("Auc_comm_bigo").toString())));
		int result = 0; 
		logger.info(pMap.get("region_code")); //region_code 담겨야되는데 main_area_name담겨있음
		logger.info(pMap.get("sub_area_name"));//region_code 여기 담김
	/*	logger.info(pMap.put("region_code", pMap.get("sub_area_name")));*/
		logger.info(pMap.get("main_area_name"));
		logger.info(pMap.get("check_in_date"));
		logger.info(pMap.get("check_out_date"));
		logger.info(pMap.get("bid_cost"));
		logger.info(pMap.get("auc_comm_bigo"));
		logger.info(pMap.get("auc_start_date"));
		logger.info(pMap.get("auc_end_date"));
		result = jibnawaAucInsLogic.jibnawaInsert(pMap);
		logger.info("result :"+result);
		return "redirect:./index.jsp";//리턴값에 응답페이지가 오면됨 (String으로)
	}
	
	@RequestMapping(value="getRegioncodeList.kosmo")
	public String getRegioncodeList(ModelMap rMap, @ModelAttribute JibnawaAucSelVO pVO){
		logger.info("getRegioncodeList 호출 성공");
		List<HashMap> RegioncodeList = null;
		
		logger.info(pVO.getRegion_code());
		logger.info(pVO.getMain_area_name());
		logger.info(pVO.getSub_area_name());
		
		RegioncodeList = jibnawaAucInsLogic.getRegioncodeList(pVO);
		rMap.addAttribute("RegioncodeList", RegioncodeList);
		logger.info("size:"+RegioncodeList.size());
		return "forward:./jSonRegioncodeList.jsp"; 
	} 
	
	@RequestMapping(value="getRegioncodeListSub.kosmo")  
	public String getRegioncodeListSub(ModelMap rMap, @ModelAttribute JibnawaAucSelVO pVO){
		logger.info("getRegioncodeListSub 호출 성공2");
		List<HashMap> RegioncodeListSub = null;
		
		logger.info(pVO.getRegion_code());
		logger.info(pVO.getMain_area_name());
		logger.info(pVO.getSub_area_name());
		
		RegioncodeListSub = jibnawaAucInsLogic.getRegioncodeListSub(pVO);
		rMap.addAttribute("RegioncodeListSub", RegioncodeListSub);
		logger.info("size:"+RegioncodeListSub.size());
		return "forward:./jSonRegioncodeListSub.jsp"; 
	}
}
