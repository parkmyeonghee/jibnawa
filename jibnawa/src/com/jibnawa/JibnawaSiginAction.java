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
import com.util.HangulConversion;
import com.jibnawa.JibnawaDao;
import com.vo.JibnawaMemberVO;

public class JibnawaSiginAction implements Action {
	Logger logger = Logger.getLogger(JibnawaSiginAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//HttpSession session = req.getSession();
		//session.setAttribute("sname", name);
		JibnawaDao jDao = new JibnawaDao();
		JibnawaMemberVO jvo = new JibnawaMemberVO();
		jvo.setMem_email(req.getParameter("mem_email"));
		jvo.setMem_pw(req.getParameter("mem_pw"));
		jvo.setMem_name(HangulConversion.toKor(req.getParameter("mem_name")));
		jvo.setMem_nickname(HangulConversion.toKor(req.getParameter("mem_nickname")));
		jvo.setMem_div(req.getParameter("mem_div"));
		//jvo.setMem_div(HangulConversion.toKor(req.getParameter("mem_div")));
		jvo.setMem_phone_f(req.getParameter("mem_phone_f"));
		jvo.setMem_phone_m(req.getParameter("mem_phone_m"));
		jvo.setMem_phone_e(req.getParameter("mem_phone_e"));
		//name�� ��� �̸��� �ִٴ� ���� �α��ο� �����ߴٴ� �ǹ��Դϴ�.
		if(req.getParameter("mem_pw")==null||req.getParameter("mem_pw")==""){
			int resunt = jDao.mailChk(jvo);
			String mailChk=null;
			if(resunt==0){
				mailChk="true";
			}else{
				mailChk="false";
			}
			Cookie cookie1 =   
					new Cookie("cname"
							  ,URLEncoder.encode(req.getParameter("mem_email"),"utf-8"));
			Cookie cookie2 =   
					new Cookie("mailChk"
							  ,URLEncoder.encode(mailChk,"utf-8"));
			cookie1.setMaxAge(60*30);//��Ű �����ð� 30������ ����
			cookie1.setPath("/");
			res.addCookie(cookie1);
			res.addCookie(cookie2);
		}else{
			int resunt = jDao.sigin(jvo);
			String sigin=null;
			if(resunt==1){
				sigin="true";
			}else{
				sigin="false";
			}
			Cookie cookie =   
					new Cookie("sigin"
							  ,URLEncoder.encode(sigin,"utf-8"));
			cookie.setPath("/");
			res.addCookie(cookie);
			cookie.setMaxAge(60*30);//��Ű �����ð� 30������ ����
		}
		

		//������ ��Ű�� ��Ҵ� ������ ���ǰ�ü�� ���
		//��Ű�� ����� ���丮 ��θ� ����
		//setPath()����Ͽ� ��Ű�� ��θ� �����ϸ� ��������
		//������ ��� �Ǵ� ���� ��ο� ���ؼ��� ��Ű�� �����Ѵ�.
		//�Ʒ����� ������ �Ʒ� member�� �����Ͽ����Ƿ�
		//�������� cname��Ű�� /member�� �� ���� ��ο��� ����
		//�� �� �ִ�.
		ActionForward forward = new ActionForward();
		forward.setPath("./sigin.jsp");//index.jsp�������� ���ΰ�ħ �Ͼ��.
		//ajax ����� ������ �� -> �κ�������(logout.jsp) �̸��� �ۼ��մϴ�.
		forward.setRedirect(true);
		logger.info(forward.getPath());//null, "./index.jsp"
		return forward;
	}

}
