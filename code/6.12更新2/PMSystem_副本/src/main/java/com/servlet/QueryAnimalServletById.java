package com.servlet;

import com.pojo.Animal;
import com.service.impl.AnimalServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/QueryAnimalServletById")
public class QueryAnimalServletById extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //接收参数
        String id = req.getParameter("id");
        Integer id1 = Integer.valueOf(id);


        //调用
        AnimalServiceImpl AnimalService = new AnimalServiceImpl();
        Animal a = AnimalService.queryAnimalById(id1);


        //跳转
        req.setAttribute("animal",a);

        //转发，携带参数
        req.getRequestDispatcher("update.jsp").forward(req,resp);


    }
}
