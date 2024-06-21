package com.servlet;

import com.pojo.Animal;
import com.service.impl.AnimalServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

//查询果树信息

@WebServlet("/QueryAnimalServlet")
public class QueryAnimalServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //接收参数

        //调用service
        AnimalServiceImpl AnimalService = new AnimalServiceImpl();

        List<Animal> list = AnimalService.selectAllAnimal(null, null);



        //将信息放入 request域对象中

        /**
         * request
         * 一次请求
         * 请求发起，响应，结束
         */

        req.setAttribute("list",list);


        /**
         * 使用转发到show，因为用来request存储了业务数据
         * 1、获取转发器
         * 2、完成转发
         */

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/show.jsp");
        requestDispatcher.forward(req,resp);


    }
}
