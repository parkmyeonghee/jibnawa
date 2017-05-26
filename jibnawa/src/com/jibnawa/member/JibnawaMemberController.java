package com.jibnawa.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jibnawa.member.JibnawaMemberLogic;

@Controller
@RequestMapping(value="/jibnawa/admin")//������ ���� �����̸�
//@RequestMapping(value="/jibnawa")//������ ���� �����̸�
public class JibnawaMemberController {
	Logger logger = Logger.getLogger(JibnawaMemberController.class);
	//<bean id="deptLogic" class="com.mvc.DeptLogic"/>

	@Autowired
	public JibnawaMemberLogic jibnawaMemberLogic = null;

	@RequestMapping(value="jibnawaMember.kosmo")
	public String jibnawaMember(ModelMap pMap){
		logger.info("jibnawaMember ȣ�� ����");
		List<HashMap> jibnawaMember = null;
		jibnawaMember = jibnawaMemberLogic.jibnawaMemberLogic();
		pMap.addAttribute("jibnawaMember",jibnawaMember);
		return "forward:./jibnawaMember.jsp";//����������
	}
	@RequestMapping(value="memDelete.kosmo")
	public String memDelete(@RequestParam Map<String,Object> pMap){
		logger.info("deptDelete ȣ�� ���� : "+pMap.get("mem_email"));
		int result = 0;
		result = jibnawaMemberLogic.memDelete(pMap);  
		//logger.info("result:"+result);
		return "redirect:./jibnawaMember.jsp";//����������
	}
}
