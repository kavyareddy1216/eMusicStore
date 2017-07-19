package com.emusicstore.model;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Satheesh Reddy on 6/29/2017.
 */
public class Cart {
    private String cartId;
    private Map<String, CartItem> cartItemMap;
    private double gradTotal;

    public Cart() {
        cartItemMap = new HashMap<String, CartItem>();
        gradTotal = 0;
    }

    public Cart(String cartId) {
        this();
        this.cartId = cartId;
    }

    public String getCartId() {
        return cartId;
    }

    public void setCartId(String cartId) {
        this.cartId = cartId;
    }

    public Map<String, CartItem> getCartItemMap() {
        return cartItemMap;
    }

    public void setCartItemMap(Map<String, CartItem> cartItemMap) {
        this.cartItemMap = cartItemMap;
    }

    public double getGradTotal() {
        return gradTotal;
    }

    public void setGradTotal(double gradTotal) {
        this.gradTotal = gradTotal;
    }

    public  void addCartItem(CartItem cartItem){
        String productId = cartItem.getProduct().getProductId();
        if(cartItemMap.containsKey(productId)){
            CartItem existingItems = cartItemMap.get(productId);
            existingItems.setQuantity(existingItems.getQuantity()+cartItem.getQuantity());
            cartItemMap.put(productId, existingItems);

        }
        else {
            cartItemMap.put(productId,cartItem);
        }
        updateGrandTotal();
    }

    public void removeCartItem(CartItem cartItem){
        String productId = cartItem.getProduct().getProductId();
        cartItemMap.remove(productId);
        updateGrandTotal();
    }

    public void updateGrandTotal() {
    gradTotal=0;
        for (CartItem item: cartItemMap.values()
             ) {
            gradTotal = gradTotal+item.getTotalprice();

        }



    }
}
