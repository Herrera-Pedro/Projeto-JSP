package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnectionUtil {

    private static final String URL = "jdbc:mysql://localhost:3306/testDB";

    // Never commit a real username or dont write as String
    private static final String USERNAME = "";

    // Never commit a real password or dont write as String
    private static final String PASSWORD = "";

    private static Connection connection;

    public static Connection openConnection() {
        if (connection != null) {
            return connection;
        } else {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
                System.out.println("Success connected to database");
            } catch (Exception e) {
                e.printStackTrace();
            }
            return connection;
        }
    }
}
