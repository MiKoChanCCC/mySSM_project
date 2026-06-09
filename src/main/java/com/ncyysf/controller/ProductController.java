package com.ncyysf.controller;

import com.ncyysf.entity.Product;
import com.ncyysf.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;


    @GetMapping("/list")
    public String list(Model model) {
        List<Product> productList = productService.getAllProducts();
        model.addAttribute("productList", productList);
        return "list";
    }


    @GetMapping("/toAdd")
    public String toAdd() {
        return "add";
    }


    @PostMapping("/add")
    public String add(Product product, RedirectAttributes ra) {
        if (product.getCreateTime() != null && product.getCreateTime().after(new Date())) {
            ra.addFlashAttribute("errorMsg", "上架时间不能晚于当前时间");
            return "redirect:/product/toAdd";
        }
        productService.addProduct(product);
        return "redirect:/product/list";
    }


    @GetMapping("/toEdit/{id}")
    public String toEdit(@PathVariable("id") Long id, Model model) {
        Product product = productService.getProductById(id);
        model.addAttribute("product", product);
        return "edit";
    }


    @PostMapping("/update")
    public String update(Product product, RedirectAttributes ra) {
        if (product.getCreateTime() != null && product.getCreateTime().after(new Date())) {
            ra.addFlashAttribute("errorMsg", "上架时间不能晚于当前时间");
            return "redirect:/product/toEdit/" + product.getId();
        }
        productService.updateProduct(product);
        return "redirect:/product/list";
    }


    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") Long id) {
        productService.deleteProduct(id);
        return "redirect:/product/list";
    }
}
