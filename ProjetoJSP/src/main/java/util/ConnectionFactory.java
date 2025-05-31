package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Logger;
import java.util.logging.Level;

public class ConnectionFactory {
    
    private static final Logger LOGGER = Logger.getLogger(ConnectionFactory.class.getName());
    
    private static final String URL = "jdbc:mysql://localhost:3300/testDB";

    // Never commit a real username or dont write as String
    private static final String USERNAME = "root";

    // Never commit a real password or dont write as String
    private static final String PASSWORD = "Root";

    private static Connection connection;
    
    public static Connection openConnection() {
        try {
            // Carrega o driver JDBC (opcional em JDBC 4.0+:contentReference[oaicite:3]{index=3})
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Abre a conexão com o banco de dados
            Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            LOGGER.info("Conexão com o banco estabelecida com sucesso");
            return conn;
        } catch (ClassNotFoundException e) {
            // Registra erro crítico de driver não encontrado e relança exceção
            LOGGER.log(Level.SEVERE, "Driver JDBC não encontrado", e);
            throw new RuntimeException("Driver JDBC não encontrado", e);
        } catch (SQLException e) {
            // Registra erro de SQL e relança exceção
            LOGGER.log(Level.SEVERE, "Erro ao conectar ao banco de dados", e);
            throw new RuntimeException("Erro ao conectar ao banco de dados", e);
        }
    }
}