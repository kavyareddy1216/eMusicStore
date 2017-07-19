package com.emusicstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Satheesh Reddy on 6/29/2017.
 */

@Controller
@RequestMapping("/cart")
public class CartItemController {
    @RequestMapping
    public String get(HttpServletRequest request){
        return  "redirect:/cart/"+request.getSession(true).getId();
    }

    @RequestMapping(value = "/{cartId}", method = RequestMethod.GET)
    public String getCart(@PathVariable(value = "cartId") String cartId, Model model){
        System.out.print("hiiiiiiiiii");
        model.addAttribute("cartId",cartId);
        return "cart";
    }

}
