package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.mysql.cj.util.StringUtils;

import Dto.Admin;
import Dto.User;
import util.DbUtil;

/**
 * Servlet implementation class AddReview
 */
@WebServlet("/addReview")
public class AddReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		Object loginUser = request.getSession().getAttribute("loginUser");
		PrintWriter writer = response.getWriter();
		 HashMap<String, Object> res = new HashMap<>();
		if(loginUser==null) {
			 res.put("retCode", 401);
             res.put("retMsg", "添加失败");
             writer.print(JSONObject.toJSONString(res));
			 return;
		}
		String toUserName = request.getParameter("toUserName");
		String parentId =  request.getParameter("parentId");
		if(StringUtils.isNullOrEmpty(toUserName)) {
			parentId = "0";
		}
		String content = request.getParameter("content");
		Connection connection = DbUtil.getConnection();
		String sql = "select * from user where userName = ?";
        PreparedStatement preparedStatement = null;
       
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, toUserName);
            ResultSet resultSet = preparedStatement.executeQuery();
            User toUser = new User();
            while (resultSet.next()) {
                toUser.setUserId(resultSet.getString(1));
                toUser.setUserAddress(resultSet.getString(2));
                toUser.setUserName(resultSet.getString(3));
                toUser.setUserTel(resultSet.getString(4));
                toUser.setUserPwd(resultSet.getString(6));
                toUser.setUserGender(resultSet.getString(5));
            }
            sql = "INSERT INTO pet.review"
                    + "(form_user_id,form_user_name, to_user_id, to_user_name, content,create_time,parent_id)"
                    + "VALUES(?,?, ?, ?, ?,NOW(),?)";
            try {
            	Date createDate = new Date(System.currentTimeMillis());
            	
            	User user = (User)request.getSession().getAttribute("loginUser");
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1,user.getUserId());
                preparedStatement.setString(2, user.getUserName());
                if(!"0".equals(parentId) && !StringUtils.isNullOrEmpty(toUser.getUserId())) {
                	preparedStatement.setString(3, toUser.getUserId());
                    preparedStatement.setString(4, toUser.getUserName());
                }else {
                	preparedStatement.setString(3, "0");
                    preparedStatement.setString(4, "me");
                }
                preparedStatement.setString(5, content);
                preparedStatement.setInt(6, Integer.parseInt(parentId));
                preparedStatement.execute();
                res.put("retCode", 200);
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
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            if (preparedStatement != null){
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            DbUtil.close(connection);
        }
		// TODO Auto-generated method stub
	}

}
