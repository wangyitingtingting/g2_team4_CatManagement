package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dto.Review;
import util.DbUtil;

/**
 * Servlet implementation class SysReview
 */
@WebServlet("/SysReview")
public class SysReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SysReview() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection connection = DbUtil.getConnection();
		String sql = "select id,form_user_name,to_user_name,content,create_time from review";
        PreparedStatement preparedStatement = null;
        List<Review> reviewList = new ArrayList<Review>();
        try {
            preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
            	Review review = new Review(resultSet.getInt(1),resultSet.getString(2),resultSet.getString(3),
            			resultSet.getString(4),resultSet.getDate(5)+" "+resultSet.getTime(5));
                reviewList.add(review);
            }
            request.getSession().setAttribute("sysReviews", reviewList);
            request.getRequestDispatcher("/sysReviews.jsp").forward(request, response);
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
