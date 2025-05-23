package DAO;

import entity.Pedido;
import entity.Pizza;
import util.DBConnectionUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PedidoDAO {

    public boolean inserir(Pedido pedido) {
        String sql = "INSERT INTO pedidos (cliente_id, total, status) VALUES (?, ?, ?)"; // Altere conforme seu banco
        try (Connection conn = DBConnectionUtil.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setInt(1, pedido.getClienteId());
            stmt.setDouble(2, pedido.getTotal());
            stmt.setString(3, pedido.getStatus());
            int rows = stmt.executeUpdate();

            if (rows > 0) {
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    int pedidoId = rs.getInt(1);
                    inserirPizzasPedido(conn, pedidoId, pedido.getPizzas());
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private void inserirPizzasPedido(Connection conn, int pedidoId, List<Pizza> pizzas) throws SQLException {
        String sql = "INSERT INTO pedido_pizza (pedido_id, pizza_id) VALUES (?, ?)"; // Altere conforme seu banco
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            for (Pizza pizza : pizzas) {
                stmt.setInt(1, pedidoId);
                stmt.setInt(2, pizza.getId());
                stmt.addBatch();
            }
            stmt.executeBatch();
        }
    }

    public List<Pedido> listarTodos() {
        List<Pedido> pedidos = new ArrayList<>();
        String sql = "SELECT * FROM pedidos"; // Altere conforme seu banco

        try (Connection conn = DBConnectionUtil.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Pedido pedido = new Pedido();
                pedido.setId(rs.getInt("id"));
                pedido.setClienteId(rs.getInt("cliente_id"));
                pedido.setTotal(rs.getDouble("total"));
                pedido.setStatus(rs.getString("status"));
                pedido.setPizzas(buscarPizzasPorPedido(conn, pedido.getId()));
                pedidos.add(pedido);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pedidos;
    }

    private List<Pizza> buscarPizzasPorPedido(Connection conn, int pedidoId) throws SQLException {
        List<Pizza> pizzas = new ArrayList<>();
        String sql = "SELECT p.id, p.nome, p.preco FROM pizzas p " +
                     "JOIN pedido_pizza pp ON p.id = pp.pizza_id WHERE pp.pedido_id = ?"; // Altere conforme seu banco
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, pedidoId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Pizza pizza = new Pizza();
                    pizza.setId(rs.getInt("id"));
                    pizza.setNome(rs.getString("nome"));
                    pizza.setPreco(rs.getDouble("preco"));
                    pizzas.add(pizza);
                }
            }
        }
        return pizzas;
    }

    // Adapte nomes de tabelas/colunas conforme seu banco de dados real
}