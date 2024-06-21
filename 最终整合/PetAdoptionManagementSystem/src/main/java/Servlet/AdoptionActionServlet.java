package Servlet;

import util.DbUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/adoptionAction")
public class AdoptionActionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");

        String animalName = request.getParameter("animalName");

        String reason = request.getParameter("reason");

        String action = request.getParameter("action");

        String userName = request.getParameter("userName");
       
        //修改当前领养记录里面的动物是否被领养  0---》未领养  1--已领养
         updateAdoptStatus( animalName, Integer.parseInt(action), userName);
        //1、把当前领养记录审核 是否可以进行领养 并修改当前数据  0---》审核状态---》管理员去进行操作 1--同意  0 拒绝
        updateApproved( animalName, reason, Integer.parseInt(action));


        response.sendRedirect("adoptionManage");

    }

    public boolean updateAdoptStatus(String animalName, int status, String userName) {
    	System.out.println("updateAnimals::"+animalName+"::"+userName+"::"+status);
        try (Connection connection = DbUtil.getConnection()) {
            String query = "UPDATE animals SET LYstatus = ?, UserName = ? WHERE animalName = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, status);
            statement.setString(2, userName);
            statement.setString(3, animalName);
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateApproved(String animalName, String reason, int status) {
    	System.out.println("updateApproved::"+animalName+"::"+reason+"::"+status);
        String approved = null;
        if(status == 1){
            approved = "ͬ同意";
        }else {
            approved = "拒绝";
        }
        try (Connection connection = DbUtil.getConnection()) {
            String query = "UPDATE adopt SET approved = ? WHERE animalName = ? and reason = ? ";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, approved);
            statement.setString(2, animalName);
            statement.setString(3, reason);
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
