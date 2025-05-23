package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectionUtil {

    private static final String URL = "";

    private static final String DRIVER = "com.mysql.mysql-connector-j";

    // Never commit a real username or dont write as String
    private static final String USERNAME = "[YOUR USER HERE]";

    // Never commit a real password or dont write as String
    private static final String PASSWORD = "[YOUR DB PASSWORD]";

    private static Connection connection = null;

    public static Connection openConnection() {
        if (connection != null) {
            return connection;
        } else {

            try {
                Class.forName(DRIVER);
                connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
                System.out.println("Success connected to database");
            } catch (Exception e) {
                e.printStackTrace();
            }
            return connection;
        }
    }
}
