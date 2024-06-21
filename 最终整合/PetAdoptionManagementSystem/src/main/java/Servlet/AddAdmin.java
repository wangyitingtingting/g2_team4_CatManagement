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
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

@WebServlet("/addAdmin")
public class AddAdmin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        String body = req.getParameter("req");
        Admin admin = JSONObject.parseObject(body, Admin.class);
        PrintWriter writer = resp.getWriter();
        Connection connection = DbUtil.getConnection();
        PreparedStatement preparedStatement = null;
        HashMap<String, Object> res = new HashMap<>();
        String sql = "INSERT INTO pet.admin"
                + "(manageId,manageTel, manageGender, manageName, managePassword)"
                + "VALUES(?,?, ?, ?, ?)";
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setLong(1, admin.getManageId());
            preparedStatement.setString(2, admin.getManageTel());
            preparedStatement.setString(3, admin.getManageGender());
            preparedStatement.setString(4, admin.getManageName());
            preparedStatement.setString(5, admin.getManagePassword());
            preparedStatement.execute();
            res.put("retCode", 200);
            List<Admin> admins = (List<Admin>) req.getSession().getAttribute("admins");
            admin.setManageGender(admin.getManageGender().equals("0") ? "男" : "女");
            admins.add(admin);
            req.getSession().setAttribute("admins", admins);
        } catch (SQLException e) {
            e.printStackTrace();
            res.put("retCode", 400);
            res.put("retMsg", "添加失败");
        } finally {
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            DbUtil.close(connection);
            writer.print(JSONObject.toJSONString(res));
        }
    }
}
