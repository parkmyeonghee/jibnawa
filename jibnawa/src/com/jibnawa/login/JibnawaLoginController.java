package com.jibnawa.login;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.vo.JibnawaMemberVO;

@Controller

@RequestMapping(value="/jibnawa")//업무에 대한 폴더이름
public class JibnawaLoginController {
	Logger logger = Logger.getLogger(JibnawaLoginController.class);
	

	
	@Autowired
	public JibnawaLoginLogic jibnawaLoginLogic = null;

	@RequestMapping(value="login.kosmo")
	public String login(@ModelAttribute JibnawaMemberVO jVO, ModelMap pMap, Model md){   
		logger.info("login 호출 성공");
		
		
		
		
			
		jVO = jibnawaLoginLogic.login(jVO);
		
		
		
		md.addAttribute("login", jVO);
		
		logger.info(jVO.getMem_name());
		
		
		return "redirect:../main/index.jsp";//응답페이지
	}
	
	
	
	
	
	
}
