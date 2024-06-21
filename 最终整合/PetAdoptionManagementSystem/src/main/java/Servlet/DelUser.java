package Servlet;

import com.alibaba.fastjson.JSONObject;
import Dto.Admin;
import Dto.User;
import util.DbUtil;

import javax.servlet.ServletException;
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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@WebServlet("/userDel")
public class DelUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        String id = req.getParameter("id");
        String sql = "delete from user where userID = ?";
        Connection connection = DbUtil.getConnection();
        PreparedStatement preparedStatement = null;
        PrintWriter writer = resp.getWriter();
        HashMap<String, Object> res = new HashMap<>();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, id);
            preparedStatement.execute();
            res.put("retCode",200);
            List<User> users = queryUser();
            req.getSession().setAttribute("users", users);
            writer.print(JSONObject.toJSONString(res));
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        } finally {
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            DbUtil.close(connection);
        }
    }
    private List<User> queryUser() {
        Connection connection = DbUtil.getConnection();
        String sql = "select * from user";
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            List<User> admins = new ArrayList<>();
            while (resultSet.next()) {
                User user = new User();
                user.setUserId(resultSet.getString(1));
                user.setUserAddress(resultSet.getString(2));
                user.setUserName(resultSet.getString(3));
                user.setUserTel(resultSet.getString(4));
                user.setUserPwd(resultSet.getString(6));
                user.setUserGender(resultSet.getString(5).equals("0") ? "男" : "女");
                admins.add(user);
            }
            return admins;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        } finally {
            if (preparedStatement != null) {
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
