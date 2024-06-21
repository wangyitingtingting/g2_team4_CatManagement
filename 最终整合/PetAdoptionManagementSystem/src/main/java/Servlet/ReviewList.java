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

import com.mysql.cj.util.StringUtils;

import Dto.Review;
import util.DbUtil;

/**
 * Servlet implementation class ReviewList
 */
@WebServlet("/ReviewList")
public class ReviewList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection connection = DbUtil.getConnection();
		String sql = "select id,form_user_name,to_user_name,content,create_time from review where parent_id = ?";
        PreparedStatement preparedStatement = null;
        List<Review> reviewList = new ArrayList<Review>();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, 0);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
            	Review review = new Review();
                List<Review> nextList = new ArrayList<Review>();
                review.setId(resultSet.getInt(1));
                review.setFormUserName(resultSet.getString(2));
                review.setToUserName(resultSet.getString(3));
                review.setContent(resultSet.getString(4));
                review.setCreateTimeStr(resultSet.getDate(5)+" "+resultSet.getTime(5));
        		String nextSql = "select id,form_user_name,to_user_name,content,create_time from review where parent_id = ? ";
        		preparedStatement = connection.prepareStatement(nextSql);
                preparedStatement.setInt(1, review.getId());
                ResultSet resultNextSet = preparedStatement.executeQuery();
                
                while (resultNextSet.next()) {
                	Review reviewNext = new Review();
                	reviewNext.setId(resultNextSet.getInt(1));
                	reviewNext.setFormUserName(resultNextSet.getString(2));
                	reviewNext.setToUserName(resultNextSet.getString(3));
                	reviewNext.setContent(resultNextSet.getString(4));
                	reviewNext.setCreateTimeStr(resultNextSet.getDate(5)+" "+resultNextSet.getTime(5));
                    nextList.add(reviewNext);
                }
                review.setChildList(nextList);
                reviewList.add(review);
            }
            System.out.println(reviewList.toString());
            request.getSession().setAttribute("reviews", reviewList);
            request.getRequestDispatcher("/news.jsp").forward(request, response);
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
	}
}
