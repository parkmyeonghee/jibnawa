package com.jibnawa.AuctionConSebu;

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
public class JibnawaAuctionConSebuController {
		Logger logger = Logger.getLogger(JibnawaAuctionConSebuController.class);
		
		@Autowired                    
		public JibnawaAuctionConSebuLogic jibnawaAuctionConSebuLogic = null;
		
	/*	@RequestMapping(value="getauctionSebuList.kosmo")
		public String getauctionSebuList(ModelMap pMap,@ModelAttribute jibnawaAuctionSebuVO sVO){   
			logger.info("JibnawaAuctionConSebuController:getauctionSebuList 호출 성공");
			List<Map<String,Object>> auctionSebuList = jibnawaAuctionConSebuLogic.getauctionSebuList(sVO);
			pMap.addAttribute("auctionSebuList",auctionSebuList);
			return "forward:./jSonauctionSebuList.jsp";//응답페이지
		}*/
		
		@RequestMapping(value="getauctionSebuList.kosmo")
		public String getauctionSebuList(ModelMap rMap, @RequestParam Map<String,Object> pMap,HttpSession session){
			logger.info("JibnawaAuctionConSebuController:getauctionSebuList 호출 성공");
			List<Map<String,Object>> auctionSebuList = null;
			
			JibnawaMemberVO jvo = new JibnawaMemberVO();
			
			jvo = (JibnawaMemberVO) session.getAttribute("login");
			
						
			
			pMap.put("mem_num", jvo.getMem_num());
			auctionSebuList = jibnawaAuctionConSebuLogic.getauctionSebuList(pMap);
			rMap.put("auctionSebuList",auctionSebuList);
			return "forward:./jSonauctionSebuList.jsp";//응답페이지
			
		}	
		
		@RequestMapping(value="getBidderList.kosmo")
		public String getauctionList(ModelMap rMap, @RequestParam Map<String,Object> pMap){
			logger.info("JibnawaAuctionConController:getauctionList 호출 성공");
			List<Map<String,Object>> auctionList = null;
			auctionList = jibnawaAuctionConSebuLogic.getauctionList(pMap);
			rMap.put("auctionSebuList",auctionList);
			return "forward:./jSonauctionSebuList.jsp";//응답페이지
		}
		
	/*	@RequestMapping(value="auctionconUpdate.kosmo")
		public String auctionconUpdate(@ModelAttribute jibnawaAuctionVO aVO){
		//	logger.info("a_no"+aVO.getA_no());
		//	logger.info("a_region"+aVO.getA_region());  ///바꾸자
			int result=0;
			result = jibnawaAuctionConLogic.auctionconUpdate(aVO);
			return "forward:getAuctionList.jsp";
		}*/
		
		@RequestMapping(value="aucUpdate.kosmo")
		public String auctionconUpdate(ModelMap rMap, @RequestParam Map<String,Object> pMap){
			logger.info("JibnawaAuctionConController:auctionconUpdate 호출 성공");
			logger.info(pMap.get("auc_success_cost"));
			logger.info(pMap.get("auc_comm_id"));
			logger.info(pMap.get("AUC_SUCCESS_COST"));
			logger.info(pMap.get("AUC_COMM_ID"));
			logger.info(pMap.get("ACC_CODE"));
			int result = 0;
			result = jibnawaAuctionConSebuLogic.auctionconUpdate(pMap);
			logger.info("result:"+result);
			return "forward:./index.jsp";//응답페이지
			
			
		}	
		
}
