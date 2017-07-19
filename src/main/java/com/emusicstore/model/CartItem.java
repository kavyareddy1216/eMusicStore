package com.emusicstore.model;

/**
 * Created by Satheesh Reddy on 6/29/2017.
 */
public class CartItem {

    private Product product;
    private int quantity;
    private double totalprice;
    public CartItem(){}

    public CartItem(Product product, int quantity, double totalprice) {
        this.product = product;
        this.quantity = quantity;
        this.totalprice = totalprice;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(double totalprice) {
        this.totalprice = totalprice;
    }
}
