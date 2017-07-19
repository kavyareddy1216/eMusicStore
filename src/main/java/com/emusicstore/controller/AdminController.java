package com.emusicstore.controller;

import com.emusicstore.dao.ProductDao;
import com.emusicstore.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

/**
 * Created by Satheesh Reddy on 5/28/2017.
 */
@Controller
public class AdminController {
    private Path path;
    @Autowired
    private ProductDao productDao;
    @RequestMapping("/admin")
    public String adminPage(){
        return "admin";
    }
    @RequestMapping("/admin/productinventory")
    public String productInventory(Model model){
        List<Product> products = productDao.getAllProducts();
        model.addAttribute("products", products);
        return "productinventory";
    }
    @RequestMapping("/admin/productinventory/addproduct")
    public String addProduct(Model model){
        Product product = new Product();
        model.addAttribute("product",product);
        return "addProduct";
    }
    @RequestMapping(value = "/admin/productinventory/addproduct", method= RequestMethod.POST)
    public String addProductPost(@Valid @ModelAttribute("product") Product product, BindingResult result, HttpServletRequest request){
        if(result.hasErrors()){
            return "addProduct";
        }
        productDao.addProduct(product);
        MultipartFile productImage = product.getProductImage();
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        path = Paths.get(rootDirectory+"\\WEB-INF\\resources\\images\\"+product.getProductId()+".png");
        if(productImage  != null && !productImage.isEmpty()){
            try{
                productImage.transferTo(new File(path.toString()));
            }catch (Exception io){
                io.printStackTrace();
                throw new RuntimeException("Product image saving failed",io);
            }
        }

        return "redirect:/admin/productinventory";
    }
    @RequestMapping("/admin/productinventory/deleteproduct/{id}")
    public String deleteProduct(@PathVariable String id, Model model, HttpServletRequest request){

        productDao.deleteProduct(id);
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        path = Paths.get(rootDirectory+"\\WEB-INF\\resources\\images\\"+id+".png");
        if(Files.exists(path)){
            try{
                Files.delete(path);
            }catch (Exception e){
                e.printStackTrace();
            }
        }

        return "redirect:/admin/productinventory";
    }
    @RequestMapping("/admin/productinventory/editproduct/{id}")
    public  String editProduct(@PathVariable String id, Model model){
        Product product = productDao.getProductById(id);
        model.addAttribute("product", product);
        return "editproduct";
    }


    @RequestMapping(value = "/admin/productinventory/editproduct", method =RequestMethod.POST)
    public String editProduct(@Valid @ModelAttribute("product") Product product, BindingResult result, Model model, HttpServletRequest request){
        if(result.hasErrors()){
            return "editproduct";
        }
        MultipartFile productImage = product.getProductImage();
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");

        path = Paths.get(rootDirectory+"\\WEB-INF\\resources\\images\\"+product.getProductId()+".png");
        if(productImage!=null&& !productImage.isEmpty()){
            try {
                productImage.transferTo(new File(path.toString()));
            }catch (Exception e){

                throw new RuntimeException("image upload failed", e);
            }

        }
        productDao.editProduct(product);

        return "redirect:/admin/productinventory";

    }
}
