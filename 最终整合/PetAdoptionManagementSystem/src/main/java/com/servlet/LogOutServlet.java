package com.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//登出的servlet
    @WebServlet("/LogOutServlet")
public class LogOutServlet extends HttpServlet {

    	@Override
    	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    		doPost(req, resp);
    	}

    	@Override
    	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     //1、销毁session
        req.getSession().invalidate();


        //重定向到登录页面
        resp.sendRedirect(req.getContextPath()+"/login.jsp");




    }
}
