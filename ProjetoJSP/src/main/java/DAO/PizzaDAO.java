package DAO;

import entity.Pizza;
import util.ConnectionFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PizzaDAO {

    // Retorna todas as pizzas cadastradas
    public List<Pizza> listarTodas() {
        List<Pizza> pizzas = new ArrayList<>();
        String sql = "SELECT * FROM pizzas"; // Altere o nome da tabela/colunas conforme seu banco

        try (Connection conn = ConnectionFactory.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Pizza pizza = new Pizza();
                // Altere os métodos conforme os atributos da sua classe Pizza
                // pizza.setId(rs.getInt("id"));
                // pizza.setNome(rs.getString("nome"));
                // pizza.setPreco(rs.getDouble("preco"));
                pizzas.add(pizza);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pizzas;
    }

    // Insere uma nova pizza
    public boolean inserir(Pizza pizza) {
        String sql = "INSERT INTO pizzas (nome, preco) VALUES (?, ?)"; // Altere conforme seu banco
        try (Connection conn = ConnectionFactory.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // stmt.setString(1, pizza.getNome());
            // stmt.setDouble(2, pizza.getPreco());
            int rows = stmt.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Outros métodos como buscarPorId, atualizar, deletar podem ser adicionados conforme necessidade
}