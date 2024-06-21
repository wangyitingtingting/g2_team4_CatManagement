package Servlet;

import com.alibaba.fastjson.JSONObject;
import Dto.Admin;
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

@WebServlet("/adminDel")
public class DelAdmin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        String id = req.getParameter("id");
        String sql = "delete from admin where manageId = ?";
        Connection connection = DbUtil.getConnection();
        PreparedStatement preparedStatement = null;
        PrintWriter writer = resp.getWriter();
        HashMap<String, Object> res = new HashMap<>();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, id);
            preparedStatement.execute();
            res.put("retCode", 200);
            List<Admin> admins = queryAdmin();
            req.getSession().setAttribute("admins", admins);
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
                admin.setManageGender(resultSet.getString(3));
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
