package com.jibnawa;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.util.Action;
import com.util.ActionForward;

//����Ʈ ��Ʈ�ѷ� Ŭ������ ������������ ���� ��û�� ����մϴ�.
public class JibnawaFrontController extends HttpServlet {
	Logger logger = Logger.getLogger(JibnawaFrontController.class);

	public void doService(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String requestURI = req.getRequestURI();// -> /dev_jquery/test.do
		String contextPath = req.getContextPath();// -> /dev_jquery
		String command = requestURI.substring(contextPath.length());// ->
		ActionForward forward = new ActionForward();
		Action action = null;
		if ("/jibnawa/login/sigin.do".equals(command)) {
			action = new JibnawaSiginAction();
			forward = action.execute(req, res);
		} else if ("/jibnawa/login/login.do".equals(command)) {
			action = new JibnawaLoginAction();
			forward = action.execute(req, res);
		}
		if (forward.isRedirect()) {
			res.sendRedirect(forward.getPath());
		} else {
			RequestDispatcher view = req.getRequestDispatcher(forward.getPath());
			view.forward(req, res);
		}
	}

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doService(req, res);
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doService(req, res);
	}
}
