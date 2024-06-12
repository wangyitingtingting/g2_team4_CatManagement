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

        updateAdoptStatus( animalName, Integer.parseInt(action));

        updateApproved( animalName, reason, Integer.parseInt(action));


        response.sendRedirect("adoptionManage");

    }

    public boolean updateAdoptStatus(String animalName, int status) {
        try (Connection connection = DbUtil.getConnection()) {
            String query = "UPDATE animals SET LYstatus = ? WHERE animalName = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, status);
            statement.setString(2, animalName);
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateApproved(String animalName, String reason, int status) {
        String approved = null;
        if(status == 1){
            approved = "ͬ同意";
        }else {
            approved = "不同意";
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
