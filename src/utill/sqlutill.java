package utill;

import java.sql.*;



public  class sqlutill {
    public static Connection getConn() {
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/jdbc";
        String username = "root";
        String password = "root";
        Connection conn = null;
        try {
            Class.forName(driver); //
            conn = (Connection) DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
}
