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

@RequestMapping(value="/jibnawa")//������ ���� �����̸�
public class JibnawaRauctionController {
	Logger logger = Logger.getLogger(JibnawaRauctionController.class);
	

		
	@Autowired
	public JibnawaRauctionLogic jibnawaRauctionLogic = null;

	@RequestMapping(value="JibnawaRauctionList.kosmo")
	public String JibnawaRauction(@RequestParam Map<String,Object> paMap, ModelMap pMap, HttpSession session){   
		logger.info("JibnawaRauction ȣ�� ����");
		
		
		List<Map<String,Object>> jibnawaRauctionList = null;
		

		
		JibnawaMemberVO jvo = new JibnawaMemberVO();
		
		jvo = (JibnawaMemberVO) session.getAttribute("login");
		
		paMap.put("MEM_NUM", jvo.getMem_num());
		
			
		jibnawaRauctionList = jibnawaRauctionLogic.jibnawaRauctionList(paMap);
		
		pMap.addAttribute("jibnawaRauctionList",jibnawaRauctionList);
		
		return "forward:./jsonjibnawaRauction.jsp";//����������
	}
	
	@RequestMapping(value="JibnawaSucessList.kosmo")
	public String jibnawaMember(@RequestParam Map<String,Object> paMap, ModelMap pMap, HttpSession session){   
		logger.info("JibnawaSucessList ȣ�� ����");
		
		
		List<Map<String,Object>> jibnawaRauctionList = null;
		

		
		JibnawaMemberVO jvo = new JibnawaMemberVO();
		
		jvo = (JibnawaMemberVO) session.getAttribute("login");
		
		paMap.put("MEM_NUM", jvo.getMem_num());
		
			
		jibnawaRauctionList = jibnawaRauctionLogic.jibnawaSucessList(paMap);
		
		pMap.addAttribute("jibnawaRauctionList",jibnawaRauctionList);
		
		return "forward:./jibnawaSucessList.jsp";//����������
	}
	
	
	
	@RequestMapping(value="JibnawaIngList.kosmo")
	public String JibnawaIngList(@RequestParam Map<String,Object> paMap, ModelMap pMap, HttpSession session){   
		logger.info("JibnawaIngList ȣ�� ����");
		
		
		List<Map<String,Object>> jibnawaRauctionList = null;
		
		JibnawaMemberVO jvo = new JibnawaMemberVO();
		
		jvo = (JibnawaMemberVO) session.getAttribute("login");
		
		paMap.put("MEM_NUM", jvo.getMem_num());
			
		jibnawaRauctionList = jibnawaRauctionLogic.jibnawaIngList(paMap);
		
		pMap.addAttribute("jibnawaRauctionList",jibnawaRauctionList);
		
		return "forward:./jibnawaIngList.jsp";//����������
	}
	
	
	
	@RequestMapping(value="RauctionView.kosmo")
	public String RauctionView(@RequestParam Map<String,Object> paMap, ModelMap pMap, HttpSession session){   
		logger.info("RauctionView ȣ�� ����");
		
		
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
		
		return "forward:./rauctionview.jsp";//����������
	}
	
	@RequestMapping(value="bidaction.kosmo")
	public String bidaction(Model model, @RequestParam Map<String,Object> paMap, ModelMap pMap, HttpSession session){   
		
		
		
		logger.info("bidaction ȣ�� ����");
		
		
		
		JibnawaMemberVO jvo = new JibnawaMemberVO();
		
		jvo = (JibnawaMemberVO) session.getAttribute("login");
		
		
		
		logger.info(jvo.getMem_name());
		
		
		int[] result = jibnawaRauctionLogic.bidaction(paMap,jvo);
		
		/*jibnawaRauctionList = jibnawaRauctionLogic.jibnawaRauctionList(paMap);
		
		pMap.addAttribute("jibnawaRauctionList",jibnawaRauctionList);*/
		
		return "redirect:./JibnawaRauctionList.kosmo";//����������
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
		
		
		
		
		return "forward:./index.jsp";//���ϰ��� ������������ ����� (String����)
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
		
		return "redirect:./accinfoY.jsp";//���ϰ��� ������������ ����� (String����)
		}
		
		else{
			return "forward:./accInfoIns.jsp";
		}
		
		
		
	}
	
	
	
	
	
	
	
	
	
}
