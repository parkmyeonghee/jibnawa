package com.jibnawa.rauction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.vo.JibnawaMemberVO;

public class CommInterceptor extends HandlerInterceptorAdapter {
	
	public boolean preHandle(HttpServletRequest request, 
		     HttpServletResponse response, Object handler) throws Exception{
		
		  /** Session 회원정보여부 체크 */
			
			JibnawaMemberVO jvo = (JibnawaMemberVO) request.getSession().getAttribute("login");
		  if (jvo == null){
		    String url = "redirect:./needlogin.jsp";
		    throw new ModelAndViewDefiningException(new ModelAndView(url));
		  }
		  return super.preHandle(request, response, handler);
		}
		 
		public void postHandle(HttpServletRequest httpservletrequest, 
		        HttpServletResponse httpservletresponse, 
		        Object obj, ModelAndView modelandview)throws Exception{
		  /** request 로 넘어온 데이타를 가공할때 쓰는 곳이다 */
		 
		}
		 
		public void afterCompletion(HttpServletRequest httpservletrequest, 
		       HttpServletResponse httpservletresponse, Object obj, 
		       Exception exception)throws Exception{
		  /** 공통 Exception 처리를 해주는것이 좋다. 에러 메일을 보내는것등 */
		 
		}

}
