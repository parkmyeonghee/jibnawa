package com.jibnawa.rauction;

import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.util.HangulConversion;
import com.vo.JibnawaMemberVO;

@Controller

@RequestMapping(value="/jibnawa")//업무에 대한 폴더이름
public class JibnawaRauctionController {
	Logger logger = Logger.getLogger(JibnawaRauctionController.class);
	

		
	@Autowired
	public JibnawaRauctionLogic jibnawaRauctionLogic = null;

	@RequestMapping(value="JibnawaRauctionList.kosmo")
	public String JibnawaRauction(@RequestParam Map<String,Object> paMap, ModelMap pMap, HttpSession session){   
		logger.info("JibnawaRauction 호출 성공");
		
		
		List<Map<String,Object>> jibnawaRauctionList = null;
		

		
		JibnawaMemberVO jvo = new JibnawaMemberVO();
		
		jvo = (JibnawaMemberVO) session.getAttribute("login");
		
		paMap.put("MEM_NUM", jvo.getMem_num());
		
			
		jibnawaRauctionList = jibnawaRauctionLogic.jibnawaRauctionList(paMap);
		
		pMap.addAttribute("jibnawaRauctionList",jibnawaRauctionList);
		
		return "forward:./jsonjibnawaRauction.jsp";//응답페이지
	}
	
	@RequestMapping(value="JibnawaSucessList.kosmo")
	public String jibnawaMember(@RequestParam Map<String,Object> paMap, ModelMap pMap, HttpSession session){   
		logger.info("JibnawaSucessList 호출 성공");
		
		
		List<Map<String,Object>> jibnawaRauctionList = null;
		

		
		JibnawaMemberVO jvo = new JibnawaMemberVO();
		
		jvo = (JibnawaMemberVO) session.getAttribute("login");
		
		paMap.put("MEM_NUM", jvo.getMem_num());
		
			
		jibnawaRauctionList = jibnawaRauctionLogic.jibnawaSucessList(paMap);
		
		pMap.addAttribute("jibnawaRauctionList",jibnawaRauctionList);
		
		return "forward:./jibnawaSucessList.jsp";//응답페이지
	}
	
	
	
	@RequestMapping(value="JibnawaIngList.kosmo")
	public String JibnawaIngList(@RequestParam Map<String,Object> paMap, ModelMap pMap, HttpSession session){   
		logger.info("JibnawaIngList 호출 성공");
		
		
		List<Map<String,Object>> jibnawaRauctionList = null;
		
		JibnawaMemberVO jvo = new JibnawaMemberVO();
		
		jvo = (JibnawaMemberVO) session.getAttribute("login");
		
		paMap.put("MEM_NUM", jvo.getMem_num());
			
		jibnawaRauctionList = jibnawaRauctionLogic.jibnawaIngList(paMap);
		
		pMap.addAttribute("jibnawaRauctionList",jibnawaRauctionList);
		
		return "forward:./jibnawaIngList.jsp";//응답페이지
	}
	
	
	
	@RequestMapping(value="RauctionView.kosmo")
	public String RauctionView(@RequestParam Map<String,Object> paMap, ModelMap pMap, HttpSession session){   
		logger.info("RauctionView 호출 성공");
		
		
		List<Map<String,Object>> jibnawaRauctionList = null;
		
		JibnawaMemberVO jvo = new JibnawaMemberVO();
		
		jvo = (JibnawaMemberVO) session.getAttribute("login");
		
		paMap.put("MEM_NUM", jvo.getMem_num());
		paMap.put("mem_num", jvo.getMem_num());
		
		String result = jibnawaRauctionLogic.accInfoIns2(paMap);
		
		logger.info(result);
			
		if(result.equals("N")){
			return "redirect:./accinfoN.jsp";
		}
		
		
		
		jibnawaRauctionList = jibnawaRauctionLogic.RauctionView(paMap);
		
		pMap.addAttribute("jibnawaRauctionList",jibnawaRauctionList);
		
		return "forward:./rauctionview.jsp";//응답페이지
	}
	
	@RequestMapping(value="bidaction.kosmo")
	public String bidaction(Model model, @RequestParam Map<String,Object> paMap, ModelMap pMap, HttpSession session){   
		
		
		
		logger.info("bidaction 호출 성공");
		
		
		
		JibnawaMemberVO jvo = new JibnawaMemberVO();
		
		jvo = (JibnawaMemberVO) session.getAttribute("login");
		
		
		
		logger.info(jvo.getMem_name());
		
		
		int[] result = jibnawaRauctionLogic.bidaction(paMap,jvo);
		
		/*jibnawaRauctionList = jibnawaRauctionLogic.jibnawaRauctionList(paMap);
		
		pMap.addAttribute("jibnawaRauctionList",jibnawaRauctionList);*/
		
		return "redirect:./JibnawaRauctionList.kosmo";//응답페이지
	}
	
	
	
	@RequestMapping(value="accInfoIns.kosmo")
	public String accInfoIns(@RequestParam Map<String,Object> pMap,HttpSession session){
		

		JibnawaMemberVO jvo = new JibnawaMemberVO();
		
		jvo = (JibnawaMemberVO) session.getAttribute("login");
		 
		
		logger.info(jvo.getMem_name());
		
		
		
		pMap.put("mem_num", jvo.getMem_num());
		
		String acc_name = HangulConversion.toKor((String) pMap.get("acc_name"));
		String addr = HangulConversion.toKor((String) pMap.get("addr"));
		
		pMap.put("acc_name", acc_name);
		pMap.put("addr", addr);

		
		Iterator<String> ir2 = pMap.keySet().iterator();
		
		while(ir2.hasNext()){
			
			String key=ir2.next();
			
			logger.info(key+" : "+pMap.get(key));
			
		}
		
		
		int result = jibnawaRauctionLogic.accInfoIns(pMap);
		
		
		
		
		return "forward:./index.jsp";//리턴값에 응답페이지가 오면됨 (String으로)
	}
	
	
	@RequestMapping(value="accInfoIns2.kosmo")
	public String accInfoIns2(@RequestParam Map<String,Object> pMap,HttpSession session){
		

		JibnawaMemberVO jvo = new JibnawaMemberVO();
		
		jvo = (JibnawaMemberVO) session.getAttribute("login");
		 
		
		logger.info(jvo.getMem_name());
		
		
		
		pMap.put("mem_num", jvo.getMem_num());
		
		

		
		Iterator<String> ir2 = pMap.keySet().iterator();
		
		while(ir2.hasNext()){
			
			String key=ir2.next();
			
			logger.info(key+" : "+pMap.get(key));
			
		}
		
		
		
		
		
		
		
		
		String result = jibnawaRauctionLogic.accInfoIns2(pMap);
		
		
		if(result.equals("Y")){
		
		return "redirect:./accinfoY.jsp";//리턴값에 응답페이지가 오면됨 (String으로)
		}
		
		else{
			return "forward:./accInfoIns.jsp";
		}
		
		
		
	}
	
	
	
	
	
	
	
	
	
}
