/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.util.HashMap;
import java.util.Map;
import sample.product.VegetableDTO;

/**
 *
 * @author Bao
 */
public class Cart {
    private Map<String, VegetableDTO> cart;

    public Cart() {
    }

    public Cart(Map<String, VegetableDTO> cart) {
        this.cart = cart;
    }

    public Map<String, VegetableDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, VegetableDTO> cart) {
        this.cart = cart;
    }
    
    public boolean add(VegetableDTO vegetable){
        boolean check = false;
        try {
            if(this.cart==null){
            this.cart= new HashMap<>();
        }
        if(this.cart.containsKey(vegetable.getVegetableID())){
            int currentQuantity =this.cart.get(vegetable.getVegetableID()).getQuantity();
            vegetable.setQuantity(currentQuantity+ vegetable.getQuantity());
        }
        this.cart.put(vegetable.getVegetableID(), vegetable);
        check = true;
        } catch (Exception e) {
        }
        return check;
    }
    
    public boolean remove(String id){
        boolean check = false;
        try {
            if(this.cart!=null){
                if(this.cart.containsKey(id)){
                    this.cart.remove(id);
                }
            }
        } catch (Exception e) {
        }
        return check;
    }
    
    public boolean update(String id, VegetableDTO vegetable){
        boolean check = false;
        try {
            if(this.cart!=null){
                if(this.cart.containsKey(id)){
                    this.cart.replace(id, vegetable);
                }
            }
        } catch (Exception e) {
        }
        return check;
    }
}
