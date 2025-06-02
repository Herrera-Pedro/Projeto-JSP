package DAO;

import entity.Pedido;
import util.ConnectionFactory;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PedidoDAO {

    public void inserir(Pedido pedido) throws SQLException {
        String sql = "INSERT INTO pedidos (user_id, pepperoni, rucula, chocolate) VALUES (?, ?, ?, ?)";
        try (Connection conn = ConnectionFactory.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, pedido.getUserId());
            stmt.setInt(2, pedido.getPepperoni());
            stmt.setInt(3, pedido.getRucula());
            stmt.setInt(4, pedido.getChocolate());
            stmt.executeUpdate();
        }
    }

    public List<Pedido> listarTodos() throws SQLException {
        List<Pedido> pedidos = new ArrayList<>();
        String sql = "SELECT * FROM pedidos";
        try (Connection conn = ConnectionFactory.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Pedido pedido = new Pedido();
                pedido.setId(rs.getInt("id"));
                pedido.setUserId(rs.getInt("user_id"));
                pedido.setPepperoni(rs.getInt("pepperoni"));
                pedido.setRucula(rs.getInt("rucula"));
                pedido.setChocolate(rs.getInt("chocolate"));
                pedidos.add(pedido);
            }
        }
        return pedidos;
    }

    public Pedido buscarPorId(int id) throws SQLException {
        String sql = "SELECT * FROM pedidos WHERE id = ?";
        try (Connection conn = ConnectionFactory.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Pedido pedido = new Pedido();
                    pedido.setId(rs.getInt("id"));
                    pedido.setUserId(rs.getInt("user_id"));
                    pedido.setPepperoni(rs.getInt("pepperoni"));
                    pedido.setRucula(rs.getInt("rucula"));
                    pedido.setChocolate(rs.getInt("chocolate"));
                    return pedido;
                }
            }
        }
        return null;
    }

    public void atualizar(Pedido pedido) throws SQLException {
        String sql = "UPDATE pedidos SET user_id = ?, pepperoni = ?, rucula = ?, chocolate = ? WHERE id = ?";
        try (Connection conn = ConnectionFactory.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, pedido.getUserId());
            stmt.setInt(2, pedido.getPepperoni());
            stmt.setInt(3, pedido.getRucula());
            stmt.setInt(4, pedido.getChocolate());
            stmt.setInt(5, pedido.getId());
            stmt.executeUpdate();
        }
    }

    public void deletar(int id) throws SQLException {
        String sql = "DELETE FROM pedidos WHERE id = ?";
        try (Connection conn = ConnectionFactory.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }
}