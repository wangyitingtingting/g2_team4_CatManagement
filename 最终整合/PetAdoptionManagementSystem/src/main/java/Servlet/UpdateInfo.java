package Servlet;

import com.alibaba.fastjson.JSONObject;
import main.java.Dto.User;
import main.java.util.DbUtil;

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

@WebServlet("/updateinfo")
public class UpdateInfo extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter writer = resp.getWriter();
        HashMap<String, Object> res = new HashMap<>();
        String body = req.getParameter("req");
        User user = JSONObject.parseObject(body, User.class);
        Connection connection = DbUtil.getConnection();
        PreparedStatement preparedStatement = null;
        String sql = "update pet.`user`" +
                "set userAddress=?, userName=?, userTel=?, userGender=?, userPwd=?" +
                "where userID=?";
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, user.getUserAddress());
            preparedStatement.setString(2, user.getUserName());
            preparedStatement.setString(3, user.getUserTel());
            preparedStatement.setString(4, user.getUserGender());
            preparedStatement.setString(5, user.getUserPwd());
            preparedStatement.setString(6, user.getUserId());
            preparedStatement.execute();
            res.put("retCode", 200);
            req.getSession().setAttribute("loginUser", user);
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
}
