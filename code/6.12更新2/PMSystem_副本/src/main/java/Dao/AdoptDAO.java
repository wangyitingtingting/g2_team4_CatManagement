package Dao;

import Dto.Adopt;
import util.DbUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdoptDAO {
    private static final String INSERT_ADOPT_SQL = "INSERT INTO adopt (userName, animalName, reason, experience) VALUES (?, ?, ?, ?);";
    private static final String SELECT_ADOPT_BY_ID = "SELECT id, userName, animalName, reason, experience FROM adopt WHERE id = ?;";
    private static final String SELECT_ALL_ADOPTS = "SELECT * FROM adopt;";
    private static final String DELETE_ADOPT_SQL = "DELETE FROM adopt WHERE id = ?;";
    private static final String UPDATE_ADOPT_SQL = "UPDATE adopt SET userName = ?, animalName = ?, reason = ?, experience = ? WHERE id = ?;";

    protected Connection getConnection() {
        Connection connection = null;
        connection = DbUtil.getConnection();
        return connection;
    }

    public void insertAdopt(Adopt adopt) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ADOPT_SQL)) {
            preparedStatement.setString(1, adopt.getUserName());
            preparedStatement.setString(2, adopt.getAnimalName());
            preparedStatement.setString(3, adopt.getReason());
            preparedStatement.setString(4, adopt.getExperience());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Adopt selectAdopt(int id) {
        Adopt adopt = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ADOPT_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                String userName = rs.getString("userName");
                String animalName = rs.getString("animalName");
                String reason = rs.getString("reason");
                String experience = rs.getString("experience");
                String approved = rs.getString("approved");
                adopt = new Adopt(id, userName, animalName, reason, experience, approved);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return adopt;
    }

    public List<Adopt> selectAllAdopts() {
        List<Adopt> adopts = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ADOPTS)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String userName = rs.getString("userName");
                String animalName = rs.getString("animalName");
                String reason = rs.getString("reason");
                String experience = rs.getString("experience");
                String approved = rs.getString("approved");
                adopts.add(new Adopt(id, userName, animalName, reason, experience, approved));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return adopts;
    }

    public boolean deleteAdopt(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_ADOPT_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateAdopt(Adopt adopt) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_ADOPT_SQL)) {
            statement.setString(1, adopt.getUserName());
            statement.setString(2, adopt.getAnimalName());
            statement.setString(3, adopt.getReason());
            statement.setString(4, adopt.getExperience());
            statement.setInt(5, adopt.getId());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
}
