package Servlet;

import com.alibaba.fastjson.JSONObject;
import Dto.User;
import util.DbUtil;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

@WebServlet("/login")
public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        PrintWriter writer = resp.getWriter();
        HashMap<String, Object> res = new HashMap<>();
        Connection connection = DbUtil.getConnection();
        User user = null;
        String sql = "select * from user where userName = ? and userPwd = ?";
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                user = new User();
                user.setUserId(resultSet.getString(1));
                user.setUserAddress(resultSet.getString(2));
                user.setUserName(resultSet.getString(3));
                user.setUserTel(resultSet.getString(4));
                user.setUserPwd(resultSet.getString(6));
                user.setUserGender(resultSet.getString(5));
                req.getSession().setAttribute("user", user);
            }
            if (user != null) {
                res.put("retCode", 200);
                res.put("user", user);
            } else {
                res.put("retCode", 400);
                res.put("retMsg", "用户名或密码错误");
            }
            writer.print(JSONObject.toJSONString(res));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            if (preparedStatement != null){
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            DbUtil.close(connection);
        }
    }
}
