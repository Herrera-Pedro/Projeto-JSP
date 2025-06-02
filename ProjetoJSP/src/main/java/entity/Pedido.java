package entity;

import java.util.List;

public class Pedido {
    private int id;
    private int clienteId; // ou Cliente cliente, se preferir objeto
    private List<Pizza> pizzas;
    private double total;
    private String status;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public int getClienteId() {
        return clienteId;
    }
    public void setClienteId(int clienteId) {
        this.clienteId = clienteId;
    }

    public List<Pizza> getPizzas() {
        return pizzas;
    }
    public void setPizzas(List<Pizza> pizzas) {
        this.pizzas = pizzas;
    }

    public double getTotal() {
        return total;
    }
    public void setTotal(double total) {
        this.total = total;
    }

    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }

    // Getters e setters compatíveis com PedidoDAO
    public int getUserId() {
        return clienteId;
    }
    public void setUserId(int userId) {
        this.clienteId = userId;
    }

    private int pepperoni;
    private int rucula;
    private int chocolate;

    public int getPepperoni() {
        return pepperoni;
    }
    public void setPepperoni(int pepperoni) {
        this.pepperoni = pepperoni;
    }

    public int getRucula() {
        return rucula;
    }
    public void setRucula(int rucula) {
        this.rucula = rucula;
    }

    public int getChocolate() {
        return chocolate;
    }
    public void setChocolate(int chocolate) {
        this.chocolate = chocolate;
    }

    // Altere os campos conforme o banco de dados real, se necessário
}