package com.servlet;

import com.service.impl.AnimalServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


//删除果树
    @WebServlet("/DelectById")
public class DelectById extends HttpServlet {

    	@Override
    	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    		doPost(req, resp);
    	}

    	@Override
    	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //接收参数
        String id = req.getParameter("id");

        //转成int类型
        Integer id1 = Integer.valueOf(id);



        //调用
        AnimalServiceImpl fruiterService = new AnimalServiceImpl();
        fruiterService.delectById(id1);


        //跳转
        resp.sendRedirect(req.getContextPath()+"/QueryAnimalServlet");


    }
}
