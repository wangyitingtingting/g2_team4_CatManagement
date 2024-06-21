package Servlet;

import Dao.AdoptDAO;
import Dto.Admin;
import Dto.Adopt;
import Dto.User;
import com.alibaba.fastjson.JSONObject;
import com.pojo.Animal;
import com.service.impl.AnimalServiceImpl;
import util.DbUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

@WebServlet("/adoption")
public class AdoptionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //接收参数
        String animalType = req.getParameter("animalType");
        String animalGender = req.getParameter("animalGender");

        //调用service
        AnimalServiceImpl AnimalService = new AnimalServiceImpl();

        List<Animal> list = AnimalService.selectAllAnimal(animalType, animalGender);

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

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/adoption.jsp");
        requestDispatcher.forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String experience = req.getParameter("experience");
        String reason = req.getParameter("reason");
        String animalName = req.getParameter("animalName");
        User user = (User) req.getSession().getAttribute("loginUser");
        AdoptDAO dao = new AdoptDAO();
        Adopt adopt = new Adopt(user.getUserName(), animalName, reason, experience);
        try {
            dao.insertAdopt(adopt);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        resp.sendRedirect(req.getContextPath()+"/adoption");
    }
}
