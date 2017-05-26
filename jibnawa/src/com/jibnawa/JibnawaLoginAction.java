package com.jibnawa;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.util.Action;
import com.util.ActionForward;
import com.vo.JibnawaMemberVO;

public class JibnawaLoginAction implements Action {
	Logger logger = Logger.getLogger(JibnawaLoginAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//HttpSession session = req.getSession();
		//session.setAttribute("sname", name);
		JibnawaDao jDao = new JibnawaDao();
		JibnawaMemberVO jvo = new JibnawaMemberVO();
		jvo.setMem_email(req.getParameter("mem_email"));
		jvo.setMem_pw(req.getParameter("mem_pw"));
		//name�� ��� �̸��� �ִٴ� ���� �α��ο� �����ߴٴ� �ǹ��Դϴ�.
		JibnawaMemberVO jVO = jDao.login(jvo);
			HttpSession session = req.getSession();
			
			
			
			session.setAttribute("login", jVO);	
	
			session.setMaxInactiveInterval(3600);
			//Cookie cookie1 =   
			//		new Cookie("logiID"
			//				  ,URLEncoder.encode(resunt,"utf-8"));
			//cookie1.setMaxAge(60*5);//��Ű �����ð� 30������ ����
			//cookie1.setPath("/");
			//res.addCookie(cookie1);
		//������ ��Ű�� ��Ҵ� ������ ���ǰ�ü�� ���
		//��Ű�� ����� ���丮 ��θ� ����
		//setPath()����Ͽ� ��Ű�� ��θ� �����ϸ� ��������
		//������ ��� �Ǵ� ���� ��ο� ���ؼ��� ��Ű�� �����Ѵ�.
		//�Ʒ����� ������ �Ʒ� member�� �����Ͽ����Ƿ�
		//�������� cname��Ű�� /member�� �� ���� ��ο��� ����
		//�� �� �ִ�.
		ActionForward forward = new ActionForward();
		forward.setPath("./login.jsp");//index.jsp�������� ���ΰ�ħ �Ͼ��.

		//ajax ����� ������ �� -> �κ�������(logout.jsp) �̸��� �ۼ��մϴ�.
		forward.setRedirect(true);
		logger.info(forward.getPath());//null, "./index.jsp"
		return forward;
	}

}
