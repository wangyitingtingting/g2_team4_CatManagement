package Servlet;

import com.alibaba.fastjson.JSON;
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
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

@WebServlet("/update")
public class Update extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String body = req.getParameter("req");
        resp.setContentType("text/html;charset=utf-8");
        Admin admin = JSONObject.parseObject(body, Admin.class);
        Admin update = (Admin) req.getSession().getAttribute("update");
        admin.setManageId(update.getManageId());
        PrintWriter writer = resp.getWriter();
        Connection connection = DbUtil.getConnection();
        PreparedStatement preparedStatement = null;
        HashMap<String, Object> res = new HashMap<>();
        String sql = "UPDATE admin "
                + "SET manageTel=?, manageGender=?, manageName=?, managePassword=? "
                + "WHERE manageId=?";
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, admin.getManageTel());
            preparedStatement.setString(2, admin.getManageGender());
            preparedStatement.setString(3, admin.getManageName());
            preparedStatement.setString(4, admin.getManagePassword());
            preparedStatement.setLong(5, admin.getManageId());
            preparedStatement.execute();
            res.put("retCode", 200);
            List<Admin> admins = (List<Admin>) req.getSession().getAttribute("admins");
            removeAndAdd(admins, admin);
            req.getSession().setAttribute("admins", admins);
        } catch (SQLException e) {
            e.printStackTrace();
            res.put("retCode", 400);
            res.put("retMsg", "修改失败");
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

    private void removeAndAdd(List<Admin> admins, Admin target) {
        int index = 0;
        for (Admin admin : admins) {
            if (admin.getManageId().equals(target.getManageId())) {
                break;
            }
            index++;
        }
        admins.remove(index);
        admins.add(target);
    }
}
