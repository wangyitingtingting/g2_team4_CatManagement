package Servlet;

import Dao.AdoptDAO;
import Dto.Admin;
import Dto.Adopt;
import Dto.User;
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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@WebServlet("/adoptionManage")
public class AdoptionManage extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            //申请领养查询
            AdoptDAO adoptDAO = new AdoptDAO();
            List<Adopt> adopts = adoptDAO.selectAllAdopts();
            req.setAttribute("adoptions", adopts);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/adoptionManage.jsp");
        requestDispatcher.forward(req,resp);
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
