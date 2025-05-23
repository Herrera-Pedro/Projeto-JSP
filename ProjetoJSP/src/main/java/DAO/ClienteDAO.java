package DAO;

import entity.Cliente;
import util.DBConnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ClienteDAO {

    // Busca cliente pelo e-mail e senha (login)
    public Cliente buscarPorEmailSenha(String email, String senha) {
        Cliente cliente = null;
        String sql = "SELECT * FROM users WHERE email = ? AND senha = ?"; // Altere o nome da tabela/colunas conforme seu banco

        try (Connection conn = DBConnectionUtil.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            stmt.setString(2, senha);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                cliente = new Cliente();
                cliente.setId(rs.getInt("id"));
                cliente.setNome(rs.getString("nome"));
                cliente.setEmail(rs.getString("email"));
                cliente.setSenha(rs.getString("senha"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cliente;
    }

    // Insere novo cliente
    public boolean inserir(Cliente cliente) {
        String sql = "INSERT INTO users (nome, email, senha) VALUES (?, ?, ?)"; // Altere conforme seu banco
        try (Connection conn = DBConnectionUtil.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, cliente.getNome());
            stmt.setString(2, cliente.getEmail());
            stmt.setString(3, cliente.getSenha());
            int rows = stmt.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Outros métodos como atualizar, deletar, buscar por id podem ser adicionados conforme necessidade
}