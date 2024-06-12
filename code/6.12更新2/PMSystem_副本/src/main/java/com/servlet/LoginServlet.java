package com.servlet;

import com.pojo.User;
import com.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
import java.io.IOException;

 


//完成三件事，接收参数，调用service，完成跳转
@WebServlet("/gly/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect(req.getContextPath()+"/gly/animalLogin.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    
        //接收前台参数
        String uname = req.getParameter("uname");
        String pwd = req.getParameter("pwd");

        //调用service
        UserServiceImpl userService = new UserServiceImpl();
        User user = userService.selectByUnameAndPwd(uname, pwd);


        //获得session对象
        HttpSession session = req.getSession();
        //跳转，如果发生错误，就给一个提示信息，并重定向到登录页面
        if (user==null){
            session.setAttribute("msg","账号密码错误");
            resp.sendRedirect(req.getContextPath()+"/login.jsp");
        }else {
            //登录成功，存储用户信息到session中
            session.setAttribute("user",user);

            //记住我，将数据保存cookie：存储在浏览器、、数据大小限制4kb，支支持字符串

            //创建cookie
            Cookie uname1 = new Cookie("uname", user.getUname());
            Cookie pwd1 = new Cookie("pwd", user.getPwd());

            //默认的适用范围为当前项目
            //获取记住我的按钮选项
            String ck = req.getParameter("ck");
            if ("yes".equals(ck)){
                //持久化cookie
                uname1.setMaxAge(60*60*24);
                pwd1.setMaxAge(60*60*24);
            }else {

                //清除cookie
                uname1.setMaxAge(0);
                pwd1.setMaxAge(0);
            }

            //传到cookie
            resp.addCookie(uname1);
            resp.addCookie(pwd1);


            resp.sendRedirect(req.getContextPath()+"/QueryAnimalServlet");
        }

    }
}
