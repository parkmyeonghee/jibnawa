package com.jibnawa.search;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.vo.JibnawaMemberVO;


@Controller
@RequestMapping(value="/jibnawa")//업무에 대한 폴더이름
public class JibnawaSearchController {
	Logger logger = Logger.getLogger(JibnawaSearchController.class);
	//<bean id="deptLogic" class="com.mvc.DeptLogic"/>

	@Autowired
	public JibnawaSearchLogic jibnawaSearchLogic = null;

	@RequestMapping(value="jibnawaSearch.kosmo")
	public String jibnawaSearch(ModelMap rMap,@RequestParam Map<String,Object> pMap){   
		
		/*pMap.put("loc", rec);
		bookVO.setLoc(rec);//modelattribute*/	
		logger.info("jibnawaSearch 호출 성공");
		logger.info(pMap.get("sub_area_name"));
		List<HashMap<String,Object>> mainLocal = null;
		mainLocal = jibnawaSearchLogic.jibnawaSearch(pMap);
		rMap.addAttribute("mainLocal", mainLocal);
		return "forward:./jibnawaMainLocal.jsp";//응답페이지
	}
	@RequestMapping(value="jibnawaSearchInsert.kosmo")
	public String jibnawaSearchInsert(@RequestParam Map<String,Object> pMap, HttpSession session){   
		
		/*pMap.put("loc", rec);
		bookVO.setLoc(rec);//modelattribute*/	
		
		JibnawaMemberVO jvo = new JibnawaMemberVO();
		
		jvo = (JibnawaMemberVO) session.getAttribute("login");
		 
		
		logger.info(jvo.getMem_name());
		
		pMap.put("mem_num", jvo.getMem_num());
		
		logger.info("jibnawaSearchInsert 호출 성공");
		logger.info("auc_bigo:"+pMap.get("auc_bigo"));
		logger.info("bid_cost:"+pMap.get("bid_cost"));
		logger.info("mem_num:"+pMap.get("mem_num"));
		logger.info("MAIN_AREA_NAME:"+pMap.get("MAIN_AREA_NAME"));
		
		logger.info("region_code:"+pMap.get("region_code"));
		logger.info("auc_comm_bigo:"+pMap.get("auc_comm_bigo"));
		logger.info("check_in_date:"+pMap.get("check_in_date"));
		logger.info("check_out_date:"+pMap.get("check_out_date"));
		
		int result=0;
		result = jibnawaSearchLogic.jibnawaSearchInsert(pMap);
		return "redirect:./index.jsp";//응답페이지
	}
}
