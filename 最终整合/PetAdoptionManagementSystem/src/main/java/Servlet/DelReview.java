package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;

import Dto.Admin;
import Dto.Review;
import util.DbUtil;

/**
 * Servlet implementation class DelReview
 */
@WebServlet("/DelReview")
public class DelReview extends HttpServlet {
	private static final long serialVersionUID = 1L;

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
        String id = request.getParameter("id");
        Connection connection = DbUtil.getConnection();
        String querySql = "select parent_id from review where id = ?";
        PreparedStatement preparedStatement = null;
        PrintWriter writer = response.getWriter();
        HashMap<String, Object> res = new HashMap<>();
        try {
        	preparedStatement = connection.prepareStatement(querySql);
        	preparedStatement.setInt(1, Integer.parseInt(id));
        	ResultSet resultSet = preparedStatement.executeQuery();
         	String parentId = "0";
        	while(resultSet.next()) {
        		parentId = resultSet.getString(1);
        	}
        	if("0".equals(parentId)) {
                 String sql = "delete from review where id = ? or parent_id=?";
                 preparedStatement = connection.prepareStatement(sql);
        		 preparedStatement.setInt(1, Integer.parseInt(id));
        		 preparedStatement.setInt(2, Integer.parseInt(id));
        	}else {
        		String sql = "delete from review where id = ?";
        		preparedStatement = connection.prepareStatement(sql);
       		 	preparedStatement.setInt(1, Integer.parseInt(id));
        	}
            preparedStatement.execute();
            res.put("retCode", 200);
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

}
