package Servlet;

import Dao.AdoptDAO;
import Dto.Adopt;
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

@WebServlet("/adminLogin")
public class AdminLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        PrintWriter writer = resp.getWriter();
        HashMap<String, Object> res = new HashMap<>();
        Connection connection = DbUtil.getConnection();
        Admin admin = null;
        String sql = "select * from admin where manageId = ? and managePassword = ?";
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                admin = new Admin();
                admin.setManageId(resultSet.getLong(1));
                admin.setManageTel(resultSet.getString(2));
                admin.setManageGender(resultSet.getString(3).equals("0") ? "男" : "女");
                admin.setManageName(resultSet.getString(4));
                admin.setManagePassword(resultSet.getString(5));
            }
            if (admin != null) {
                res.put("retCode", 200);
                res.put("admin", admin);
                List<Admin> admins = queryAdmin();
                List<User> users = queryUser();
                req.getSession().setAttribute("admins", admins);
                req.getSession().setAttribute("users", users);
            } else {
                res.put("retCode", 400);
                res.put("retMsg", "用户名或密码错误");
            }

            resp.sendRedirect("admin.jsp");
//            writer.print(JSONObject.toJSONString(res));
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
//                user.setUserId(resultSet.getString(1));
//                user.setUserAddress(resultSet.getString(2));
//                user.setUserName(resultSet.getString(3));
//                user.setUserTel(resultSet.getString(4));
//                user.setUserPwd(resultSet.getString(6));
//                user.setUserGender(resultSet.getString(5).equals("0") ? "男" : "女");
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

    private List<Admin> queryAdmin() {
        Connection connection = DbUtil.getConnection();
        String sql = "select * from admin";
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            List<Admin> admins = new ArrayList<>();
            while (resultSet.next()) {
                Admin admin = new Admin();
                admin.setManageId(resultSet.getLong(1));
                admin.setManageTel(resultSet.getString(2));
                admin.setManageGender(resultSet.getString(3).equals("0") ? "男" : "女");
                admin.setManageName(resultSet.getString(4));
                admin.setManagePassword(resultSet.getString(5));
                admins.add(admin);
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
